package mjy.kuguan.ruku.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mjy.kuguan.ruku.service.WarehouseService;
import mjy.login.beans.vo.UserInfoVO;



/**
 * Servlet implementation class WarehouseNoSelvet
 */
@WebServlet("/WarehouseNoSelvet")
public class WarehouseNoSelvet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WarehouseNoSelvet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserInfoVO uvo = (UserInfoVO) request.getSession().getAttribute("userInfoVO");
		int id = uvo.getBossPO().getUserID();
		response.setContentType("text/xml;charset=utf-8");
		
		PrintWriter out =  response.getWriter();
		
//		out.println("<messages><message>d</message><message>c</message></messages>");
		WarehouseService ws = new WarehouseService();
		List<String> list = ws.getWareHouse(id);
		
		int len = list.size();
		out.println("<messages>");
		
		for(int i =0;i<len;i++){
			out.println("<message>"+list.get(i)+"</message>");
		}
		out.println("</messages>");
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
