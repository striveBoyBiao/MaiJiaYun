package mjy.caiwu.jichuziliao.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mjy.caiwu.jichuziliao.service.FindShopService;
import mjy.caiwu.jichuziliao.service.impl.FindShopServiceImp;
@WebServlet("/Servlet/LoginFukuanzhServlet")
public class LoginFukuanzhServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = "/caiwu/jichuziliao/jsp/fukuanzh.jsp";
		req.getRequestDispatcher(path).forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.doGet(req, resp);
	}
}
