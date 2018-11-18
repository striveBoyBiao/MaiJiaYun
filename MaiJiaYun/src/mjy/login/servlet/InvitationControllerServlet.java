package mjy.login.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mjy.common.servlet.BaseServlet;
import mjy.login.beans.po.InvitedUserPO;
import mjy.login.service.Impl.RegisterActivaService;
import net.sf.json.JSONArray;

@WebServlet("/InvitationController")
public class InvitationControllerServlet extends BaseServlet {
	RegisterActivaService ras = new RegisterActivaService();

	public void processInviteInfo(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		resp.setContentType("text/html");
		// 从页面获取邀请信息
		String userName = req.getParameter("name"); // 用户名
		String userPhone = req.getParameter("phone");// 手机
		String userEmail = req.getParameter("email");// 邮箱
		String userPost = req.getParameter("post");// 岗位
		int userBy = Integer.parseInt(req.getParameter("userC"));// 当前用户，邀请人

		ras.processInvitation(userBy, userName, userEmail, userPhone, userPost);// 处理邀请信息
	}

	public void checkCode(HttpServletRequest req, HttpServletResponse resp) {
		String inviteCode = req.getParameter("invitationCode");
		String result;
		InvitedUserPO invitedUserPO = ras.getInvitedUserPO(inviteCode);
		if (invitedUserPO == null) {
			result = "{\"msg\":\"false\"}";
		} else {

			result = "{\"code\":\"" + invitedUserPO.getInvitedUserActivationCode() + "\",\"userEmail\":\""
					+ invitedUserPO.getInvitedUserEmail() + "\",\"userName\":\"" + invitedUserPO.getInvitedUserName()
					+ "\"}";
			System.out.println(result);

//			JSONArray jsonArray = JSONArray.fromObject(invitedUserPO);
//			result = jsonArray.toString();
			System.out.println(result);
		}
		try {
			resp.getWriter().println(result);
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	public void processActivate(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String inviteCode = req.getParameter("inviteCode");
		String password = req.getParameter("password");

		ras.registerInvitedUser(inviteCode, password);
		resp.getWriter().println("{\"msg\":\"OK\"}");
	}

}
