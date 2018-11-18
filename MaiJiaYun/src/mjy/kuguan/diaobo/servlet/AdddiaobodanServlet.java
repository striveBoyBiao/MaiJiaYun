package mjy.kuguan.diaobo.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mjy.kuguan.diaobo.service.WarehouseService;
import mjy.kuguan.diaobo.service.impl.WarehouseServiceImpl;
import mjy.kuguan.diaobo.vo.WarehouseVO;
import mjy.login.beans.vo.UserInfoVO;
import net.sf.json.JSONArray;



@WebServlet("/AdddiaobodanServlet")
public class AdddiaobodanServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	WarehouseService warehouseService=new WarehouseServiceImpl();
  
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("application/json,charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		
		UserInfoVO userInfoVO = (UserInfoVO) (request.getSession().getAttribute("userInfoVO"));
		List<WarehouseVO> warehouses=warehouseService.getWarehouseName(userInfoVO.getBossPO().getUserID());
		//System.out.println(userInfoVO.getUserPO().getUserId());
		//List<WarehouseVO> warehouses=warehouseService.getWarehouseName(10001);
		/*for (WarehouseVO warehouseVO : warehouses) {
			System.out.println(warehouseVO.getWareHouseName());
		}
		*/
		
		JSONArray array=JSONArray.fromObject(warehouses);
		String jsonStr=array.toString();
		
		response.getWriter().println(jsonStr);
		
		//request.setAttribute("warehouses", warehouses);
		//request.getRequestDispatcher("/jsp/diaoBo-addDiaobodan.jsp").forward(request, response);
		
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doGet(request, response);
		
	}

	

}
