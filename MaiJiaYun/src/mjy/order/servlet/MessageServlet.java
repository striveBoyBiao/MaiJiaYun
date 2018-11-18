package mjy.order.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mjy.order.bean.po.OrderPO;
import mjy.order.bean.vo.Buyer;
import mjy.order.bean.vo.Order;
import mjy.order.service.ClientMessageService;
import mjy.order.service.OrderService;
import mjy.order.service.impl.ClientMessageServiceImpl;
import mjy.order.service.impl.OrderServiceImpl;

/**
 * Servlet implementation class MessageServlet
 */
@WebServlet("/servlet/order/MessageServlet")
public class MessageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ClientMessageService cmsc=new ClientMessageServiceImpl();
		/*根据订单号获得订单对象*/
		OrderService orderService = new OrderServiceImpl();
		OrderPO orderPO = new OrderPO();
		String orderCode = request.getParameter("orderCode");
		orderPO.setOrderCode(orderCode);
		System.out.println("订单hao是："+orderCode);
		Order ord = orderService.orderQuery(orderPO);
		
		
		/*要保存信息*/
		Order order=new Order();
		order.setBuyerId(ord.getBuyerId());
		order.setOrderCode(request.getParameter("orderCode"));
		order.setOrderBuyerRemark(request.getParameter("orderBuyerRemark"));
		order.setOrderSellerRemark(request.getParameter("orderSellerRemark"));
		order.setLogisticId(Integer.parseInt(request.getParameter("LogisticId")));
		System.out.println(request.getParameter("LogisticId"));
		Buyer buyer=new Buyer();
		buyer.setBuyerName(request.getParameter("buyerName"));
		buyer.setBuyerTel(request.getParameter("buyerTel"));
		buyer.setBuyerPhone(request.getParameter("buyerPhone"));
		buyer.setBuyerPostcode(request.getParameter("buyerPostcode"));
		buyer.setBuyerProvince(request.getParameter("buyerProvince"));
		buyer.setBuyerCity(request.getParameter("buyerCity"));
		buyer.setBuyerDistrict(request.getParameter("buyerDistrict"));
		buyer.setBuyerLocation(request.getParameter("buyerLocation"));
		cmsc.update(order, buyer);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
