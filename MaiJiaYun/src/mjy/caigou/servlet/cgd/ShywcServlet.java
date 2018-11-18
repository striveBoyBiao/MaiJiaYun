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
		//1 ��ȡ����		
		UserInfoVO userInfoVo=(UserInfoVO)request.getSession().getAttribute("userInfoVO");
		PurchasePO purchasePo=new PurchasePO();
		PurchaseVO purchasVo=new PurchaseVO();
		//��ȡuserID
		Integer userID=userInfoVo.getBossPO().getUserID();
		
		//��ȡ��ѯ�����
		String  purchaseCode= request.getParameter("q");
		System.out.println("q="+ purchaseCode);
				
		String pageNum=request.getParameter("pageNo")==null?"1":request.getParameter("pageNo");
		System.out.println("pageNum:"+pageNum);
		
		String pSize = request.getParameter("pSize")==null? "10":request.getParameter("pSize");//10
		Integer pageSize = Integer.parseInt(pSize);
		System.out.println("pSize:"+pSize);
	
		//��װ������� PO 
		purchasePo.setUserId(userID);//10001
		purchasePo.setState("3");
		purchasePo.setPurchaseCode(purchaseCode);
	
		PageInfo<PurchaseVO> page = new PageInfo<>(pageNum) ;
		page.setPageSize(pageSize);
		System.out.println("pSize:"+page.getPageSize());
		purchasePo.setRowStart(page.getPageBegin());
		System.out.println( "rowStart:"+purchasePo.getRowStart());
		//2ִ��ҵ��ģ��
		PurchaseService purchaseService = new PurchaseServiceImpl();
		PageInfo<PurchaseVO> pageInfo=purchaseService.listByPage(purchasePo, page);	
		
		request.setAttribute("pageInfo", pageInfo);
		
		//ѡ����ͼ����������
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
