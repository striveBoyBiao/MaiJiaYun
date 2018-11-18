package mjy.order.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.formula.functions.Odd;

import mjy.order.bean.info.OrderInfo;
import mjy.order.bean.po.BuyerPO;
import mjy.order.bean.po.ClientMessagePo;
import mjy.order.bean.po.DealMessagePo;
import mjy.order.bean.po.DetailGoodPO;
import mjy.order.bean.po.LogisticPO;
import mjy.order.bean.po.OrderPO;
import mjy.order.bean.vo.Buyer;
import mjy.order.bean.vo.ClientMessage;
import mjy.order.bean.vo.DealMessage;
import mjy.order.bean.vo.DetailGood;
import mjy.order.bean.vo.Logistic;
import mjy.order.bean.vo.Order;
import mjy.order.service.BuyerService;
import mjy.order.service.ClientMessageService;
import mjy.order.service.DealMessageService;
import mjy.order.service.DetailGoodService;
import mjy.order.service.LogisticService;
import mjy.order.service.OrderService;
import mjy.order.service.impl.BuyerServiceImpl;
import mjy.order.service.impl.ClientMessageServiceImpl;
import mjy.order.service.impl.DealMessageServiceImpl;
import mjy.order.service.impl.DetailGoodServiceImpl;
import mjy.order.service.impl.LogisticServiceImpl;
import mjy.order.service.impl.OrderServiceImpl;
import net.sf.json.JSONArray;

@WebServlet("/sevlet/order/Details")
public class Details extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ClientMessageService cmsc=new ClientMessageServiceImpl();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		OrderService orderService = new OrderServiceImpl();
		BuyerService buyerService = new BuyerServiceImpl();
		DetailGoodService detailGoodService = new DetailGoodServiceImpl();
		LogisticService logisticService = new LogisticServiceImpl();
		request.setCharacterEncoding("utf-8");
		response.setContentType("application/json;charset=utf-8");
		String orderCode = request.getParameter("orderCode");
		System.out.println("参数为："+orderCode);
		
		OrderPO orderPO = new OrderPO();
		orderPO.setOrderCode(orderCode);
		Order order = orderService.orderQuery(orderPO);
		
		BuyerPO buyerPO = new BuyerPO();
		buyerPO.setBuyerId(order.getBuyerId());
		Buyer buyer = buyerService.buyerQuery(buyerPO);
		
		DetailGoodPO detailGoodPO = new DetailGoodPO();
		detailGoodPO.setOrderCode(orderCode);
		List<DetailGood> detailGoods = detailGoodService.detailGoodQueryAll(detailGoodPO);
		
		LogisticPO logisticPO = new LogisticPO();
		Logistic logistic = logisticService.logisticQuery(logisticPO);
		
		OrderInfo ordernfo = new OrderInfo(order,buyer,logistic,detailGoods);
		/*for (Order order : orders) {
			System.out.println("ajax:"+order);
		}*/
		
		/*设置详情中客户和交易信息-start*/
//		ClientMessageService cmsc=new ClientMessageServiceImpl();
		ClientMessagePo cmpo=new ClientMessagePo();
		cmpo.setOrderCode(orderCode);
		ClientMessage clientMessage=cmsc.queryClient(cmpo);
		ordernfo.setClientMessage(clientMessage);
		
		DealMessageService dmsc=new DealMessageServiceImpl();
		DealMessagePo dmpo=new DealMessagePo();
		dmpo.setOrderCode(orderCode);
		DealMessage dealMessage=dmsc.queryDeal(dmpo);
		ordernfo.setDealMessage(dealMessage);
		/*设置-end-*/
		
		
		JSONArray jsonArray = JSONArray.fromObject(ordernfo);
		PrintWriter out = response.getWriter();
		out.println(jsonArray.toString());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
//	public void saveClient(HttpServletRequest request, HttpServletResponse response)throws Exception{
//		/*根据订单号获得订单对象*/
//		OrderService orderService = new OrderServiceImpl();
//		OrderPO orderPO = new OrderPO();
//		String orderCode = request.getParameter("orderCode");
//		orderPO.setOrderCode(orderCode);
//		System.out.println("订单好是："+orderCode);
//		Order ord = orderService.orderQuery(orderPO);
//		
//		
//		/*要保存信息*/
//		Order order=new Order();
//		order.setBuyerId(ord.getBuyerId());
//		order.setOrderCode(request.getParameter("orderCode"));
//		order.setOrderBuyerRemark(request.getParameter("orderBuyerRemark"));
//		order.setOrderSellerRemark(request.getParameter("orderSellerRemark"));
//		order.setLogisticId(Integer.parseInt(request.getParameter("LogisticId")));
//		Buyer buyer=new Buyer();
//		buyer.setBuyerName(request.getParameter("buyerName"));
//		buyer.setBuyerTel(request.getParameter("buyerTel"));
//		buyer.setBuyerPhone(request.getParameter("buyerPhone"));
//		buyer.setBuyerPostcode(request.getParameter("buyerPostcode"));
//		buyer.setBuyerProvince(request.getParameter("buyerProvince"));
//		buyer.setBuyerCity(request.getParameter("buyerCity"));
//		buyer.setBuyerDistrict(request.getParameter("buyerDistrict"));
//		buyer.setBuyerLocation(request.getParameter("buyerLocation"));
//		cmsc.update(order, buyer);
//	}
	
}
