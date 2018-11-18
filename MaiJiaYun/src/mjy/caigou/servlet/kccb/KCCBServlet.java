package mjy.caigou.servlet.kccb;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mjy.caigou.beans.PageInfo;
import mjy.caigou.service.KCCBService;
import mjy.caigou.service.SPService;
import mjy.caigou.service.impl.KCCBServiceImpl;
import mjy.caigou.service.impl.SPServiceImpl;
import mjy.caigou.vo.KCCBMXVO;
import mjy.caigou.vo.KCCBVO;
import mjy.common.servlet.BaseServlet;
import mjy.login.beans.vo.UserInfoVO;
import net.sf.json.JSONArray;



/**
 * Servlet implementation class SP
 */
@WebServlet("/servlet/cg/kccb")
public class KCCBServlet extends BaseServlet {
	
	public void showKccb(HttpServletRequest request, HttpServletResponse response){
		 
		
		 try {
			 
			 UserInfoVO userinfovo=(UserInfoVO) request.getSession().getAttribute("userInfoVO");
				
			 int userId=userinfovo.getUserPO().getUserId();
			 KCCBService kccbservice=new KCCBServiceImpl();
			 
			 String pageno=request.getParameter("pageno");
			 if(pageno==null){
				 pageno="1";
			 }
			 String pagesize=request.getParameter("pagesize");
			 if(pagesize==null){
				 pagesize="10";
			 }
			 PageInfo<KCCBVO> pageinfo=new PageInfo<>(pageno);
			 pageinfo.setPageSize(Integer.parseInt(pagesize));
			 String querytext=request.getParameter("querytext");
			 if(querytext==null){
				 querytext="";
			 }
			 System.out.println(querytext+"pagesize"+pagesize+"."+pageno);
			 pageinfo.setQueryParam(querytext);
			 
			 pageinfo=kccbservice.getpageinfo(userId, pageinfo);
				
			 
			 List<KCCBVO> list=pageinfo.getPageDate();
			
			 request.setAttribute("pageinfo", pageinfo);
			 request.getRequestDispatcher("/CaiGou/jsp/kccb/kccb.jsp").forward(request, response);
		} catch (ServletException e) {
			
			e.printStackTrace();
		} catch (IOException e) {
			
			e.printStackTrace();
		}
		
		
		
	}
	
	public void kccbedit(HttpServletRequest request, HttpServletResponse response){
		String sku=request.getParameter("sku");
		String goodInventCost=request.getParameter("goodInventCost");
		SPService spservice=new SPServiceImpl();
		spservice.updateGoodInventCost(sku, Double.valueOf(goodInventCost));
		
	}
	
	public void kccbmx(HttpServletRequest request, HttpServletResponse response){
		KCCBMXVO kccbmxvo=new KCCBMXVO();
		 KCCBService kccbservice=new KCCBServiceImpl();
		 String warehouseId=request.getParameter("warehouseId");
		 String goodId=request.getParameter("goodId");
		 String lastCost=request.getParameter("lastCost");
		 String firstCost=request.getParameter("firstCost");
		 String firstInventory=request.getParameter("firstInventory");
		 
		 kccbmxvo.setGoodId(Integer.parseInt(goodId));
		 kccbmxvo.setBusinessName("管理员");
		 kccbmxvo.setBillsName("手工调价");
		 kccbmxvo.setChangeTime(new SimpleDateFormat("yy--MM--dd HH:mm:ss" ).format(new Date(System.currentTimeMillis())));
		 kccbmxvo.setFirstCost(Double.valueOf(firstCost));
		 kccbmxvo.setLastCost(Double.valueOf(lastCost));
		 kccbmxvo.setFirstInventory(Integer.parseInt(firstInventory));
		 kccbmxvo.setLastInventory(Integer.parseInt(firstInventory));
		 kccbmxvo.setWarehouseId(Integer.parseInt(warehouseId));
		 kccbservice.updateKccbMx(kccbmxvo);
		
		
	}
	
	public void querykccbmx(HttpServletRequest request, HttpServletResponse response){
		try {
			request.setCharacterEncoding("utf-8");
			response.setContentType("application/json;charset=utf-8");
			PrintWriter out=response.getWriter();
			KCCBService kccbservice=new KCCBServiceImpl();
			 List<KCCBMXVO> list=new ArrayList<>();
			 int goodId=Integer.parseInt(request.getParameter("goodId"));
			 int warehouseId=Integer.parseInt(request.getParameter("warehouseId"));
			 list=kccbservice.querykccbmx(goodId, warehouseId);
			 
			 JSONArray json=JSONArray.fromObject(list);
			 out.println(json);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		 
		
		
	}
	
	public  void  queryGoodsNameorSku(HttpServletRequest request, HttpServletResponse response){
		try {
			request.setCharacterEncoding("utf-8");
			response.setContentType("application/json;charset=utf-8");
			PrintWriter out=response.getWriter();
		
		
		
		    String querytext=request.getParameter("querytext");
		    if(querytext==null){
				 querytext="";
			 }
		
		    String pageno=request.getParameter("pageno");
			 if(pageno==null){
				 pageno="1";
			 }
			 String pagesize=request.getParameter("pagesize");
			 if(pagesize==null){
				 pagesize="10";
			 }
			 System.out.println(pagesize);
			 PageInfo<KCCBVO> pageinfo=new PageInfo<>(pageno);
			 pageinfo.setPageSize(Integer.parseInt(pagesize));
			 pageinfo.setQueryParam(querytext);
		 
		   UserInfoVO userinfovo=(UserInfoVO) request.getSession().getAttribute("userInfoVO");			
		   int userId=userinfovo.getUserPO().getUserId();
             
		   KCCBService kccbservice=new KCCBServiceImpl();
		   pageinfo=kccbservice.getpageinfo(userId, pageinfo);
		   request.setAttribute("pageinfo", pageinfo);
		  

		 
		  } catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	}
