package mjy.login.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mjy.login.beans.vo.LoginInfoVO;
import mjy.login.beans.vo.PostVO;
import mjy.login.beans.vo.UserInfoVO;
import mjy.login.service.PostLimitService;
import mjy.login.service.UserInfoService;
import mjy.login.service.Impl.PostLimitServiceImpl;
import mjy.login.service.Impl.UserInfoServiceImpl;

/**
 * Servlet implementation class Login
 */
@WebServlet("/LoginCheckServlet")
public class LoginCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginCheckServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		LoginInfoVO loginInfo = new LoginInfoVO();
		loginInfo.setAccountNo(request.getParameter("u_id"));
		loginInfo.setPassword(request.getParameter("u_psw"));
		loginInfo.setAccType(request.getParameter("type"));

		UserInfoService userInfoService = new UserInfoServiceImpl();
		PostLimitService postLimitService;
		UserInfoVO userInfoVO = userInfoService.getUserInfoVO(loginInfo);
		if (userInfoVO != null) {
			postLimitService=new PostLimitServiceImpl();
			List<PostVO> userPostVOs=postLimitService.getUserPostVOs(userInfoVO);
	//		System.out.println(userPostVOs);
			
			
			request.getSession().setAttribute("userPostVOs", userPostVOs);
			
			request.getSession().setAttribute("userInfoVO", userInfoVO);
			response.getWriter().print("{\"u_id\":\"" + userInfoVO.getUserPO().getUserId() + "\",\"u_name\":\""
					+ userInfoVO.getUserPO().getUserId() + "\",\"verifyUrl\":\"/MaiJiaYun/servlet/gzt\"}");
			
	//		System.out.println(userInfoVO);
		} else {
			String errMsg=userInfoService.getErrorMessage(loginInfo);
			response.getWriter().print("{\"errMsg\":\""+errMsg+"\"}");
			
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
