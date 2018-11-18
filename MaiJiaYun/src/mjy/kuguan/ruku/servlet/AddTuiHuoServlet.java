package mjy.kuguan.ruku.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mjy.login.beans.vo.UserInfoVO;

/**
 * Servlet implementation class AddTuiHuoServlet
 */
@WebServlet("/AddTuiHuoServlet")
public class AddTuiHuoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddTuiHuoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserInfoVO ui =(UserInfoVO) request.getSession().getAttribute("userInfoVO");
		int id = ui.getBossPO().getUserID();
		
		String TuihuoID =  request.getParameter("TuihuoNote");
		TuihuoID = request.getParameter("actualQuantities0");
	/*	System.out.println( request.getParameter("TuihuoNote"));
		System.out.println(TuihuoID);
		System.out.println( request.getParameter("actualQuantities1"));*/
		response.sendRedirect("/Mai/ReturnSales");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
