package mjy.caigou.servlet.sp;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mjy.caigou.service.ImportGoodsService;
import mjy.caigou.service.ShopService;
import mjy.caigou.service.impl.ImportGoodsServiceImpl;
import mjy.caigou.service.impl.ShopServiceImpl;
import mjy.caigou.vo.ShopGoodsVO;
import mjy.common.servlet.BaseServlet;
import mjy.login.beans.vo.UserInfoVO;
import net.sf.json.JSONArray;



/**
 * Servlet implementation class ImportGoodsServlet
 */
@WebServlet("/servlet/cg/importgoods")
public class ImportGoodsServlet extends BaseServlet {
	
       
  
	public void getShopNames(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		UserInfoVO userinfovo=  (UserInfoVO) request.getSession().getAttribute("userInfoVO");
		int userId=userinfovo.getUserPO().getUserId();
		ShopService shopService=new ShopServiceImpl();	
		List<String> shopnames=shopService.getShopNames(userId);	
		request.setAttribute("shopnames", shopnames);	
		if(true){
			request.getRequestDispatcher("/CaiGou/jsp/sp/importgoods.jsp").forward(request, response);
		}	
	}
	public void getShopGoodss(HttpServletRequest request, HttpServletResponse response) throws IOException{
		response.setContentType("application/json;charset=utf-8");
		ImportGoodsService goodsService=new ImportGoodsServiceImpl();
		List<ShopGoodsVO> shopGoodss=null;
		String index=request.getParameter("index");
		if(index!=null){
			int shopId=Integer.parseInt(index);
			shopGoodss=goodsService.getShopGoodss(shopId,0);
			request.setAttribute("shopGoodss",shopGoodss);
//			System.out.println(shopGoodss.size());
			
			if(shopGoodss.size()>0){
				JSONArray js=JSONArray.fromObject(shopGoodss);
				PrintWriter out=response.getWriter();
				out.println(js.toString());				
			}	
		}
	}
		
	public void updateShopGoodss(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=utf-8");
		String allids = request.getParameter("allids");
	//	System.out.println(allids);
		String ids[] = allids.split("\\*");
		ImportGoodsService service = new ImportGoodsServiceImpl();
		List<ShopGoodsVO> lists = new ArrayList<>();
		ShopGoodsVO goods = null;
		for (int i = 0; i < ids.length; i++) {

			goods = new ShopGoodsVO();
			goods.setGoodId(Integer.parseInt(ids[i]));
			lists.add(goods);
		}
		service.updateShopGoodss(lists);
		PrintWriter out = response.getWriter();
		out.println("导入成功");
	}

}
