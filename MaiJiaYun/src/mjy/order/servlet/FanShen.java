package mjy.order.servlet;

import java.io.IOException;
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
import mjy.order.bean.vo.Buyer;
import mjy.order.bean.vo.DetailGood;
import mjy.order.bean.vo.Logistic;
import mjy.order.bean.vo.Order;
import mjy.order.bean.vo.Shop;
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

/**
 * Servlet implementation class FenShen
 */
@WebServlet("/servlet/order/fenShen")
public class FanShen extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/**
		 * 反审：
		 * 		将所有订单状态为已审单的订单查询出来，通过请求的转发发送到jsp，写在对应的tbody里
		 */
		DetailGoodService detailGoodService = new DetailGoodServiceImpl();
		OrderService orderService = new OrderServiceImpl();
		LogisticService logisticService = new LogisticServiceImpl();
		ShopService shopService = new ShopServiceImpl();
		BuyerService buyerService = new BuyerServiceImpl();
		//查询反审状态的订单
		OrderPO orderPO = new OrderPO();
		orderPO.setOrderState(2);
		List<Order> orders = orderService.orderQueryAll(orderPO);
		
		OrderInfo orderInfo = null;
		List<OrderInfo> orderInfos = new ArrayList<>();
		
		LogisticPO logisticPo = null;
		ShopPO  shopPo = null;
		BuyerPO buyerPO = null;
		DetailGoodPO detailGoodPo = null;
		
		for (Order order : orders) {
			orderInfo = new OrderInfo();
			
			logisticPo = new LogisticPO();
			logisticPo.setLogisticId(order.getLogisticId());
			shopPo = new ShopPO();
			shopPo.setShopId(order.getShopId());
			buyerPO = new BuyerPO();
			buyerPO.setBuyerId(order.getBuyerId());
			detailGoodPo = new DetailGoodPO();
			detailGoodPo.setOrderCode(order.getOrderCode());
			
			orderInfo.setBuyer(buyerService.buyerQuery(buyerPO));
			orderInfo.setLogistic(logisticService.logisticQuery(logisticPo));
			orderInfo.setShop(shopService.shopQuery(shopPo));
			orderInfo.setDetailGoods(detailGoodService.detailGoodQueryAll(detailGoodPo));
			orderInfo.setOrder(order);
			orderInfos.add(orderInfo);
		}
		request.setAttribute("allInfos", orderInfos);
		request.getRequestDispatcher("/Order/jsp/fanShen.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	public static void main(String[] args) {
		OrderService  orderService = new OrderServiceImpl();
		OrderPO orderPO = new OrderPO();
		orderPO.setOrderState(2);
		List<Order> orders = orderService.orderQueryAll(orderPO);
		for (int i = 0; i < orders.size(); i++) {
			System.out.println(orders.get(i));
		}
		
	}
}
