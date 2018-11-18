package mjy.order.servlet;
/**
 * 待发货页面servlet
 * 获取待发货页面所需数据并转发到待发货页面的jsp
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
		 * 同样是查询数据库中订单状态为已审单的订单
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
		//查询出所有待打单发货状态的订单(订单状态为2)
		List<Order> orders = orderService.orderQueryAll(orderPO);
		
		for (Order order : orders) {
			allInfo=new OrderInfo();
			
			/*查询条件赋值*/
			buyerPO=new BuyerPO();
			buyerPO.setBuyerId(order.getBuyerId());
			
			detailGoodPO=new DetailGoodPO();
			detailGoodPO.setOrderCode(order.getOrderCode());
		
			shopPO=new ShopPO();
			shopPO.setShopId(order.getShopId());
			
			logisticPO=new LogisticPO();
			logisticPO.setLogisticId(order.getLogisticId());
			
			/*通过各po查询数据放到AllInfo类中*/
			
			allInfo.setBuyer(buyerService.buyerQuery(buyerPO));
			allInfo.setDetailGoods(detailGoodService.detailGoodQueryAll(detailGoodPO));
			allInfo.setLogistic(logisticService.logisticQuery(logisticPO));
			allInfo.setShop(shopService.shopQuery(shopPO));
			allInfo.setOrder(order);
			
			/*把所有存在的待发货订单放入集合*/
			allInfos.add(allInfo);
		}
		request.setAttribute("allInfos", allInfos);
		request.getRequestDispatcher("/Order/jsp/daiFaHuo.jsp").forward(request, response);
		/*跳过打印功能。所有不存在打印发货单和打印快递单字段状态。
		 * 显示时可在jsp页面赋值默认状态值‘未打印’*/
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
