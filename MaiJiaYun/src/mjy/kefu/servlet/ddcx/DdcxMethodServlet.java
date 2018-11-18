package mjy.kefu.servlet.ddcx;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mjy.common.servlet.BaseServlet;
import mjy.kefu.beans.OrderBeanPO;
import mjy.kefu.beans.OrderQueryBeanVOLYL;
import mjy.kefu.dao.OrderQuery;
import mjy.kefu.service.OrderDeleteService;
import mjy.login.beans.vo.UserInfoVO;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
@WebServlet("/servlet/DdcxMethodServlet")
public class DdcxMethodServlet extends BaseServlet{
	private static final long serialVersionUID = 1L;
	
	public String ddcx(HttpServletRequest request, HttpServletResponse response){
		return "/KeFu/ddcx/ddcx.jsp";
	}
	

	//按查询条件有无传递参数
	public void orderQuery(HttpServletRequest request, HttpServletResponse response) throws Exception{
		response.setContentType("application/json;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String condition = request.getParameter("condition");
		
		JSONObject conditionJsonObject = JSONObject.fromObject(condition);
		
		OrderQuery orderQuery=new OrderQuery();
		
		OrderQueryBeanVOLYL orderQueryBeanVO=new OrderQueryBeanVOLYL();
		
		UserInfoVO userInfoVO = (UserInfoVO) request.getSession().getAttribute("userInfoVO");
		int userId = userInfoVO.getUserPO().getUserId();
		orderQueryBeanVO.setUserId(userId);
		if(conditionJsonObject.get("status")!=null){
			orderQueryBeanVO.setStatus(conditionJsonObject.get("status")+"");
		}
		if(conditionJsonObject.get("eShopName")!=null){
			orderQueryBeanVO.seteShopName(conditionJsonObject.get("eShopName")+"");
		}
		if(conditionJsonObject.get("buyerMemo")!=null){
			orderQueryBeanVO.setBuyerMemo(conditionJsonObject.get("buyerMemo")+"");
		}
		if(conditionJsonObject.get("sellerMemo")!=null){
			orderQueryBeanVO.setSellerMemo(conditionJsonObject.get("sellerMemo")+"");
		}
		if(conditionJsonObject.get("receiverAddress")!=null){
			orderQueryBeanVO.setReceiverAddress(conditionJsonObject.get("receiverAddress")+"");
		}
		if(conditionJsonObject.get("expressCompanyNameExpressCode")!=null){
			orderQueryBeanVO.setExpressCompanyNameExpressCode(conditionJsonObject.get("expressCompanyNameExpressCode")+"");
		}
		if(conditionJsonObject.get("expressCompanyName")!=null){
			orderQueryBeanVO.setExpressCompanyName(conditionJsonObject.get("expressCompanyName")+"");
		}
		if(conditionJsonObject.get("skuTotalQuantity")!=null){
			orderQueryBeanVO.setSkuTotalQuantity(conditionJsonObject.get("skuTotalQuantity")+"");
		}
		orderQueryBeanVO.setCurrentPageSize(conditionJsonObject.get("currentPageSize")+"");
		orderQueryBeanVO.setCurrentPageNum(conditionJsonObject.get("currentPageNum")+"");
		
		if(conditionJsonObject.get("searchText")!=null){
			orderQueryBeanVO.setSearchText(conditionJsonObject.get("searchText")+"");
		}
		
		
		List<OrderBeanPO> result=orderQuery.orderQueryLYL(orderQueryBeanVO);
		OrderBeanPO orderBeanPOCount=new OrderBeanPO();
		orderBeanPOCount.setCount(orderQuery.orderQueryLYLCount(orderQueryBeanVO)+"");
		result.add(orderBeanPOCount);
		JSONArray array = JSONArray.fromObject(result);
	    String jsonStr = array.toString();
	    	    
	    out.println(jsonStr);
	}
	//根据得到的orderCode使用事务删除数据
	public void OrderDelete(HttpServletRequest request, HttpServletResponse response) throws Exception{
		response.setContentType("application/json;charset=utf-8");
		PrintWriter out = response.getWriter();
		OrderDeleteService orderdelete = new OrderDeleteService();
		String orderCode = request.getParameter("orderCode");
		UserInfoVO userInfoVO = (UserInfoVO) request.getSession().getAttribute("userInfoVO");
		int userId = userInfoVO.getUserPO().getUserId();
		boolean result=orderdelete.orderDelete(orderCode,userId);
		JSONArray array = JSONArray.fromObject(result);
	    String jsonStr = array.toString();
	    out.println(jsonStr);
	}
}
