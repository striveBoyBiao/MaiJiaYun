package mjy.order.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mjy.order.bean.info.OrderInfo;
import mjy.order.bean.po.BuyerPO;
import mjy.order.bean.po.DetailGoodPO;
import mjy.order.bean.po.LogisticPO;
import mjy.order.bean.po.OrderPO;
import mjy.order.bean.po.ShopPO;
import mjy.order.bean.vo.Order;
import mjy.order.service.BuyerService;
import mjy.order.service.DetailGoodService;
import mjy.order.service.LogisticService;
import mjy.order.service.OrderService;
import mjy.order.service.ShopService;
import mjy.order.service.impl.BuyerServiceImpl;
import mjy.order.service.impl.DetailGoodServiceImpl;
import mjy.order.service.impl.LogisticServiceImpl;
import mjy.order.service.impl.OrderServiceImpl;
import mjy.order.service.impl.ShopServiceImpl;
import net.sf.json.JSONArray;

/**
 * Servlet implementation class AdvancedSeek
 */
@WebServlet("/servlet/order/Advanced")
public class Advanced extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		OrderService orderService = new OrderServiceImpl();
		BuyerService buyerService = new BuyerServiceImpl();
		DetailGoodService detailGoodService = new DetailGoodServiceImpl();
		LogisticService logisticService = new LogisticServiceImpl();
		ShopService shopService = new ShopServiceImpl();
		request.setCharacterEncoding("utf-8");
		response.setContentType("application/json;charset=utf-8");
		/**
		 */
		String shopId = request.getParameter("eShopName");
		String logisticId = request.getParameter("expressCompanyName");
		String orderPayWay = request.getParameter("paymentMethod");
		String orderCode = request.getParameter("b2cCode");
		String buyerName = request.getParameter("receiverName");
		
		String buyerPhone = request.getParameter("receiverMobile");
		String buyerTel = request.getParameter("receiverPhone");
		String buyerAddress = request.getParameter("receiverAddress");
		String goodId = request.getParameter("goodsCode");
		String sku = request.getParameter("skuCode");
		String goodName = request.getParameter("goodsTitle");
		String detailGoodNum = request.getParameter("goodsNum");
		String buyerRemark = request.getParameter("hasBuyerMemo");
		String sellerRemark = request.getParameter("hasSellerMemo");
		String orderTimeFrom = request.getParameter("orderTimeFrom");
		String orderTimeTo = request.getParameter("orderTimeTo");
		String orderExaTimeFrom = request.getParameter("orderExaTimeFrom");
		String orderExaTimeTo = request.getParameter("orderExaTimeTo");
		String orderSendTimeFrom = request.getParameter("orderSendTimeFrom");
		String orderSendTimeTo = request.getParameter("orderSendTimeTo");
		System.out.println("店铺为："+shopId);
		System.out.println("物流为："+logisticId);
		System.out.println("支付方式为："+orderPayWay);
		System.out.println("运单号为："+orderCode);
		System.out.println("买家姓名为："+buyerName);
		System.out.println("买家手机为："+buyerPhone);
		System.out.println("买家电话为："+buyerTel);
		System.out.println("买家地址为："+buyerAddress);
		System.out.println("商品id为："+goodId);
		System.out.println("sku为："+sku);
		System.out.println("商品名字为："+goodName);
		System.out.println("商品数量为："+detailGoodNum);
		System.out.println("有无买家备注为："+buyerRemark);
		System.out.println("有无卖家备注为："+sellerRemark);
		System.out.println("下单时间从为："+orderTimeFrom);
		System.out.println("下单时间指为："+orderTimeTo);
		System.out.println("审单时间从为："+orderExaTimeFrom);
		System.out.println("审单时间至为："+orderExaTimeTo);
		System.out.println("发货时间从为："+orderSendTimeFrom);
		System.out.println("发货时间至为："+orderSendTimeTo);
		
		
		OrderPO orderPO = new OrderPO();
		BuyerPO buyerPO = new BuyerPO();
		DetailGoodPO detailGoodPO = new DetailGoodPO();
		
		/**
		 * 给PO插入条件
		 */
		if (shopId!=null&&!shopId.equals("")) {
			orderPO.setShopId(Integer.parseInt(shopId));
		}
		if (logisticId!=null&&!logisticId.equals("")) {
			orderPO.setLogisticId(Integer.parseInt(logisticId));
		}
		if (orderPayWay!=null&&!orderPayWay.equals("")) {
			orderPO.setOrderPayWay(Integer.parseInt(orderPayWay));
		}
		if (orderCode!=null&&!orderCode.equals("")) {
			orderPO.setOrderCode(orderCode);
		}
		if (buyerName!=null&&!buyerName.equals("")) {
			buyerPO.setBuyerName(buyerName);
		}
		if (buyerPhone!=null&&!buyerPhone.equals("")) {
			buyerPO.setBuyerPhone(buyerPhone);
		}
		if (buyerTel!=null&&!buyerTel.equals("")) {
			buyerPO.setBuyerTel(buyerTel);
		}
		if (buyerAddress!=null&&!buyerAddress.equals("")) {
			buyerPO.setBuyerAddress(buyerAddress);
		}
		if (goodId!=null&&!goodId.equals("")) {
			detailGoodPO.setGoodId(Integer.parseInt(goodId));
		}
		if (sku!=null&&!sku.equals("")) {
			detailGoodPO.setSku(sku);
		}
		if (goodName!=null&&!goodName.equals("")) {
			detailGoodPO.setGoodName(goodName);
		}
		if (detailGoodNum!=null&&!detailGoodNum.equals("")) {
			detailGoodPO.setDetailGoodNum(Integer.parseInt(detailGoodNum));
		}
		if (buyerRemark!=null&&!buyerRemark.equals("")) {
			orderPO.setBuyerRemark(Integer.parseInt(buyerRemark));
		}
		if (sellerRemark!=null&&!sellerRemark.equals("")) {
			orderPO.setSellerRemark(Integer.parseInt(sellerRemark));
			System.out.println("卖家备注："+orderPO.getSellerRemark());
		}
		if (orderTimeFrom!=null&&!orderTimeFrom.equals("")) {
			orderPO.setOrderTimeFrom(orderTimeFrom);
		}
		if (orderTimeTo!=null&&!orderTimeTo.equals("")) {
			orderPO.setOrderTimeFrom(orderTimeTo);
		}
		if (orderExaTimeFrom!=null&&!orderExaTimeFrom.equals("")) {
			orderPO.setOrderTimeFrom(orderExaTimeFrom);
		}
		if (orderExaTimeTo!=null&&!orderExaTimeTo.equals("")) {
			orderPO.setOrderTimeFrom(orderExaTimeTo);
		}
		if (orderSendTimeFrom!=null&&!orderSendTimeFrom.equals("")) {
			orderPO.setOrderTimeFrom(orderSendTimeFrom);
		}
		if (orderSendTimeTo!=null&&!orderSendTimeTo.equals("")) {
			orderPO.setOrderTimeFrom(orderTimeFrom);
		}
		//判断请求是什么
		String uri = request.getRequestURI();
		if (uri.endsWith("shenHe")||uri.endsWith("heBing")||uri.endsWith("chaiFen")) {
			//带审核
			orderPO.setOrderState(1);
		}else if(uri.endsWith("fenShen")||uri.endsWith("faHuo")) {
			//反审和代发货(订单状态为2)
			orderPO.setOrderState(2);
		}else if(uri.endsWith("yiFaHuo")) {
			//已发货(订单状态为2)
			orderPO.setOrderState(3);
		}
		orderPO.setBuyerPO(buyerPO);
		orderPO.setDetailGoodPO(detailGoodPO);
		List<Order> orders = orderService.orderQueryAll(orderPO);
		
		List<OrderInfo> allInfos = new ArrayList<OrderInfo>();
		ShopPO shopPO2= null;
		LogisticPO logisticPO2 = null;
		OrderInfo allInfo = null;
		BuyerPO buyerPO2 = null;
		DetailGoodPO detailGoodPO2 = null;
		for (Order order : orders) {
			allInfo = new OrderInfo();
			/**-----查询条件------*/
			//给买家查询插入条件
			buyerPO2 = new BuyerPO();
			buyerPO2.setBuyerId(order.getBuyerId());
			//给商品查询插入条件
			detailGoodPO2 = new DetailGoodPO();
			detailGoodPO2.setOrderCode(order.getOrderCode());
			//给店铺查询插入条件
			shopPO2 = new ShopPO();
			shopPO2.setShopId(order.getShopId());
			//给快递查询插入条件
			logisticPO2 = new LogisticPO();
			logisticPO2.setLogisticId(order.getLogisticId());
			
			/**-----插入信息------*/
			//买家信息
			allInfo.setBuyer(buyerService.buyerQuery(buyerPO2));
			//商品信息(商品是List)
			allInfo.setDetailGoods(detailGoodService.detailGoodQueryAll(detailGoodPO2));
			//店铺信息
			allInfo.setShop(shopService.shopQuery(shopPO2));
			//快递信息
			allInfo.setLogistic(logisticService.logisticQuery(logisticPO2));
			//订单本身的信息
			allInfo.setOrder(order);
			
			//插入到集合
			allInfos.add(allInfo);
		}
		
		
		
		System.out.println("订单个数："+allInfos.size());
		for (OrderInfo allInfo2 : allInfos) {
			System.out.println(allInfo2.getBuyer().getBuyerId());
		}
		/*for (Order order : orders) {
			System.out.println("ajax:"+order);
		}*/
//		System.out.println(order);
		/*for (AllInfo allInfo2 : allInfos) {
			System.out.println(allInfo2.getOrder());
		}
		JSONArray jsonArray = JSONArray.fromObject(allInfos);
		PrintWriter out = response.getWriter();
		out.println(jsonArray.toString());*/
		request.setAttribute("allInfos", allInfos);
		request.getRequestDispatcher("/Order/jsp/daiShenHe.jsp").forward(request, response);
	
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
