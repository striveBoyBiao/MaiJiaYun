package mjy.caigou.servlet.cgthd;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class cgthdServlet
 */
@WebServlet("/servlet/caigou/cgthdServlet")
public class cgthdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
 		String method = request.getParameter("method")==null?"0":request.getParameter("method");
		//跳转到新增采购退货单
		if(method.equals("1")){
			request.getRequestDispatcher("/CaiGou/jsp/cgthd/caigoutuihuoadd.jsp").forward(request,
					response);
			//跳转到 “待审核详情”
		}else if(method.equals("2")){
			request.getRequestDispatcher("/CaiGou/jsp/cgthd/caigoutuihuoedit.jsp").forward(request,
					response);
			//跳转到“已审核详情”
		}else if(method.equals("3")){
			request.getRequestDispatcher("/CaiGou/jsp/cgthd/caigoutuihuoshow.jsp").forward(request,
					response);
		}else{
			request.getRequestDispatcher("/CaiGou/jsp/cgthd/caigoutuihuo.jsp").forward(request,
					response);
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
