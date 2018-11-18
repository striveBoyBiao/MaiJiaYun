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
 * Servlet implementation class ChaiFen
 */
@WebServlet("/servlet/order/chaiFen")
public class ChaiFen extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/**
		 * ��ֵ�˼·��
		 * 1.����ʵ�ֲ�ѯ����ѯ����״̬Ϊ�󵥵����ж����У���������1�Ķ�����Ȼ�����еĶ�������Ϣͨ��ת���ķ�ʽ
		 * 		ת������Ӧ��jsp
		 */
//		OrderService orderService = new OrderServiceImpl();
//		LogisticService logisticService = new LogisticServiceImpl();
//		ShopService shopService = new ShopServiceImpl();
//		BuyerService buyerService = new BuyerServiceImpl();
//		//��ѯ����״̬�Ķ���
//		OrderPO orderPO = new OrderPO();
//		orderPO.setOrderState(1);
//		List<Order> orders = orderService.orderQueryAll(orderPO);
//		
//		OrderInfo orderInfo = null;
//		List<OrderInfo> orderInfos = new ArrayList<>();
//		LogisticPO logisticPo = null;
//		ShopPO  shopPo = null;
//		BuyerPO buyerPO = null;
//		DetailGoodPO detailGoodPo = null;
//		
//		for (Order order : orders) {
//			//��������1�Ĵ���״̬�Ķ���
//			orderInfo = new OrderInfo();
//			if (order.getOrderGoodNum()>1) {
//				logisticPo = new LogisticPO();
//				logisticPo.setLogisticId(order.getLogisticId());
//				shopPo = new ShopPO();
//				shopPo.setShopId(order.getShopId());
//				buyerPO = new BuyerPO();
//				buyerPO.setBuyerId(order.getBuyerId());
//				detailGoodPo = new DetailGoodPO();
//				detailGoodPo.setOrderCode(order.getOrderCode());
//				
//				orderInfo.setBuyer(buyerService.buyerQuery(buyerPO));
//				orderInfo.setLogistic(logisticService.logisticQuery(logisticPo));
//				orderInfo.setShop(shopService.shopQuery(shopPo));
//				orderInfo.setOrder(order);
//				orderInfos.add(orderInfo);
//			}
//		}
//		request.setAttribute("orderInfos", orderInfos);
//		request.getRequestDispatcher("/Order/jsp/daiChaiFen.jsp").forward(request, response);
	
		
		
		/**
		 * ͬ���ǲ�ѯ���ݿ��ж���״̬Ϊ���󵥵Ķ���
		 */
		BuyerService buyerService=new BuyerServiceImpl();
		DetailGoodService detailGoodService=new DetailGoodServiceImpl();
		LogisticService logisticService=new LogisticServiceImpl();
		OrderService orderService=new OrderServiceImpl();
		ShopService shopService=new ShopServiceImpl();
		
		List<OrderInfo> allInfos=new ArrayList<OrderInfo>();
		OrderInfo allInfo = null;
		OrderPO orderPO = new OrderPO();
		BuyerPO buyerPO = null;
		DetailGoodPO detailGoodPO = null;
		ShopPO shopPO = null;
		LogisticPO logisticPO = null;
		
		//�ж�������ʲô
		String uri = request.getRequestURI();
		if (uri.endsWith("shenHe")||uri.endsWith("heBing")||uri.endsWith("chaiFen")) {
			//�����
			orderPO.setOrderState(1);
		}else if(uri.endsWith("fenShen")||uri.endsWith("faHuo")) {
			//����ʹ�����(����״̬Ϊ2)
			orderPO.setOrderState(2);
		}else if(uri.endsWith("yiFaHuo")) {
			//�ѷ���(����״̬Ϊ2)
			orderPO.setOrderState(3);
		}
		//��ѯ�����д��򵥷���״̬�Ķ���(����״̬Ϊ1)
		List<Order> orders = orderService.orderQueryAll(orderPO);
		
//		List<Order> orders=new ArrayList<>();
//		for (Order order : list) {
//			if (order.getOrderGoodNum()>1) {
//				orders.add(order);
//			}
//		}
		
		
		
		
		for (Order order : orders) {
			allInfo=new OrderInfo();
			
			/*��ѯ������ֵ*/
			buyerPO=new BuyerPO();
			buyerPO.setBuyerId(order.getBuyerId());
			
			detailGoodPO=new DetailGoodPO();
			detailGoodPO.setOrderCode(order.getOrderCode());
		
			shopPO=new ShopPO();
			shopPO.setShopId(order.getShopId());
			
			logisticPO=new LogisticPO();
			logisticPO.setLogisticId(order.getLogisticId());
			
			/*ͨ����po��ѯ���ݷŵ�AllInfo����*/
			
			allInfo.setBuyer(buyerService.buyerQuery(buyerPO));
			allInfo.setDetailGoods(detailGoodService.detailGoodQueryAll(detailGoodPO));
			allInfo.setLogistic(logisticService.logisticQuery(logisticPO));
			allInfo.setShop(shopService.shopQuery(shopPO));
			allInfo.setOrder(order);
			
			/*�����д��ڵĴ������������뼯��*/
			allInfos.add(allInfo);
		}
		request.setAttribute("allInfos", allInfos);
		request.getRequestDispatcher("/Order/jsp/daiChaiFen.jsp").forward(request, response);
		/*������ӡ���ܡ����в����ڴ�ӡ�������ʹ�ӡ��ݵ��ֶ�״̬��
		 * ��ʾʱ����jspҳ�渳ֵĬ��״ֵ̬��δ��ӡ��*/
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	public static void main(String[] args) {
		OrderService orderService = new OrderServiceImpl();
		LogisticService logisticService = new LogisticServiceImpl();
		ShopService shopService = new ShopServiceImpl();
		BuyerService buyerService = new BuyerServiceImpl();
		//��ѯ����״̬�Ķ���
		OrderPO orderPO = new OrderPO();
		orderPO.setOrderState(1);
		List<Order> orders = orderService.orderQueryAll(orderPO);
		
		OrderInfo orderInfo = null;
		List<OrderInfo> orderInfos = new ArrayList<>();
		LogisticPO logisticPo = null;
		ShopPO  shopPo = null;
		BuyerPO buyerPO = null;
		DetailGoodPO detailGoodPo = null;
		
		for (Order order : orders) {
			//��������1�Ĵ���״̬�Ķ���
			orderInfo = new OrderInfo();
			if (order.getOrderGoodNum()>1) {
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
				orderInfo.setOrder(order);
				orderInfos.add(orderInfo);
			}
		}
		for (OrderInfo orderInfo2 : orderInfos) {
			System.out.println(orderInfo2);
		}
	}
}
