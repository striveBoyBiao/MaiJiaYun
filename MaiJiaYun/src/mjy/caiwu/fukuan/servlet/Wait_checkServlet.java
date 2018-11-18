package mjy.caiwu.fukuan.servlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import mjy.caiwu.fukuan.beans.FuKuanVo;
import mjy.caiwu.fukuan.beans.Spring;
import mjy.caiwu.fukuan.beans.WaitCheckCgPO;
import mjy.caiwu.fukuan.beans.WaitCheckShopPO;
import mjy.caiwu.fukuan.beans.WcPageInfo;
import mjy.caiwu.fukuan.service.WaitCheckCgService;
import mjy.caiwu.fukuan.service.WaitCheckShopService;
import mjy.caiwu.fukuan.service.Wait_checkService;
import mjy.common.servlet.BaseServlet;
import mjy.login.beans.po.BossPO;
import mjy.login.beans.vo.UserInfoVO;

/**
 *待财务审核
 */
@WebServlet("/servlet/cw/Wait_checkServlet")
public class Wait_checkServlet extends BaseServlet {
	
	private static final long serialVersionUID = -2761974273274453965L;
	private Spring spring=new Spring();
	/**
	 * 数据显示
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void waitCheckPage(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json,charset=utf-8");
		//从对象仓库中获取
		Wait_checkService wc =(Wait_checkService) spring.getBeans("wcService");
		
		WcPageInfo<FuKuanVo> waitCheck = null;
		//获取记账或者驳回的 ID
		String param = request.getParameter("param");
		String param2 = request.getParameter("param2");
		//记账操作
		if (param != null) {
			//修改付款单的状态为2
			wc.update(param);
			//修改创建时间
			wc.updateTime(param);
			
			//修改采购单的状态为3
			wc.updataCgState(param);
		}

		//驳回操作
		if (param2 != null) {
			// 删除数据
			wc.delete(param2);
			//修改采购单的状态为1
			wc.updataCaoGou(param2);
		}

		//获取pageSize的大小
		String pageSize = request.getParameter("pageSize");
		if (pageSize != null) {
			WcPageInfo.pageSize = Integer.parseInt(pageSize);
		}
		//获取当前页
		String pageNo = request.getParameter("pageNo") == null ? "1" : request.getParameter("pageNo");
		WcPageInfo<FuKuanVo> pageInfo = new WcPageInfo<FuKuanVo>(pageNo);

		//获取详情的模糊查询数据
		HttpSession session = request.getSession();
		String xqMohu = (String) session.getAttribute("mohu");

		//获取模糊查询数据
		String mohu = request.getParameter("mohu");

		
		UserInfoVO userInfoVO = (UserInfoVO) session.getAttribute("userInfoVO");
		//获取 bossID
		int bossId=0;
		if(userInfoVO!=null){
			BossPO boss = userInfoVO.getBossPO();
			bossId = boss.getUserID();
		}
		
		
		
		
		if (xqMohu != null && xqMohu != "" && mohu == null) {
			//返回上一次的数据
			mohu = xqMohu;
			waitCheck = wc.querySelect(mohu, pageInfo,bossId);
		} else if (mohu != null && mohu != "") {
			//模糊查询
			waitCheck = wc.querySelect(mohu, pageInfo,bossId);
			session.setAttribute("mohu", mohu);
		} else {
			//查询所有数据
			waitCheck = wc.queryFk(pageInfo,bossId);
			session.removeAttribute("mohu");
		}

		PrintWriter out = response.getWriter();
		
		JSONArray jsonArray = JSONArray.fromObject(waitCheck);
		out.println(jsonArray.toString());

	}

	/**
	 *详情
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String xiqing(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		 //从对象仓库中获取
		 WaitCheckCgService wcg = (WaitCheckCgService) spring.getBeans("wccService");
		 WaitCheckShopService wcs = (WaitCheckShopService) spring.getBeans("wcgService");
		 String mohu = request.getParameter("mohu");
			String fkNo = request.getParameter("fkNo");
			HttpSession session = request.getSession();
			String xqMohu = (String) session.getAttribute("mohu");
			//保存上一次的模糊查询
			if (xqMohu != null && xqMohu != "") {
				request.setAttribute("mohu", xqMohu);
				request.setAttribute("fkNo", fkNo);
			} else {
				request.setAttribute("mohu", mohu);
				request.setAttribute("fkNo", fkNo);
			}

			//获取详情数据
			List<WaitCheckCgPO> waitCheckCg = wcg.query(fkNo);
			List<WaitCheckShopPO> waitCheckShop = wcs.query(fkNo);

			request.setAttribute("waitCheckCg", waitCheckCg);
			request.setAttribute("waitCheckShop", waitCheckShop);
		return "f:/caiwu/fukuan/jsp/xq.jsp";
	}
	
	/**
	 * 主界面跳转
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String zhujiemian(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
//		
//		UserInfoVO userInfoVO = (UserInfoVO) session.getAttribute("userInfoVO");
//		//获取 bossID
//		int bossId=0;
//		if(userInfoVO!=null){
//			BossPO boss = userInfoVO.getBossPO();
//			bossId = boss.getUserID();
//		}
		
		
//		
//		String purchaseCode=(String) session.getAttribute("purchaseCode");
//		
//		if(purchaseCode!=null){
//			session.removeAttribute(purchaseCode);
//			// 获取银行id
//			List<Integer> fkzhDafaultId = wc.queryfkzhBankId(bossId);
//			// 查询采购数据
//			List<FuKuanVo> cg = wc.queryCg("purchaseCode");
//			//如果有默认银行卡
//			if (fkzhDafaultId.size() > 0) {
//				for (int i = 0; i < cg.size(); i++) {
//					cg.get(i).setFkzhBankId(fkzhDafaultId.get(0));
//				}
//			}
//			//
//			if (cg.size() > 0) {
//				wc.insert(cg);
//			}
//		}
		
		

		
		
		session.setAttribute("mohu", request.getParameter("mohu"));
		return "f:/caiwu/fukuan/jsp/wait_check.jsp";
	}

}
