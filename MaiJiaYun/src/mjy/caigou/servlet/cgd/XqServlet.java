package mjy.caigou.servlet.cgd;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mjy.caigou.dao.PurchaseDao;
import mjy.caigou.dao.impl.PurchaseXqDaoImpl;
import mjy.caigou.po.DetailsPO;

/**
 * Servlet implementation class XqServlet
 */
@WebServlet("/caigou/servlet/XqServlet")
public class XqServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 获取从界面传过来的采购单编号
		String PurchaseCode= request.getParameter("PurchaseCode");
		//创建对象  
		DetailsPO detailsPO= new DetailsPO();
		PurchaseDao ps= new PurchaseXqDaoImpl();
		// 调用方法 查出采购单变和我们传进来的采购单编号一样的数据
		List<DetailsPO> list=ps.listByXQ(detailsPO, PurchaseCode);
	
		request.setAttribute("list", list);
		// 然后请求转发
		request.getRequestDispatcher("/CaiGou/jsp/cgd/xq.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
