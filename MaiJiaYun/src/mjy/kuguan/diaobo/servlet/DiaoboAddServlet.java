package mjy.kuguan.diaobo.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mjy.kuguan.diaobo.po.XiangqingDiaoboPO;
import mjy.kuguan.diaobo.service.DiaobodanService;
import mjy.kuguan.diaobo.service.impl.DiaobodanServiceImpl;
import net.sf.json.JSONArray;


@WebServlet("/servlet/kg/DiaoboAddServlet")
public class DiaoboAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DiaobodanService diaobodanService=new DiaobodanServiceImpl();
		response.setContentType("application/json,charset=utf-8");
		
		String diaobodanCode=request.getParameter("diaobocode");
		
		System.out.println(diaobodanCode);
		
		List<XiangqingDiaoboPO> xiangqingDiaobo=diaobodanService.querydiaobo(diaobodanCode);
		
		System.out.println(xiangqingDiaobo);
		
		
		
		JSONArray array=JSONArray.fromObject(xiangqingDiaobo);
		
		String Jsonstr=array.toString();
		
		response.getWriter().println(Jsonstr);
		
		request.getRequestDispatcher("/KuGuan/diaoBo/jsp/diaoBo-addDiaobodan.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
