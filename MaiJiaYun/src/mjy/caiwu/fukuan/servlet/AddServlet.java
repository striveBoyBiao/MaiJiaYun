package mjy.caiwu.fukuan.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections.map.HashedMap;

import mjy.caiwu.fukuan.beans.FuKuanVo;
import mjy.caiwu.fukuan.beans.FuKuanZhVo;
import mjy.caiwu.fukuan.service.AddFuKuanService;
import mjy.caiwu.fukuan.service.GetBankService;
import mjy.caiwu.fukuan.service.impl.AddFuKuanServiceImpl;
import mjy.caiwu.fukuan.service.impl.GetBankServiceImpl;
import mjy.caiwu.jichuziliao.po.ShouZhiTypePO;
import mjy.caiwu.jichuziliao.service.ShouZhiTypeService;
import mjy.caiwu.jichuziliao.service.impl.ShouZhiTypeServiceImpl;
import mjy.caiwu.jichuziliao.vo.ShouZhiTypeVO;
import mjy.common.servlet.BaseServlet;
import mjy.login.beans.vo.UserInfoVO;
/**
 * 添加应付单
 * @author student
 *
 */
@WebServlet("/mjy/caiwu/fukuan/servlet/AddServlet")
public class AddServlet extends BaseServlet{
	/*
	 * 表单提交servlet，向数据库提交
	 */
	public String addFuKuan (HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//接收数据
				String payerName = request.getParameter("payerName");// 收款人
				String payerNickName = request.getParameter("payerNickName");// 收款人昵称
				String receivableAmount = request.getParameter("receivableAmount");// 应付款
				String accountId = request.getParameter("copyYinhang");// 开户机构
				String accountNumber = request.getParameter("accountNumber");// 账号
				String receivedAmount = request.getParameter("receivedAmount");// 付款额
				String frType = request.getParameter("copyshouzhi");// 单据相关
				String relatedCode = request.getParameter("relatedCode");// 相关单据号
				String memo = request.getParameter("memo");// 备注
				
				
				
				//获得fkCreaterId
				HttpSession session=request.getSession();
				UserInfoVO userInfoVO=(UserInfoVO) session.getAttribute("userInfoVO");
				Integer fkCreaterId=userInfoVO.getUserPO().getUserId();
				Integer bossId=userInfoVO.getBossPO().getUserID();
				//银行默认账户ID的转换
				GetBankService getBankService=new GetBankServiceImpl();
				List<FuKuanZhVo> list=getBankService.listByBank(bossId.intValue());
				String defaultID=getBankService.getDefaultByID(list, accountNumber);
				
				// 收支类型装换
				AddFuKuanService addFuKuanService = new AddFuKuanServiceImpl();
				ShouZhiTypeService shouZhiTypeService = new ShouZhiTypeServiceImpl();
				ShouZhiTypePO sPO = new ShouZhiTypePO();//空的PO
				List<ShouZhiTypeVO> shouZhiType = new ArrayList<ShouZhiTypeVO>();
				shouZhiType = shouZhiTypeService.listBy(sPO);
				Integer shouzhiID=addFuKuanService.getIdByName(shouZhiType,frType);
				String time=addFuKuanService.getCreatTime();
				
				
				// 将要插入的最后数据封装
				FuKuanVo fuKuanVo = new FuKuanVo();
				FuKuanZhVo fuKuanZhVo = new FuKuanZhVo();
				fuKuanVo.setFkSkName(payerName);
				fuKuanVo.setFkSkNickName(payerNickName);
				fuKuanVo.setFkShouldpayMoney(Double.parseDouble(receivableAmount));
				fuKuanVo.setFkzhDafaultId(defaultID.toString());
				fuKuanVo.setFkPayMoney(Double.parseDouble(receivedAmount));
				fuKuanVo.setFkCreaterTime(time);
				fuKuanVo.setFkCreaterId(fkCreaterId);
				fuKuanVo.setFkShouzhilxId(shouzhiID);
				fuKuanVo.setFkNo(relatedCode);
				fuKuanVo.setFkRemark(memo);
				
				//调用service层方法插入数据
				addFuKuanService.addFuKuan(fuKuanVo);
		return "r:/servlet/cw/fukuan/ShouldPayServlet?method=showAllData";
	}
	
	
	/*
	 * Ajax检查银行账户是否存在
	 */
	public void bankidCheck (HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 返回数据类型
				response.setContentType("application/json;charset=utf-8");
				String accountNumber = request.getParameter("accountNumber");
				String yinhang = request.getParameter("yinhang");
				// {message:xxxxx}
				PrintWriter out = response.getWriter();
				boolean isExit=false;
				GetBankService getBankService = new GetBankServiceImpl();
				if(!yinhang.equals("")&&yinhang!=null){
					isExit=getBankService.idIsExit(accountNumber,yinhang);
				}else{
					isExit=false;
				}
				if (!isExit) {
					out.println("{\"message\":\"" + "账户不存在!\"}");
				} else {
					out.println("{\"message\":\"账户可用\"}");
				}
	}
	
	
	/*
	 * 获得所有的下拉框所需银行，和收支类型的数据
	 */
	public String pageJumpAfk (HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//从数据库中获得收支类型的数据
				ShouZhiTypeService shouZhiTypeService = new ShouZhiTypeServiceImpl();
				ShouZhiTypePO sPO = new ShouZhiTypePO();
				List<String> list = new ArrayList<>();
				List<ShouZhiTypeVO> shouZhiType = new ArrayList<ShouZhiTypeVO>();
				sPO.setStatus("启用");
				shouZhiType=shouZhiTypeService.listBy(sPO);
				for (ShouZhiTypeVO shouZhiTypeVO2 : shouZhiType) {
					list.add(shouZhiTypeVO2.getShouzhilxType());
				}
				
				//获得bossId
				HttpSession session=request.getSession();
				UserInfoVO userInfoVO=(UserInfoVO) session.getAttribute("userInfoVO");
				Integer bossId=userInfoVO.getBossPO().getUserID();
				
				//获取银行数据
				FuKuanZhVo fuKuanZhVo = new FuKuanZhVo();
				GetBankService getBankService=new GetBankServiceImpl();
				List<FuKuanZhVo> banklist = new ArrayList<>();//所有的银行数据
				Map<String,String> bankName = new HashedMap();//无重复的银行名称
				List<String> testName = new ArrayList<>();
				List<String> bankID = new ArrayList<>();//银行卡ID
				banklist=getBankService.listByBank(bossId.intValue());
				bankName=getBankService.getAllBank(banklist);
				for (String stri : bankName.keySet()) {
					testName.add(stri);
				}
				//将银行的name做一个去重复
				 request.setAttribute("shouzhilxType", list);
				 request.setAttribute("accountBank", bankName);
		
		return "f:/caiwu/fukuan/jsp/addFuKuan.jsp";
	}
}
