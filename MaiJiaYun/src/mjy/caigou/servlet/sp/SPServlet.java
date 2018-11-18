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
import mjy.common.servlet.BaseServlet;
import mjy.login.beans.vo.UserInfoVO;
import net.sf.json.JSONArray;

/**
 * Servlet implementation class SP
 */
@WebServlet("/servlet/cg/sp")
public class SPServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
    private SPService spservice=new SPServiceImpl() ;
   
    public void ini(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//从session对象中获得userInfoVO对象
		UserInfoVO userinfovo=  (UserInfoVO) request.getSession().getAttribute("userInfoVO");
		int userId=userinfovo.getUserPO().getUserId();
		String pageNo=request.getParameter("pageNo")==null?"1":request.getParameter("pageNo");;
		
		//页面加载获取addNode参数
		String NodeName= request.getParameter("addNode");
		System.out.println(NodeName);
		//将选中node名称存入数据库
		if(NodeName!=null){
			spservice.addNodeName(NodeName);
		}
		//获取商品分类名
		List<String> goodGroupNames=spservice.getGoodGroupName();
		request.setAttribute("goodGroupNames",goodGroupNames);
		
		//获取商品表信息
		List<GoodsPO> goodsPOs=null;
		String searchInfo=request.getParameter("q");
//		request.getSession().setAttribute("Name", searchInfo);
//		String Name=(String)request.getSession().getAttribute("Name")==null?"":(String)request.getSession().getAttribute("Name");
		int pagesize=request.getParameter("pageSize")==null?10:Integer.parseInt(request.getParameter("pageSize")); 
		PageInfo.pageSize=pagesize;
		PageInfo<GoodsPO> pageInfo=null;
		if(searchInfo==null||searchInfo.equals("")){
			
			//goodsPOs=spservice.getAllGoods(userId);
			GoodUserStatusVO gooduserstatus=new GoodUserStatusVO();
			gooduserstatus.setGoodName("");
			PageInfo.queryParam="";
			PageInfo<GoodsPO> page=new PageInfo<GoodsPO>(pageNo);
			gooduserstatus.setRowStart(page.getPageBegin());
			gooduserstatus.setUserId(userId);
			
			 pageInfo=new PageInfo<GoodsPO>(pageNo);
			pageInfo=spservice.listByPage(gooduserstatus, page);
			goodsPOs= pageInfo.getPageDate();
			
			
			request.setAttribute("goodsInfo", goodsPOs);
			request.setAttribute("pageInfo", pageInfo);
			 
			//获取商品数目信息
			int goodsNum=spservice.getGoodsNum(userId);
			request.setAttribute("goodsNum", goodsNum);
			
			
			
		}else{
			GoodUserStatusVO gooduserstatus=new GoodUserStatusVO();
			gooduserstatus.setGoodName(searchInfo);
			PageInfo.queryParam=searchInfo;
			PageInfo<GoodsPO> page=new PageInfo<GoodsPO>(pageNo);
			gooduserstatus.setRowStart(page.getPageBegin());
			gooduserstatus.setUserId(userId);
			
			 pageInfo=new PageInfo<GoodsPO>(pageNo);
			pageInfo=spservice.listByPage(gooduserstatus, page);
			goodsPOs= pageInfo.getPageDate();
			
			
			request.setAttribute("goodsInfo", goodsPOs);
			request.setAttribute("pageInfo", pageInfo);
			int goodNum=spservice.getNameLikeLength(userId, searchInfo);
			
			request.setAttribute("goodsNum", goodNum);
		}
		
		
		//获取删除商品的id
		String deleteGoodId=request.getParameter("goodId");
		//删除数据库中信息
		if(deleteGoodId!=null){
			spservice.deleteGoodsInfo(Integer.parseInt(deleteGoodId.trim()),userId);
		
		}
		
		//删除全部商品
		String order= request.getParameter("selectAll");
		
		if(order!=null){
				spservice.deleteAllGoods(userId);
				
		}

		
		//修改商品名称
		String updateGoodId=request.getParameter("updateGoodId");
		String updateVal=request.getParameter("updateVal");
		if(updateVal!=null&&updateGoodId!=null){
			spservice.updateGoodName(Integer.parseInt(updateGoodId.trim()),updateVal,userId);
		}
		
		
		
		
		
		request.getRequestDispatcher("/CaiGou/jsp/sp/shangpin.jsp").forward(request, response);
		
			
		
		
		
	}
    
    public void queryLike(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
    	//从session对象中获得userInfoVO对象
    			UserInfoVO userinfovo=  (UserInfoVO) request.getSession().getAttribute("userInfoVO");
    			int userId=userinfovo.getUserPO().getUserId();
    			PrintWriter out=response.getWriter();
    			response.setContentType("application/json;charset=utf-8");
    			String pageNo=request.getParameter("pageNo")==null?"1":request.getParameter("pageNo");
    			
    			
    			//按商品名称模糊查询商品
    			List<GoodsPO> queryGoodsPO=null;
    					String searchInfo=request.getParameter("searchInfo");
    					System.out.println(searchInfo);
    					PageInfo.queryParam=searchInfo;
    					if(searchInfo!=null){
    						if(searchInfo.equals("")){
    							queryGoodsPO=spservice.getAllGoods(userId);
    						}else{
    							GoodUserStatusVO gooduserstatus=new GoodUserStatusVO();
    							PageInfo<GoodsPO> page=new PageInfo<GoodsPO>(pageNo);
    							gooduserstatus.setRowStart(page.getPageBegin());
    							gooduserstatus.setUserId(userId);
    							gooduserstatus.setGoodName(searchInfo);
    							PageInfo<GoodsPO> pageInfo=new PageInfo<GoodsPO>(pageNo);
    							pageInfo=spservice.listByPage(gooduserstatus, page);
    							
    							queryGoodsPO= pageInfo.getPageDate();
    							
    						}
    						 
    						
    					
    					}
    				
    			JSONArray jsonArray=JSONArray.fromObject(queryGoodsPO);
    			out.print(jsonArray.toString());
    			System.out.println("list:"+jsonArray.toString());
    }
    
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
