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

/**
 * Servlet implementation class YiFaHuo
 */
@WebServlet("/servlet/order/yiFaHuo")
public class YiFaHuo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/**
		 * ��ѯ���ݿ��ж���״̬Ϊ�ѷ����Ķ�������ʾ���������еĲ�ѯ��Ҫ��ҳ
		 */
		OrderService orderService = new OrderServiceImpl();
		BuyerService buyerService = new BuyerServiceImpl();
		ShopService shopService = new ShopServiceImpl();
		List<OrderInfo> orderInfos = new ArrayList<>();
		LogisticService logisticService = new LogisticServiceImpl();
		OrderInfo orderInfo = null;
		BuyerPO buyerPO = null;
		ShopPO shopPO = null;
		LogisticPO logisticPO = null;
		OrderPO orderPO = new OrderPO();
		orderPO.setOrderState(3);

		//��ѯ���Ѿ������Ķ���
		List<Order> orders = orderService.orderQueryAll(orderPO);
		System.out.println("��ѯ�Ķ���������"+orders.size());
		for (Order order : orders) {
			orderInfo = new OrderInfo();
			//��ѯ����
			buyerPO = new BuyerPO();
			buyerPO.setBuyerId(order.getBuyerId());
			
			
			shopPO = new ShopPO();
			shopPO.setShopId(order.getShopId());
			
			logisticPO = new LogisticPO();
			logisticPO.setLogisticId(order.getLogisticId());
			
			/**-----������Ϣ------*/
			orderInfo.setBuyer(buyerService.buyerQuery(buyerPO));
			
			orderInfo.setShop(shopService.shopQuery(shopPO));
			orderInfo.setLogistic(logisticService.logisticQuery(logisticPO));
			orderInfo.setOrder(order);
			orderInfos.add(orderInfo);
		}
		request.setAttribute("allInfos", orderInfos);
		request.getRequestDispatcher("/Order/jsp/yiFaHuo.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
