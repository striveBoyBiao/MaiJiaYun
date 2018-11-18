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
import mjy.order.bean.info.PageInfo;
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
import mjy.order.dao.impl.DetailGoodDaoImpl;
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

@WebServlet("/servlet/order/shenHe")
public class ShenHe extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/**
		 * 1.��������ˣ���������ʱ����һ����Ҫ���ľ��ǲ�ѯ���к�̨�����ж���״̬Ϊ��˵Ķ���������Ĳ�ѯΪ��ҳ��ѯ��
		 * 		��ҳ��ҳ����ǰ̨��ÿҳ��ʾҳ����������ͬ�Ͽ�ʱ��ķ�ҳ��ѯ��
		 * 2.�����õ����ݷ�װ��һ��request��Attribute�Ȼ��ͨ��ת�������ݷ��͵�ǰ̨jsp
		 * 
		 * 3.jsp���յ����ݺ�ͨ������ѭ��д������δ��˶�����tbody;
		 * 
		 * 
		 */
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("application/json;charset=utf-8");
		
		request.setAttribute("pageInfo", getAllInfos(request, response));
		request.getRequestDispatcher("/Order/jsp/daiShenHe.jsp").forward(request, response);
	
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	private PageInfo getAllInfos(HttpServletRequest request,HttpServletResponse response) {
		OrderService orderService = new OrderServiceImpl();
		BuyerService buyerService = new BuyerServiceImpl();
		DetailGoodService detailGoodService = new DetailGoodServiceImpl();
		LogisticService logisticService = new LogisticServiceImpl();
		ShopService shopService = new ShopServiceImpl();
		
		PageInfo<OrderInfo> pageInfo = new PageInfo<OrderInfo>();
		/**
		 */
		//���ҳ�洫�ݽ�����ÿҳ��ʾ������
		String pageSize = request.getParameter("pageSize")==null?"10":request.getParameter("pageSize");
		//���ҳ�洫������ҳ��
		String pageNow = request.getParameter("pageNow")==null?"1":request.getParameter("pageNow");
		
		String shopId = request.getParameter("shopId");
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
		/*System.out.println("����Ϊ��"+shopId);
		System.out.println("����Ϊ��"+logisticId);
		System.out.println("֧����ʽΪ��"+orderPayWay);
		System.out.println("�˵���Ϊ��"+orderCode);
		System.out.println("�������Ϊ��"+buyerName);
		System.out.println("����ֻ�Ϊ��"+buyerPhone);
		System.out.println("��ҵ绰Ϊ��"+buyerTel);
		System.out.println("��ҵ�ַΪ��"+buyerAddress);
		System.out.println("��ƷidΪ��"+goodId);
		System.out.println("skuΪ��"+sku);
		System.out.println("��Ʒ����Ϊ��"+goodName);
		System.out.println("��Ʒ����Ϊ��"+detailGoodNum);
		System.out.println("������ұ�עΪ��"+buyerRemark);
		System.out.println("�������ұ�עΪ��"+sellerRemark);
		System.out.println("�µ�ʱ���Ϊ��"+orderTimeFrom);
		System.out.println("�µ�ʱ��ָΪ��"+orderTimeTo);
		System.out.println("��ʱ���Ϊ��"+orderExaTimeFrom);
		System.out.println("��ʱ����Ϊ��"+orderExaTimeTo);
		System.out.println("����ʱ���Ϊ��"+orderSendTimeFrom);
		System.out.println("����ʱ����Ϊ��"+orderSendTimeTo);*/
		
		
		OrderPO orderPO = new OrderPO();
		BuyerPO buyerPO = new BuyerPO();
		DetailGoodPO detailGoodPO = new DetailGoodPO();
		
		/**
		 * ��PO��������
		 */
		//ÿҳ��ʾ������
		pageInfo.setPageSize(Integer.parseInt(pageSize));
		pageInfo.setPageNow(Integer.parseInt(pageNow));
		orderPO.setPageSize(pageInfo.getPageSize());
		orderPO.setBeginRow(pageInfo.getPgaeBegin());
		
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
			/**-----��ѯ����------*/
			//����Ҳ�ѯ��������
			buyerPO2 = new BuyerPO();
			buyerPO2.setBuyerId(order.getBuyerId());
			//����Ʒ��ѯ��������
			detailGoodPO2 = new DetailGoodPO();
			detailGoodPO2.setOrderCode(order.getOrderCode());
			//�����̲�ѯ��������
			shopPO2 = new ShopPO();
			shopPO2.setShopId(order.getShopId());
			//����ݲ�ѯ��������
			logisticPO2 = new LogisticPO();
			logisticPO2.setLogisticId(order.getLogisticId());
			
			/**-----������Ϣ------*/
			//�����Ϣ
			allInfo.setBuyer(buyerService.buyerQuery(buyerPO2));
			//��Ʒ��Ϣ(��Ʒ��List)
			allInfo.setDetailGoods(detailGoodService.detailGoodQueryAll(detailGoodPO2));
			//������Ϣ
			allInfo.setShop(shopService.shopQuery(shopPO2));
			//�����Ϣ
			allInfo.setLogistic(logisticService.logisticQuery(logisticPO2));
			//�����������Ϣ
			allInfo.setOrder(order);
			
			//���뵽����
			allInfos.add(allInfo);
		}
		List<Shop> shops = shopService.shopQueryAll();
		List<Logistic> logistics = logisticService.logisticQueryAll();
		
		
		System.out.println("����������"+allInfos.size());
		for (OrderInfo allInfo2 : allInfos) {
			System.out.println(allInfo2.getBuyer().getBuyerId());
		}
		pageInfo.setLogistics(logistics);
		pageInfo.setOrderInfos(allInfos);
		pageInfo.setShops(shops);
		//��ö�������
		pageInfo.setOrdersNum(orderService.orderQueryCount(orderPO));
		
		pageInfo.setServletUri(request.getRequestURI());
		System.out.println("pageOrderNum"+pageInfo.getOrdersNum());
		System.out.println("pageSize"+pageInfo.getPageSize());
		System.out.println("pageCounts:"+pageInfo.getPageCounts());
		return pageInfo;
	}
}
