package mjy.caigou.servlet.sp;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mjy.caigou.beans.PageInfo;
import mjy.caigou.po.GoodsPO;
import mjy.caigou.service.SPService;
import mjy.caigou.service.impl.SPServiceImpl;
import mjy.caigou.vo.GoodUserStatusVO;
import mjy.login.beans.vo.UserInfoVO;
import net.sf.json.JSONArray;

/**
 * Servlet implementation class GoodsQueryServlet
 */
@WebServlet("/servlet/cg/gq")
public class GoodsQueryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    private SPService spservice=new SPServiceImpl() ;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//从session对象中获得userInfoVO对象
		UserInfoVO userinfovo=  (UserInfoVO) request.getSession().getAttribute("userInfoVO");
		int userId=userinfovo.getUserPO().getUserId();
		PrintWriter out=response.getWriter();
		response.setContentType("application/json;charset=utf-8");
		String pageNo=request.getParameter("pageNo")==null?"1":request.getParameter("pageNo");
		//按商品名称模糊查询商品
		List<GoodsPO> queryGoodsPO=null;
				String searchInfo=request.getParameter("searchInfo");
				if(searchInfo!=null){
					if(searchInfo.equals("")){
						queryGoodsPO=spservice.getAllGoods(userId);
					}else{
						GoodUserStatusVO gooduserstatus=new GoodUserStatusVO();
						PageInfo<GoodUserStatusVO> page=new PageInfo<GoodUserStatusVO>(pageNo);
						gooduserstatus.setRowStart(page.getPageBegin());
						gooduserstatus.setUserId(userId);
						queryGoodsPO= spservice.searchGoodsLikeName(gooduserstatus);
					}
					 
					
				
				}
				System.out.println("list:"+queryGoodsPO);
		JSONArray jsonArray=JSONArray.fromObject(queryGoodsPO);
		out.print(jsonArray.toString());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
