package mjy.order.servlet;
/**
 * ������ҳ��servlet
 * ��ȡ������ҳ���������ݲ�ת����������ҳ���jsp
 */
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

@WebServlet("/servlet/order/faHuo")
public class FaHuo extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
		//��ѯ�����д��򵥷���״̬�Ķ���(����״̬Ϊ2)
		List<Order> orders = orderService.orderQueryAll(orderPO);
		
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
		request.getRequestDispatcher("/Order/jsp/daiFaHuo.jsp").forward(request, response);
		/*������ӡ���ܡ����в����ڴ�ӡ�������ʹ�ӡ��ݵ��ֶ�״̬��
		 * ��ʾʱ����jspҳ�渳ֵĬ��״ֵ̬��δ��ӡ��*/
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
