package mjy.kuguan.ruku.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mjy.kuguan.ruku.po.WanchengPO;
import mjy.kuguan.ruku.service.DiaoborukuService;
import mjy.kuguan.ruku.service.WanchengService;
import mjy.kuguan.ruku.service.WanchengServiceImpl;
import mjy.login.beans.vo.UserInfoVO;


@WebServlet("/servlet/WanchengServlet")
public class WanchengServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		WanchengService wanchengPO=new WanchengServiceImpl();
		DiaoborukuService diaoborukuService = new DiaoborukuService();
		//获取当前BossId
		UserInfoVO userInfoVO = (UserInfoVO)req.getSession().getAttribute("userInfoVO");
		int bossId = userInfoVO.getBossPO().getUserID();
		
		String selectString = req.getParameter("queryInfo");
		int pageNo = req.getParameter("pageNo") == null? 1: Integer.parseInt(req.getParameter("pageNo"));
		int pageSize = req.getParameter("pageSize") == null? 10: Integer.parseInt(req.getParameter("pageSize"));
		int pageCount = wanchengPO.getCount(bossId);

		List<WanchengPO> wanchengList = wanchengPO.listBy(bossId, selectString, pageNo, pageSize);
		
		if(wanchengList != null){
			req.setAttribute("wanchengPO", wanchengList);
			req.setAttribute("pageSize", pageSize);
			req.setAttribute("pageCount", pageCount);
			req.setAttribute("pageNo", pageNo);
			req.setAttribute("caigouDataCount", diaoborukuService.getOtherPageDataCount(bossId).get(0));
			req.setAttribute("tuihuoDataCount", diaoborukuService.getOtherPageDataCount(bossId).get(1));
			req.setAttribute("diaoboDataCount", diaoborukuService.getOtherPageDataCount(bossId).get(2));
			req.getRequestDispatcher("/KuGuan/RuKu/WanChengRuKu/Wancheng.jsp").forward(req, resp);
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	
	}
	

}
