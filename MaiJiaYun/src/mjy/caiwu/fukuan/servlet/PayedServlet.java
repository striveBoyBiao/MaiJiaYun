package mjy.caiwu.fukuan.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mjy.caiwu.fukuan.beans.FuKuanVo;
import mjy.caiwu.fukuan.beans.FuKuanZhVo;
import mjy.caiwu.fukuan.beans.PageInfo;
import mjy.caiwu.fukuan.beans.PayedPO;
import mjy.caiwu.fukuan.beans.ShouZhilxVo;
import mjy.caiwu.fukuan.dao.GetBankDao;
import mjy.caiwu.fukuan.dao.impl.GetBankDaoImpl;
import mjy.caiwu.fukuan.service.PayedService;
import mjy.caiwu.fukuan.service.impl.PayedServiceImpl;
import mjy.common.servlet.BaseServlet;
import mjy.login.beans.vo.UserInfoVO;

@WebServlet("/servlet/cw/fukuan/PayedServlet")
public class PayedServlet extends BaseServlet{
	
	/**
	 * 已付款页面的数据
	 * @param req
	 * @param resp
	 * @return
	 */

	public String ShowAllData(HttpServletRequest req, HttpServletResponse resp){
		
		PayedService payedService = new PayedServiceImpl();
		PayedPO po = new PayedPO();		
		//获取登录者的信息
		HttpSession hs= req.getSession();
		UserInfoVO user=(UserInfoVO) hs.getAttribute("userInfoVO");
		int userid=user.getBossPO().getUserID();
		po.setBossid(userid);
		//查询所有的收支类型
		List<ShouZhilxVo> sv = payedService.ShowallData(new ShouZhilxVo());
		req.setAttribute("sv", sv);
		//获取页面的大小
		String pagesize = req.getParameter("pagesize");
		if(pagesize!=null){
				req.setAttribute("pagesize", pagesize);
		}
		//获取当前页
		String pageNo=req.getParameter("pageNo")==null?"1":req.getParameter("pageNo");	
		PageInfo <FuKuanVo> page = new PageInfo<>(pageNo);
		if(pagesize!=null){
			 page.setPageSize(Integer.parseInt(pagesize));
		}else{
			 page.setPageSize(10);
		}
		//获取页面上传过来的收支类型的参数
		String shouzhilxId = req.getParameter("shouzhilxId");
		//将收支类型传到页面上
		req.setAttribute("shouzhilxId", shouzhilxId);
		if(shouzhilxId!=null&&shouzhilxId!=""){
			po.setFkShouzhilxId(Integer.parseInt(shouzhilxId));
		}	
		//获取模糊查询的关键字
		String key = req.getParameter("key");
		//将模糊查询关键字传到页面上
		req.setAttribute("key", key);
		if(key!=null&&!key.equals("")){
			po.setKey(key);		
		}
		po.setRowStart(page.getPageBegin());
		PageInfo<FuKuanVo> pageInfo=payedService.listByPage(po,page);
		req.setAttribute("pageInfo", pageInfo);
		return "f:/caiwu/fukuan/jsp/payed.jsp";
	}
	/**
	 * 已付款详情页面的数据
	 */
	public String PayedDetailServlet (HttpServletRequest req, HttpServletResponse resp){
			String fkNo = req.getParameter("fkNo");
			PayedService pv = new PayedServiceImpl();
			GetBankDao gb = new GetBankDaoImpl();
			PayedPO po =new PayedPO();
			po.setFkNo(fkNo);
			FuKuanVo fk = new FuKuanVo();
			fk.setFkNo(fkNo);
			List<FuKuanVo> fv = pv.listBy(fkNo);
			
		    for (FuKuanVo fuKuanVo : fv) {
				if(fuKuanVo.getFkzhDafaultId()==null){
					fuKuanVo.setOther5("");
					fuKuanVo.setOther1("");
				
				}else{
					List<FuKuanZhVo> fv1 = gb.getBankIdAndBankName(fuKuanVo.getFkzhDafaultId());
					for (FuKuanZhVo fuKuanZhVo : fv1) {
						fuKuanVo.setOther5(fuKuanZhVo.getFkzhBankId());
						fuKuanVo.setOther1(fuKuanZhVo.getFkzhBankName());
						
					}
				}
			}
			req.setAttribute("fv",fv );
			return"f:/caiwu/fukuan/jsp/payeddetail.jsp";
			
	}
}
