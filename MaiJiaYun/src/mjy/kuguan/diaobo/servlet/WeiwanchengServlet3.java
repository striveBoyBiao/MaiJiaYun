package mjy.kuguan.diaobo.servlet;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mjy.kuguan.diaobo.service.DiaobodanService;
import mjy.kuguan.diaobo.service.impl.DiaobodanServiceImpl;
import mjy.login.beans.vo.UserInfoVO;
import net.sf.json.JSONArray;

@WebServlet("/WeiwanchengServlet3")
public class WeiwanchengServlet3 extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json,charset=utf-8");
		
		DiaobodanService diaobodanService=new DiaobodanServiceImpl();
		UserInfoVO user=(UserInfoVO)request.getSession().getAttribute("userInfoVO");
		String diaobodanAuditor=user.getUserPO().getUserName();
		System.out.println(diaobodanAuditor);
		
		Date date=new Date();
		DateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String diaobodanAudittime=sdf.format(date);
		System.out.println(diaobodanAudittime);
		
		String diaobodanCode=request.getParameter("diaobodancode");
		
		System.out.println(diaobodanCode);
		
		String diaoboState="2";
		
		boolean result=diaobodanService.updateAsState(diaobodanCode, diaobodanAuditor, diaobodanAudittime, diaoboState);
		
		JSONArray array=JSONArray.fromObject(result);
		String jsonstr=array.toString();
		response.getWriter().println(jsonstr);
		
		
		
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
