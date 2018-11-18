package mjy.login.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mjy.common.servlet.BaseServlet;
import mjy.login.beans.vo.ForgetInfoVO;
import mjy.login.dao.UserDao;
import mjy.login.dao.impl.UserDaoImpl;
import mjy.login.util.EmailCheck;

/**
 * Servlet implementation class ForgetEmailCheckServlet
 */
@WebServlet("/ForgetEmailCheckServlet")
public class ForgetEmailCheckServlet extends BaseServlet {

	public void sendEmail(HttpServletRequest request, HttpServletResponse response){
		try {
			EmailCheck.sendEmail(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void emailCheck(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("application/json;charset=utf-8");
			
		String emailnum = (String) request.getSession().getAttribute("emailnum");
		String emailcode = request.getParameter("emailcode");
		
		String str = "";

		PrintWriter out=response.getWriter();

		if(emailcode.equals(emailnum)){
			str="ok";
		}else{
			str="验证码输入错误或已失效!";
		}
		
		out.println("{\"retu\":\""+str+"\"}");
	}

	public void userCheck(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("application/json;charset=utf-8");
		
		String identifier = request.getParameter("identifier");		
		String st="";
		
		UserDaoImpl us = new UserDaoImpl();
		PrintWriter out=response.getWriter();
	
		if(us.emailExistCheck(identifier.trim())){
			st="ok";
		}else{
			st="此账号还未注册过!";
		}
		out.println("{\"ret\":\""+st+"\"}");
	}

	public void changPwd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String identifier = request.getParameter("identifier");
		String password = request.getParameter("password");
		
		UserDao userDao = new UserDaoImpl();
		ForgetInfoVO forgetInfo = new ForgetInfoVO();
		
		forgetInfo.setEmail(identifier);
		forgetInfo.setPassword(password);
		
		userDao.updateUser(forgetInfo);
	}

}
