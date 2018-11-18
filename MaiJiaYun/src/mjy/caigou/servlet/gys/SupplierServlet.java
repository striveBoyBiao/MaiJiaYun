package mjy.caigou.servlet.gys;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mjy.caigou.po.SupplierPO;
import mjy.caigou.service.SupplierService;
import mjy.caigou.service.impl.SupplierServiceImpl;
import mjy.caigou.vo.SupplierVO;
import mjy.caigou.beans.gys.PageInfo;
import mjy.login.beans.po.UserPO;
import mjy.login.beans.vo.UserInfoVO;
import net.sf.json.JSONArray;

/**
 * Servlet implementation class SupplierServlet
 */
@WebServlet("/servlet/caigou/SupplierServlet")
public class SupplierServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SupplierServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 根据action来判断是进行什么操作
		String action = request.getParameter("action");
		// 获取供应商Id
		String supplierId = request.getParameter("supplierId") == "" ? null : request.getParameter("supplierId");
		SupplierService supplierService = new SupplierServiceImpl();

		UserInfoVO userInfoVO = (UserInfoVO) request.getSession().getAttribute("userInfoVO");
		UserPO userPO = userInfoVO.getUserPO();
		int userId = userPO.getUserId();

		if (action.equals("0")) {// action未0是进行查询操作
			// 获取公司名称
			String supplierCName = request.getParameter("pageNum") == null
					|| request.getParameter("supplierCName").equals("") ? null : request.getParameter("supplierCName");
			// String supplierId = request.getParameter("supplierId") == "" ?
			// null : request.getParameter("supplierId");
			// 获取当前页面
			Integer pageNum = request.getParameter("pageNum") == null || request.getParameter("pageNum").equals("") ? 1
					: Integer.parseInt(request.getParameter("pageNum"));
			// 获取页面大小
			PageInfo.pageSize = request.getParameter("pageSize") == null || request.getParameter("pageSize").equals("")
					? 10 : Integer.parseInt(request.getParameter("pageSize"));

			response.setContentType("application/json;charset=utf-8");
			PrintWriter out = response.getWriter();

			// SupplierService supplierService = new SupplierServiceImpl();
			SupplierPO supplierPO = new SupplierPO();
			PageInfo<SupplierVO> pageInfo = new PageInfo<>(pageNum);
			// PageInfo.pageSize = 10;

			if (supplierId != null) {
				// 如果supplierId != null，表面进行的是详情操作
				supplierPO.setSupplierId(Integer.parseInt(supplierId));
			}
			supplierPO.setSupplierCName(supplierCName);
			supplierPO.setUserId(userId);

			// 获取页面信息
			pageInfo = supplierService.getPageInfo(supplierPO, pageInfo);
			List<SupplierVO> supplierVOs = pageInfo.getPageData();
			// int totalRecords = pageInfo.getTotalRecords();

			JSONArray jsonArray = JSONArray.fromObject(supplierVOs);
			out.println("{\"datas\":" + jsonArray.toString() + ",\"totalRecords\":\"" + pageInfo.getTotalRecords()
					+ "\",\"pageNum\":\"" + pageInfo.getPageNum() + "\",\"queryUrl\":\"" + pageInfo.getQueryUrl()
					+ "\"}");
			// out.println(jsonArray.toString());

		} else {// action未1表示进行修改操作
			String deleteSupplierId = request.getParameter("deleteSupplierId") == "" ? null
					: request.getParameter("deleteSupplierId");
			String supplierCName = request.getParameter("companyName");
			String supplierCAddress = request.getParameter("companyAddress");
			String supplierLPerson = request.getParameter("legalPerson");
			String supplierLPhone = request.getParameter("legalPhone");
			String supplierLMName = request.getParameter("contactsName");
			String supplierLMMobile = request.getParameter("contactsMobile");
			String supplierLMEmail = request.getParameter("contactsEmail");
			String supplierLMQq = request.getParameter("contactsQq");

			SupplierVO supplierVO = new SupplierVO();
			supplierVO.setSupplierCName(supplierCName);
			supplierVO.setSupplierCAddress(supplierCAddress);
			supplierVO.setSupplierLPerson(supplierLPerson);
			supplierVO.setSupplierLPhone(supplierLPhone);
			supplierVO.setSupplierLMName(supplierLMName);
			supplierVO.setSupplierLMMobile(supplierLMMobile);
			supplierVO.setSupplierLMEmail(supplierLMEmail);
			supplierVO.setSupplierLMQq(supplierLMQq);
			supplierVO.setUserId(userId);
			if (supplierId != null) {
				supplierVO.setSupplierId(Integer.parseInt(supplierId));
				supplierService.updateSupplier(supplierVO);
			} else if (deleteSupplierId != null) {
				supplierService.deleteSupplier(Integer.parseInt(deleteSupplierId));
			} else {
				supplierService.addSupplier(supplierVO);
			}
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
