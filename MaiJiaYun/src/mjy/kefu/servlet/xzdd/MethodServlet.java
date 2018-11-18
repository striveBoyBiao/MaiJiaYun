package mjy.kefu.servlet.xzdd;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mjy.common.servlet.BaseServlet;
import mjy.common.util.other.CodeGenerate;
import mjy.kefu.beans.AreaBeanPO;
import mjy.kefu.beans.CustomerBeanPO;
import mjy.kefu.beans.CustomerBeanVO;
import mjy.kefu.beans.LogisticBeanPO;
import mjy.kefu.beans.OrderBeanPOLyl;
import mjy.kefu.beans.OrderDetailBeanVO;
import mjy.kefu.beans.ProductBeanPO;
import mjy.kefu.beans.ProductBeanVO;
import mjy.kefu.beans.ShopBeanPO;
import mjy.kefu.beans.ShopBeanVO;
import mjy.kefu.beans.WarehouseBeanPO;
import mjy.kefu.beans.WarehouseBeanVO;
import mjy.kefu.dao.AreaQuery;
import mjy.kefu.dao.CustomerInsert;
import mjy.kefu.dao.CustomerQuery;
import mjy.kefu.dao.LogisticQuery;
import mjy.kefu.dao.ProductQuery;
import mjy.kefu.dao.ShopQuery;
import mjy.kefu.dao.WarehouseQuery;
import mjy.kefu.service.OrderInsertService;
import mjy.login.beans.vo.UserInfoVO;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@WebServlet("/servlet/MethodServlet")
public class MethodServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
	/*
	 * 新增订单的跳转
	 */
	public String addOrderMethod(HttpServletRequest request, HttpServletResponse response){
		return "/KeFu/addOrder/addOrder.jsp";
	}
	/*
	 * 地区查询（省，市，区）
	 */
	public void areaQueryMethod(HttpServletRequest request, HttpServletResponse response) throws Exception {
		AreaQuery areaQueryList = new AreaQuery();
		response.setContentType("application/json;charset=utf-8");
		String name = request.getParameter("name");
		Integer value = Integer.parseInt(request.getParameter("value"));
		PrintWriter out = response.getWriter();
		//省
		if (name.equals("sheng")) {
			ArrayList<AreaBeanPO> result = (ArrayList<AreaBeanPO>) areaQueryList.proviceQuery(0);
			String jsonStr = "{\"message\":[";
			for (int index = 0; index < result.size(); index++) {
				if (index == result.size() - 1) {
					jsonStr = jsonStr + "{\"name\":\"" + result.get(index).getName() + "\",\"id\":\"" + result.get(index).getId() + "\"}]}";
				} else {
					jsonStr = jsonStr + "{\"name\":\"" + result.get(index).getName() + "\",\"id\":\"" + result.get(index).getId() + "\"},";
				}
			}
			out.println(jsonStr);
		}
		//市
		if (name.equals("city")) {
			ArrayList<AreaBeanPO> result = (ArrayList<AreaBeanPO>) areaQueryList.cityQuery(value);
			String jsonStr = "{\"message\":[";
			for (int index = 0; index < result.size(); index++) {
				if (index == result.size() - 1) {
					jsonStr = jsonStr + "{\"name\":\"" + result.get(index).getName() + "\",\"id\":\"" + result.get(index).getId() + "\"}]}";
				} else {
					jsonStr = jsonStr + "{\"name\":\"" + result.get(index).getName() + "\",\"id\":\"" + result.get(index).getId() + "\"},";
				}
			}
			out.println(jsonStr);
		}
		//区
		if (name.equals("district")) {
			ArrayList<AreaBeanPO> result = (ArrayList<AreaBeanPO>) areaQueryList.areaQuery(value);
			String jsonStr = "{\"message\":[";
			for (int index = 0; index < result.size(); index++) {
				if (index == result.size() - 1) {
					jsonStr = jsonStr + "{\"name\":\"" + result.get(index).getName() + "\",\"id\":\"" + result.get(index).getId() + "\"}]}";
				} else {
					jsonStr = jsonStr + "{\"name\":\"" + result.get(index).getName() + "\",\"id\":\"" + result.get(index).getId() + "\"},";
				}
			}
			out.println(jsonStr);
		}
	}
	/*
	 * 客户查询
	 */
	public void customerQueryMethod(HttpServletRequest request, HttpServletResponse response) throws Exception {
		CustomerQuery customerQuery = new CustomerQuery();
		response.setContentType("application/json;charset=utf-8");
		PrintWriter out = response.getWriter();

		UserInfoVO userInfoVO = (UserInfoVO) request.getSession().getAttribute("userInfoVO");
		String userId = userInfoVO.getUserPO().getUserId() + "";

		String searchText = request.getParameter("searchText");

		CustomerBeanVO customerBeanVO = new CustomerBeanVO();
		customerBeanVO.setUserId(userId);
		if (searchText != "") {
			// 用户要搜索的关键字 放在customer中的name中
			customerBeanVO.setName(searchText);
		}
		List<CustomerBeanPO> results = customerQuery.customerQuery(customerBeanVO);

		JSONArray array = JSONArray.fromObject(results);
		String jsonStr = array.toString();

		out.println(jsonStr);
	}
	/*
	 * 快递查询
	 */
	public void logisticQueryMethod(HttpServletRequest request, HttpServletResponse response) throws Exception {
		LogisticQuery logisticQuery = new LogisticQuery();
		response.setContentType("application/json;charset=utf-8");
		PrintWriter out = response.getWriter();

		List<LogisticBeanPO> results = logisticQuery.logisticQuery();

		JSONArray array = JSONArray.fromObject(results);
		String jsonStr = array.toString();

		out.println(jsonStr);
	}
	/*
	 * 商品查询
	 */
	public void productQueryMethod(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ProductQuery productQuery = new ProductQuery();
		response.setContentType("application/json;charset=utf-8");
		PrintWriter out = response.getWriter();

		String warehouseId = request.getParameter("warehouseId");
		String qualitysearchText = request.getParameter("qualitysearchText");

		UserInfoVO userInfoVO = (UserInfoVO) request.getSession().getAttribute("userInfoVO");
		String userId = userInfoVO.getUserPO().getUserId() + "";

		ProductBeanVO productBeanVO = new ProductBeanVO();
		productBeanVO.setUserId(userId);
		productBeanVO.setWareHouseId(warehouseId);
		if (qualitysearchText != "") {
			// 用户要搜索的关键字 放在product中的name中
			productBeanVO.setSearchText(qualitysearchText);
		}

		List<ProductBeanPO> results = productQuery.productQuery(productBeanVO);

		JSONArray array = JSONArray.fromObject(results);
		String jsonStr = array.toString();

		out.println(jsonStr);
	}
	/*
	 * 仓库查询
	 */
	public void warehouseQueryMethod(HttpServletRequest request, HttpServletResponse response) throws Exception {
		WarehouseQuery warehouseQuery = new WarehouseQuery();
		response.setContentType("application/json;charset=utf-8");
		PrintWriter out = response.getWriter();

		UserInfoVO userInfoVO = (UserInfoVO) request.getSession().getAttribute("userInfoVO");
		String userId = userInfoVO.getUserPO().getUserId() + "";

		WarehouseBeanVO warehouseBeanVO = new WarehouseBeanVO();
		warehouseBeanVO.setUserId(userId);

		List<WarehouseBeanPO> results = warehouseQuery.wareHouseQuery(warehouseBeanVO);

		JSONArray array = JSONArray.fromObject(results);
		String jsonStr = array.toString();

		out.println(jsonStr);
	}
	/*
	 * 店铺查询
	 */
	public void shopQueryMethod(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ShopQuery shopQuery=new ShopQuery();
		response.setContentType("application/json;charset=utf-8");

		UserInfoVO userInfoVO = (UserInfoVO) request.getSession().getAttribute("userInfoVO");
		String userId = userInfoVO.getUserPO().getUserId() + "";

		ShopBeanVO shopBeanVO = new ShopBeanVO();
		shopBeanVO.setUserId(userId);

		PrintWriter out = response.getWriter();

		List<ShopBeanPO> results = shopQuery.shopQuery(shopBeanVO);

		JSONArray array = JSONArray.fromObject(results);
		String jsonStr = array.toString();
		
		out.println(jsonStr);
	}
	/*
	 * 存储客户的方法
	 */
	public void customerSaveMethod(HttpServletRequest request, HttpServletResponse response) throws Exception {
		CustomerInsert saveCustomerInsert=new CustomerInsert();
		response.setContentType("application/json;charset=utf-8");
		PrintWriter out=response.getWriter();
		
		UserInfoVO userInfoVO = (UserInfoVO) request.getSession().getAttribute("userInfoVO");
		int userId = userInfoVO.getUserPO().getUserId();
		
		
		String buyer = request.getParameter("buyer");
		String tel = request.getParameter("tel");
		String phone = request.getParameter("phone");
		String postcode = request.getParameter("postcode");
		String province = request.getParameter("provice");
		String city = request.getParameter("city");
		String district = request.getParameter("district");
		String location = request.getParameter("location");
		String address=request.getParameter("address");
		
		CustomerBeanPO customer=new CustomerBeanPO();
		customer.setUserId(userId+"");
		customer.setBuyerName(buyer);
		customer.setBuyerTel(tel);
		customer.setBuyerPhone(phone);
		customer.setBuyerPostCode(postcode);
		customer.setBuyerProvince(province);
		customer.setBuyerCity(city);
		customer.setBuyerDistrict(district);
		customer.setBuyerLocation(location);
		customer.setBuyerAddress(address);
		String result=saveCustomerInsert.saveCustomer(customer);
		out.println("{\"message\":\""+result+"\"}");
	}
	/*
	 * 存储订单
	 */
	public void orderSaveMethod(HttpServletRequest request, HttpServletResponse response) throws Exception {
		OrderInsertService orderInsertService = new OrderInsertService();
		response.setContentType("application/json;charset=utf-8");
		PrintWriter out = response.getWriter();

		UserInfoVO userInfoVO = (UserInfoVO) request.getSession().getAttribute("userInfoVO");
		int userId = userInfoVO.getUserPO().getUserId();
		// int userId=10001;
		String orderInfo = request.getParameter("orderInfo");
		String goodInfo = request.getParameter("goodInfo");

		// System.out.println(orderInfo);
		// System.out.println(goodInfo);

		JSONObject orderInfoJsonObject = JSONObject.fromObject(orderInfo);
		JSONArray goodInfoJsonObject = JSONArray.fromObject(goodInfo);

		OrderBeanPOLyl orderBeanVOLyl = new OrderBeanPOLyl();
		orderBeanVOLyl.setOrderCode(CodeGenerate.getCode(userId, CodeGenerate.ORDER_CODE));
		orderBeanVOLyl.setUserId(userId + "");
		orderBeanVOLyl.setShopId(orderInfoJsonObject.get("shopId") + "");
		if (orderInfoJsonObject.get("orderPayWay").equals("先付款")) {
			orderBeanVOLyl.setOrderPayWay("0");
		} else {
			orderBeanVOLyl.setOrderPayWay("1");
		}
		orderBeanVOLyl.setLogisticId(orderInfoJsonObject.get("logisticId") + "");
		orderBeanVOLyl.setOrderFee(orderInfoJsonObject.get("orderFee") + "");
		orderBeanVOLyl.setOrderFreight(orderInfoJsonObject.get("orderFreight") + "");
		orderBeanVOLyl.setOrderSellerRemark(orderInfoJsonObject.get("orderSellerRemark") + "");
		orderBeanVOLyl.setBuyerId(orderInfoJsonObject.get("buyerId") + "");
		orderBeanVOLyl.setOrderFavorable(orderInfoJsonObject.get("orderFavorable") + "");
		orderBeanVOLyl.setOrderGoodNum(orderInfoJsonObject.get("orderGoodNum") + "");
		orderBeanVOLyl.setOrderPayMent(orderInfoJsonObject.get("orderPayMent") + "");
		orderBeanVOLyl.setOrderWeight(orderInfoJsonObject.get("orderWeight") + "");
		orderBeanVOLyl.setOrderTotal(orderInfoJsonObject.get("orderTotal") + "");

		List<OrderDetailBeanVO> array = new ArrayList<OrderDetailBeanVO>();
		for (int index = 0; index < goodInfoJsonObject.size(); index++) {
			OrderDetailBeanVO orderDetailBeanVO = new OrderDetailBeanVO();
			orderDetailBeanVO.setOrderCode(orderBeanVOLyl.getOrderCode());
			orderDetailBeanVO.setGoodId(((JSONObject) goodInfoJsonObject.get(index)).get("goodId") + "");
			orderDetailBeanVO.setWareHouseId(((JSONObject) goodInfoJsonObject.get(index)).get("warehouseId") + "");
			orderDetailBeanVO.setDetailSellPrice(((JSONObject) goodInfoJsonObject.get(index)).get("detailsellPrice") + "");
			orderDetailBeanVO.setDetailGoodNum(((JSONObject) goodInfoJsonObject.get(index)).get("detailgoodNum") + "");
			orderDetailBeanVO.setDetailGoodPrivilege(((JSONObject) goodInfoJsonObject.get(index)).get("detailGoodPrivilege") + "");
			orderDetailBeanVO.setDetailTotal(((JSONObject) goodInfoJsonObject.get(index)).get("detailTotal") + "");
			orderDetailBeanVO.setGoodPrice(((JSONObject) goodInfoJsonObject.get(index)).get("goodprice") + "");
			array.add(orderDetailBeanVO);
		}

		try {
			boolean result = orderInsertService.orderInsert(orderBeanVOLyl, array);

			JSONArray jsonArray = JSONArray.fromObject(result);
			String jsonStr = jsonArray.toString();

			out.println(jsonStr);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
