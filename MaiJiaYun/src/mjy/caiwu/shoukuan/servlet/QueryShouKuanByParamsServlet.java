package mjy.caiwu.shoukuan.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mjy.caiwu.jichuziliao.po.ShouZhiTypePO;
import mjy.caiwu.jichuziliao.service.FuKuanAccountService;
import mjy.caiwu.jichuziliao.service.ShouZhiTypeService;
import mjy.caiwu.jichuziliao.service.impl.FuKuanAccountServiceImpl;
import mjy.caiwu.jichuziliao.service.impl.ShouZhiTypeServiceImpl;
import mjy.caiwu.jichuziliao.vo.FuKuanAccountVO;
import mjy.caiwu.jichuziliao.vo.ShouZhiTypeVO;
import mjy.caiwu.shoukuan.beans.CwPageInfo;
import mjy.caiwu.shoukuan.beans.CwShouKuanPO;
import mjy.caiwu.shoukuan.beans.CwShouKuanVO;
import mjy.caiwu.shoukuan.service.CwShouKuanService;
import mjy.caiwu.shoukuan.service.impl.CwShouKuanServiceImpl;
import mjy.common.servlet.BaseServlet;
import mjy.login.beans.vo.UserInfoVO;
import net.sf.json.JSONArray;

/**
 * Servlet implementation class QueryShouZhiLeiXingServlet
 */
