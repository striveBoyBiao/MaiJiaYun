package mjy.kuguan.diaobo.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mjy.kuguan.diaobo.po.GoodsPO;
import mjy.kuguan.diaobo.service.WarehouseService;
import mjy.kuguan.diaobo.service.impl.WarehouseServiceImpl;
import net.sf.json.JSONArray;


@WebServlet("/AdddiaobodanServlet2")
public class AdddiaobodanServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       WarehouseService warehouseService=new WarehouseServiceImpl();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("application/json,charset=utf-8");
		
		List<GoodsPO> goodsPO=warehouseService.getGoods(request.getParameter("cangkuName"));
		
		JSONArray array=JSONArray.fromObject(goodsPO);
		String jsonstr=array.toString();
		response.getWriter().println(jsonstr);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
