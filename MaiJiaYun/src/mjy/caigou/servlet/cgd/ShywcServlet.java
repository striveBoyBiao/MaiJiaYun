package mjy.caigou.servlet.cgd;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mjy.caigou.po.PageInfo;
import mjy.caigou.po.PurchasePO;
import mjy.caigou.service.PurchaseService;
import mjy.caigou.service.impl.PurchaseServiceImpl;
import mjy.caigou.vo.PurchaseVO;
import mjy.login.beans.vo.UserInfoVO;

/**
 * Servlet implementation class ShywcServlet
 */
@WebServlet("/caigou/servlet/ShywcServlet")
public class ShywcServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1 获取请求		
		UserInfoVO userInfoVo=(UserInfoVO)request.getSession().getAttribute("userInfoVO");
		PurchasePO purchasePo=new PurchasePO();
		PurchaseVO purchasVo=new PurchaseVO();
		//获取userID
		Integer userID=userInfoVo.getBossPO().getUserID();
		
		//获取查询框参数
		String  purchaseCode= request.getParameter("q");
		System.out.println("q="+ purchaseCode);
				
		String pageNum=request.getParameter("pageNo")==null?"1":request.getParameter("pageNo");
		System.out.println("pageNum:"+pageNum);
		
		String pSize = request.getParameter("pSize")==null? "10":request.getParameter("pSize");//10
		Integer pageSize = Integer.parseInt(pSize);
		System.out.println("pSize:"+pSize);
	
		//封装请求参数 PO 
		purchasePo.setUserId(userID);//10001
		purchasePo.setState("3");
		purchasePo.setPurchaseCode(purchaseCode);
	
		PageInfo<PurchaseVO> page = new PageInfo<>(pageNum) ;
		page.setPageSize(pageSize);
		System.out.println("pSize:"+page.getPageSize());
		purchasePo.setRowStart(page.getPageBegin());
		System.out.println( "rowStart:"+purchasePo.getRowStart());
		//2执行业务模型
		PurchaseService purchaseService = new PurchaseServiceImpl();
		PageInfo<PurchaseVO> pageInfo=purchaseService.listByPage(purchasePo, page);	
		
		request.setAttribute("pageInfo", pageInfo);
		
		//选择视图，呈现数据
		request.getRequestDispatcher("/CaiGou/jsp/cgd/shywc.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
