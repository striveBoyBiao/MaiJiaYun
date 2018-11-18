package mjy.kuguan.diaobo.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mjy.kuguan.diaobo.service.DiaobodanService;
import mjy.kuguan.diaobo.service.impl.DiaobodanServiceImpl;

@WebServlet("/WeiwanchengServlet2")
public class WeiwanchengServlet2 extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DiaobodanService diaobodanService=new DiaobodanServiceImpl();
		//diaobodanService.deleteBydiaobostateCode(diaobodanCode);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