@WebServlet("/servlet/cw/queryShouKuanByParams")
public class QueryShouKuanByParamsServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
	/*
	 * 标记是否选择收支类型
	 */
	private static String shouzhilxIdMark = "";

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
//	protected void doGet(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//		String method = request.getParameter("method");
//		if (method.equals("queryShouKuan")) {
//			queryShouKuan(request, response);
//		} else if (method.equals("queryShouZhiLeiXing")) {
//			queryShouZhiLeiXing(request, response);
//		}else if(method.equals("addShouKuan")){
//			addShouKuan(request, response);
//		}else if(method.equals("shouKuanOrHuaiZ")){
//			shouKuanOrHuaiZ(request, response);
//		}else if(method.equals("updateShouKuanXiangQing")){
//			updateShouKuanXiangQing(request, response);
//		}
//	}
	/**
	 * 查询收款表
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void queryShouKuan(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("application/json;charset=utf-8");

		// System.out.println(shouzhilxId);
		// 获取请求参数
		String pageSize = request.getParameter("pageSize") == null || request.getParameter("pageSize") == "" ? "10"
				: request.getParameter("pageSize");
		String pageNo = request.getParameter("pageNo") == null || request.getParameter("pageNo") == "" ? "1"
				: request.getParameter("pageNo");
		String shouzhilxId = request.getParameter("shouzhilxId");
		String skState = request.getParameter("skState");
		String param = request.getParameter("param");
		// 封装请求参数
		CwShouKuanPO cwShouKuanPO = new CwShouKuanPO();
		if (skState != null) {
			cwShouKuanPO.setSkState(Integer.parseInt(skState));
		}
		if(shouzhilxId==null){
			if(!shouzhilxIdMark.equals("")){
				cwShouKuanPO.setShouzhilxId(Integer.parseInt(shouzhilxIdMark));
			}
		}else{
			if(!shouzhilxId.equals("")){
				shouzhilxIdMark = shouzhilxId;
				cwShouKuanPO.setShouzhilxId(Integer.parseInt(shouzhilxId));
			}else{		
				shouzhilxIdMark="";
			}
		}
		if (param != null && param != "") {
			cwShouKuanPO.setParam(param);
		}
		//获取bossid
		UserInfoVO userInfoVO = (UserInfoVO) request.getSession().getAttribute("userInfoVO");
		int userID  = userInfoVO.getBossPO().getUserID();
		if(userID!=0){
			cwShouKuanPO.setUserId(userID+"");
		}
		CwPageInfo<CwShouKuanVO> page1 = new CwPageInfo<>();
		page1.setPageSize(Integer.parseInt(pageSize), pageNo);
		cwShouKuanPO.setRowStart(page1.getPageBegin());
		// 执行业务模型
		CwShouKuanService cwShouKuanService = new CwShouKuanServiceImpl();
		CwPageInfo<CwShouKuanVO> pageInfo = cwShouKuanService.listByPage(cwShouKuanPO, page1);
		PrintWriter out = response.getWriter();
		JSONArray jsonArray = JSONArray.fromObject(pageInfo);
		out.println(jsonArray.toString());

	}
	/**
	 * 修改表的状态,已收款或坏账
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void shouKuanOrHuaiZ(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("application/json;charset=utf-8");
		CwShouKuanVO cw=new CwShouKuanVO();
		cw.setSkId(Integer.valueOf(request.getParameter("skId")));		
		cw.setSkState(Integer.valueOf(request.getParameter("skState")));
		CwShouKuanService cwShouKuanService=new CwShouKuanServiceImpl();
		UserInfoVO userInfoVO=(UserInfoVO)request.getSession().getAttribute("userInfoVO");
		cw.setSkOperatorId(userInfoVO.getUserPO().getUserId()+"");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		cw.setSkOperationDate(sdf.format(new Date()));
		cwShouKuanService.update(cw);
		PrintWriter out = response.getWriter();
		out.println("{\"success\":\"ok\"}");

	}
	/**
	 * 查询收支类型
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void queryShouZhiLeiXing(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("application/json;charset=utf-8");
		/*
		 * 查询所有收支类型
		 */
		ShouZhiTypeService shouZhiTypeService = new ShouZhiTypeServiceImpl();
		List<ShouZhiTypeVO> shouZhiTypes = shouZhiTypeService.listBy(new ShouZhiTypePO());
		JSONArray jsonArray = JSONArray.fromObject(shouZhiTypes);
		PrintWriter out = response.getWriter();
		out.println(jsonArray.toString());

	}
	/**
	 * 更新详情
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void updateShouKuanXiangQing(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("application/json;charset=utf-8");
		//获取参数
		String skBeiZhu = request.getParameter("skBeiZhu");
		String skReceivable = request.getParameter("skReceivable");
		String fkzhBankId = request.getParameter("fkzhBankId");
		String skId =  request.getParameter("skId");
//		System.out.println(skId+" "+fkzhBankId+" "+skReceivable+" "+skBeiZhu);
		CwShouKuanService cwShouKuanService  = new CwShouKuanServiceImpl();
		CwShouKuanVO cwShouKuanVO = new CwShouKuanVO();
		cwShouKuanVO.setSkBeiZhu(skBeiZhu);
		cwShouKuanVO.setSkReceivable(Double.parseDouble(skReceivable));
		cwShouKuanVO.setFkzhBankId(fkzhBankId);
		cwShouKuanVO.setSkId(Integer.valueOf(skId));
		cwShouKuanService.update(cwShouKuanVO);
		PrintWriter out=response.getWriter();
		JSONArray jsonArray =JSONArray.fromObject(null);
		out.println(jsonArray.toString());

	}
	/**
	 * 添加收款单
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public String addShouKuan(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		CwShouKuanService BaoCun = new CwShouKuanServiceImpl();
		CwShouKuanVO cw = new CwShouKuanVO();

		// 付款人
		cw.setSkPayerName(request.getParameter("payerName"));
		// 付款人昵称
		cw.setSkPayerNickname(request.getParameter("payerNickName"));
		// System.out.println(request.getParameter("payerNickName"));
		// System.out.println("************");
		// 应付款
		// System.out.println(request.getParameter("receivableAmount"));
		cw.setSkPayables(Double.parseDouble(request.getParameter("receivableAmount")));
		// 收款人开户银行 Id
		cw.setFkzhBankId(String.valueOf(request.getParameter("accountnumber")));
		// 应收款
		cw.setSkReceivable(Double.parseDouble(request.getParameter("receivedAmount")));
		// 收支类型
		// System.out.println(request.getParameter("shouzhilxID"));
		cw.setShouzhilxId(Integer.valueOf(request.getParameter("shouzhilxID")));

		// 相关单据号
		cw.setSkReceiptsCode(request.getParameter("relatedCode"));

		// 备注
		cw.setSkBeiZhu(request.getParameter("memo"));
		// 创建人
		UserInfoVO userInfoVO = (UserInfoVO) request.getSession().getAttribute("userInfoVO");
		cw.setSkCreator(userInfoVO.getUserPO().getUserId() + "");
		// 创建时间
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

		cw.setSkCreateDate(sdf.format(new Date()));

		// 状态
		cw.setSkState(0);
		// 向数据库中插入保存数据
		BaoCun.BaoCun(cw);

		return "r:/servlet/cw/shouKuan";
	}
	
	
}
