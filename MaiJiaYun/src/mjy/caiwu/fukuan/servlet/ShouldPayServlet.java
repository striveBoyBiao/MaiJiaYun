package mjy.caiwu.fukuan.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mjy.caiwu.fukuan.beans.FuKuanPO;
import mjy.caiwu.fukuan.beans.FuKuanVo;
import mjy.caiwu.fukuan.beans.FuKuanZhVo;
import mjy.caiwu.fukuan.beans.PageInfo;
import mjy.caiwu.fukuan.service.GetBankService;
import mjy.caiwu.fukuan.service.ShouldpayService;
import mjy.caiwu.fukuan.service.impl.GetBankServiceImpl;
import mjy.caiwu.fukuan.service.impl.ShouldpayServiceImpl;
import mjy.caiwu.jichuziliao.po.ShouZhiTypePO;
import mjy.caiwu.jichuziliao.service.ShouZhiTypeService;
import mjy.caiwu.jichuziliao.service.impl.ShouZhiTypeServiceImpl;
import mjy.caiwu.jichuziliao.vo.ShouZhiTypeVO;
import mjy.common.servlet.BaseServlet;
import mjy.login.beans.vo.UserInfoVO;

/**
 * 应付款
 * @author student
 *
 */
@WebServlet("/servlet/cw/fukuan/ShouldPayServlet")
public class ShouldPayServlet extends BaseServlet{

	public String showAllData(HttpServletRequest request, HttpServletResponse response){
		String pageSize=request.getParameter("pageSize");//ÿҳ��¼��
		request.setAttribute("pageSize", pageSize);
		
		/*
		 * 设置页面显示条数
		 */
		int pageCount=0;
		if(pageSize!=null){
			pageCount=Integer.parseInt(pageSize);
		}else{
			pageCount=10;
		}
		request.setAttribute("pageCount", pageCount);
		//设置第几页
		String pageNo=request.getParameter("pageNo")==null?"1":request.getParameter("pageNo");

		String search=request.getParameter("keyword");//获得查询的关键字
		FuKuanPO fkp=new FuKuanPO();
		fkp.setKeyword(search);
		
		String szTypeId=request.getParameter("shouzhiTypeId");//获得查询的收支类型
		request.setAttribute("szTypeId", szTypeId);
		fkp.setShouzhiTypeId(szTypeId);
		
		PageInfo<FuKuanVo> page=new PageInfo<>(pageNo);
		page.setPageSize(pageCount);
		fkp.setRowstart(page.getPageBegin());//设置显示的第一条
		
		ShouldpayService sps=new ShouldpayServiceImpl();
		
		HttpSession session=request.getSession();
		UserInfoVO userInfoVO=(UserInfoVO) session.getAttribute("userInfoVO");
		int bossId=userInfoVO.getBossPO().getUserID();
		
		PageInfo<FuKuanVo> pageInfo=sps.showPagination(fkp, page, 2,bossId);
		request.setAttribute("pageInfo", pageInfo);
		List<FuKuanVo> shouldpayvo=pageInfo.getPageDate();
		request.setAttribute("shouldpayvo", shouldpayvo);
		
		int count=sps.getCount(fkp, 2,bossId);//获得总条数
		request.setAttribute("count", count);
		
		ShouZhiTypePO spo=new ShouZhiTypePO();
		ShouZhiTypeService szts=new ShouZhiTypeServiceImpl();
		List<ShouZhiTypeVO> shouzhiType=szts.listBy(spo);
		request.setAttribute("shouzhilxType", shouzhiType);
		
		return "f:/caiwu/fukuan/jsp/shouldpay.jsp";
		
	}
	
	/**
	 * 操作坏账
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String operateBadPay(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String fkNo=request.getParameter("fkNo");
		FuKuanVo spv=new FuKuanVo();
		spv.setFkNo(fkNo);
		
		ShouldpayService sps=new ShouldpayServiceImpl();
		sps.Bad_Pay(spv);
		
		return "r:/servlet/cw/fukuan/ShouldPayServlet?method=showAllData";
	}
	
	/**
	 * 操作付款
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public String operatePay(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String fkNo=request.getParameter("fkNo");
		FuKuanVo spv=new FuKuanVo();
		spv.setFkNo(fkNo);
		ShouldpayService sps=new ShouldpayServiceImpl();
		sps.Pay(spv);
		
		HttpSession session=request.getSession();
		UserInfoVO userInfoVO=(UserInfoVO) session.getAttribute("userInfoVO");
		Integer userId=userInfoVO.getUserPO().getUserId();
		sps.updateCaigouState("已付款", fkNo,userId);
		return "r:/servlet/cw/fukuan/ShouldPayServlet?method=showAllData";
	}
	
	/**
	 * 详情页面显示
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws ServletException 
	 */
	public String shouldpayDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{

		String fkNo=request.getParameter("fkNo");//获得相关单据号
		
		ShouldpayService sps=new ShouldpayServiceImpl();
		List<FuKuanVo> shouldpayvo=sps.getDetailDate(fkNo);
		
		FuKuanVo spv=shouldpayvo.get(0);
		request.setAttribute("spv", spv);
		
		//获取相关银行账号
		GetBankService gbs=new GetBankServiceImpl();
		
		HttpSession session=request.getSession();
		UserInfoVO userInfoVO=(UserInfoVO) session.getAttribute("userInfoVO");
		int bossId=userInfoVO.getBossPO().getUserID();
		
		List<FuKuanZhVo> list=gbs.listByBank(bossId);
		Map<String,String> bankInformation=new HashMap<>();
		bankInformation=gbs.getAllBank(list);
		
		request.setAttribute("map", bankInformation);//银行名称和银行账号
		
		request.setAttribute("fkNo", fkNo);
		
		List<FuKuanZhVo> bankId=gbs.getBankId(fkNo);
		request.setAttribute("bankId", bankId);//获得付款的银行账号
		return "f:/caiwu/fukuan/jsp/shouldpaydetails.jsp";
	}
	
	/**
	 * 详情页面信息提交
	 * @return
	 */
	public String submitDetail(HttpServletRequest request, HttpServletResponse response){
		String BankAccountId=request.getParameter("accountNumber");//获得银行账号
		
		//获得默认账号
		GetBankService getBankService=new GetBankServiceImpl();
		
		HttpSession session=request.getSession();
		UserInfoVO userInfoVO=(UserInfoVO) session.getAttribute("userInfoVO");
		int bossId=userInfoVO.getBossPO().getUserID();
		List<FuKuanZhVo> list=getBankService.listByBank(bossId);
		String defaultID=getBankService.getDefaultByID(list, BankAccountId);
		
		String payMoney=request.getParameter("receivedAmount");//付款额
		
		String fkNo=request.getParameter("fkNo");
		
		if(payMoney==null||payMoney.equals("")){
			payMoney="0.00";
		}
		
		FuKuanVo fkv=new FuKuanVo();
		fkv.setFkPayMoney(Double.parseDouble(payMoney));
		fkv.setFkzhDafaultId(defaultID);
		fkv.setFkNo(fkNo);
		
		ShouldpayService sps=new ShouldpayServiceImpl();
		sps.insertPayMoney(fkv);//将付款额插入数据库
		sps.updateBankAccount(fkv);//更改付款的银行信息
		
		return "r:/servlet/cw/fukuan/ShouldPayServlet?method=showAllData";
	}
}
