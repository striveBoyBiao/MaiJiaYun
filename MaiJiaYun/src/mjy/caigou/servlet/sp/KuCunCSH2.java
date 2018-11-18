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

import mjy.caigou.po.KuCunCSHGoodsPO;
import mjy.caigou.service.KuCunCSHService;
import mjy.caigou.service.impl.KuCunCSHServiceImpl;
import mjy.login.beans.vo.UserInfoVO;
import net.sf.json.JSONArray;

/**
 * Servlet implementation class KuCunCSH2
 */
@WebServlet("/servlet/cg/KuCunCSH2")
public class KuCunCSH2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("application/json;charset=utf-8");
		PrintWriter out=response.getWriter();
		
        //用户Id
		UserInfoVO userInfoVO=(UserInfoVO)request.getSession().getAttribute("userInfoVO");
		int userId=userInfoVO.getBossPO().getUserID();
		




		KuCunCSHService kuCunCSHService=new KuCunCSHServiceImpl();

        //当前用户所有的仓库名
		List<String> warehouseNames=kuCunCSHService.getWarehouseNames(userId);
		
		//默认仓库  只显示未设置数量的商品   无搜索框
		List<KuCunCSHGoodsPO> goods=null;

		//携带参数 （代表查询）
		String Info=request.getParameter("Info");
		
		
		//获取仓库值
		if(Info!=null&&Info.equals("firstVisit")){
			goods=kuCunCSHService.MultiQuery("仓库1", "", "1", userId);
			JSONArray jsonArray = JSONArray.fromObject(goods);
			out.println(jsonArray.toString());
		}
		
		
		//仓库值  搜索条件  是否设置商品的库存值
		if(Info!=null&&Info.equals("2333")){
			//仓库的值
			String buttonValue= request.getParameter("buttonValue");
			//搜索框的值
			String searchValue=request.getParameter("searchValue");
			//是否显示未设置数量的商品    1:代表只显示未设置数量的商品     0:代表显示所有的商品  设置和未设置数量的商品
			String stockStatus=request.getParameter("stockStatus");
			
			goods=kuCunCSHService.MultiQuery(buttonValue, searchValue, stockStatus, userId);
			JSONArray jsonArray = JSONArray.fromObject(goods);
			out.println(jsonArray.toString());
			
		}
		
		//完成初始化
		if(Info!=null&&Info.equals("1111")){
			String buttonValue= request.getParameter("buttonValue");
			String str=request.getParameter("goodsStr");
			if(str!=null){
				if(str.endsWith(",")){
					String goodsStr=str.substring(0, str.length()-1);//商品信息为  goodId:goodCount,goodId:goodCount,......
					kuCunCSHService.warehouseInit(buttonValue, goodsStr,userId);	
				}

			}
			
		}
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}

}
