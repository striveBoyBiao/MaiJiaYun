package mjy.caigou.servlet.sp;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;

import mjy.caigou.po.KuCunCSHGoodsPO;
import mjy.caigou.service.KuCunCSHService;
import mjy.caigou.service.impl.KuCunCSHServiceImpl;
import mjy.caigou.vo.GoodsVO;
import mjy.login.beans.vo.UserInfoVO;

/**
 * Servlet implementation class KuCunCSH
 */
@WebServlet("/servlet/cg/kucuncsh")
public class KuCunCSH extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
				response.setContentType("text/xml;charset=utf-8");
				PrintWriter out=response.getWriter();
				
		        //用户Id
				UserInfoVO userInfoVO=(UserInfoVO)request.getSession().getAttribute("userInfoVO");
				int userId=userInfoVO.getBossPO().getUserID();
				

				KuCunCSHService kuCunCSHService=new KuCunCSHServiceImpl();

		        //当前用户所有的仓库名
				List<String> warehouseNames=kuCunCSHService.getWarehouseNames(userId);
				
				//默认仓库  只显示未设置数量的商品   无搜索框
				//List<KuCunCSHGoodsPO> goods=kuCunCSHService.MultiQuery("默认仓库", "", "1", userId);

	
			    //将所用的加载信息都传递过去
				request.setAttribute("warehouseNames", warehouseNames);//所有仓库名传递
				//request.setAttribute("goods", goods);//所有商品
				
				request.getRequestDispatcher("/CaiGou/jsp/sp/kucuncsh.jsp").forward(request, response);
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
