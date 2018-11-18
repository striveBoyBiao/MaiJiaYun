package mjy.caiwu.fukuan.servlet;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mjy.caiwu.fukuan.beans.FuKuanPO;
import mjy.caiwu.fukuan.beans.FuKuanVo;
import mjy.caiwu.fukuan.beans.FuKuanZhVo;
import mjy.caiwu.fukuan.beans.PageInfo;
import mjy.caiwu.fukuan.service.Bad_payService;
import mjy.caiwu.fukuan.service.GetBankService;
import mjy.caiwu.fukuan.service.impl.Bad_payServiceImpl;
import mjy.caiwu.fukuan.service.impl.GetBankServiceImpl;
import mjy.caiwu.jichuziliao.po.ShouZhiTypePO;
import mjy.caiwu.jichuziliao.service.ShouZhiTypeService;
import mjy.caiwu.jichuziliao.service.impl.ShouZhiTypeServiceImpl;
import mjy.caiwu.jichuziliao.vo.ShouZhiTypeVO;
import mjy.common.servlet.BaseServlet;
import mjy.login.beans.vo.UserInfoVO;

/**
 * 坏账
 */
@WebServlet("/servlet/cw/fukuan/bad_pay")
public class Bad_payServlet extends BaseServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * 财务-坏账界面的所有数据
	 * @param request
	 * @param response
	 * @return
	 */
	public String showAllData(HttpServletRequest request, HttpServletResponse response){	
		HttpSession loginSession = request.getSession();
		UserInfoVO userInfo = (UserInfoVO) loginSession.getAttribute("userInfoVO");
		int bossId = userInfo.getBossPO().getUserID();
		
		String keyword = request.getParameter("keyword");
		String shouzhiTypeId = request.getParameter("shouzhiTypeId");
		String pageSize = request.getParameter("pageSize")==null?"10":request.getParameter("pageSize");
		String pageNo = request.getParameter("pageNo")==null?"1":request.getParameter("pageNo");
		PageInfo<FuKuanVo> page=new PageInfo<>(pageNo);
		page.setPageSize(Integer.parseInt(pageSize));
		
		FuKuanPO fukuanPo = new FuKuanPO();
		fukuanPo.setKeyword(keyword);
		fukuanPo.setShouzhiTypeId(shouzhiTypeId);
		
		Bad_payService bad_pay = new Bad_payServiceImpl();	
		PageInfo<FuKuanVo> pageInfo = bad_pay.showPagination(fukuanPo, page,bossId);
		request.setAttribute("pageInfo", pageInfo);	
		
		ShouZhiTypeService  szlx = new ShouZhiTypeServiceImpl();
		List<ShouZhiTypeVO> szlxs = szlx.listBy(new ShouZhiTypePO());
		request.setAttribute("szlxs", szlxs);

		return "f:/caiwu/fukuan/jsp/bad_pay.jsp";
	}
	/**
	 * 财务-坏账界面的详情的所有数据
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String bad_payDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String fkNo = request.getParameter("fkNo");
		Bad_payService bad_pay = new Bad_payServiceImpl();		
		GetBankService getBank = new GetBankServiceImpl();	
		List<FuKuanVo> bad_pays = bad_pay.listbyDetail(fkNo);
		for (FuKuanVo bad: bad_pays) {
			if(bad.getFkzhDafaultId()==null || bad.getFkzhDafaultId().equals("")){
				bad.setOther3("");
				bad.setOther5("");
			}else{
				List<FuKuanZhVo> lists = getBank.getBankIdAndBankName(bad.getFkzhDafaultId());
					bad.setOther3(lists.get(0).getFkzhBankId());
					bad.setOther5(lists.get(0).getFkzhBankName());
			}
		}
		request.setAttribute("bad_pays", bad_pays);		
		return "f:/caiwu/fukuan/jsp/bad_paydetail.jsp";
	}
}
