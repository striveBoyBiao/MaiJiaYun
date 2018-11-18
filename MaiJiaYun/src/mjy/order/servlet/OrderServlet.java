package mjy.order.servlet;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sun.jmx.snmp.tasks.ThreadService;

import mjy.common.servlet.BaseServlet;
import mjy.login.beans.vo.UserInfoVO;
import mjy.order.bean.info.OrderInfo;
import mjy.order.bean.info.PageInfo;
import mjy.order.bean.po.BuyerPO;
import mjy.order.bean.po.ClientMessagePo;
import mjy.order.bean.po.DealMessagePo;
import mjy.order.bean.po.DetailGoodPO;
import mjy.order.bean.po.LogisticPO;
import mjy.order.bean.po.OrderPO;
import mjy.order.bean.po.ShopPO;
import mjy.order.bean.vo.Buyer;
import mjy.order.bean.vo.ClientMessage;
import mjy.order.bean.vo.DealMessage;
import mjy.order.bean.vo.DetailGood;
import mjy.order.bean.vo.Logistic;
import mjy.order.bean.vo.Order;
import mjy.order.bean.vo.Shop;
import mjy.order.service.BuyerService;
import mjy.order.service.ClientMessageService;
import mjy.order.service.DealMessageService;
import mjy.order.service.DetailGoodService;
import mjy.order.service.LogisticService;
import mjy.order.service.OrderService;
import mjy.order.service.ShopService;
import mjy.order.service.impl.BuyerServiceImpl;
import mjy.order.service.impl.ClientMessageServiceImpl;
import mjy.order.service.impl.DealMessageServiceImpl;
import mjy.order.service.impl.DetailGoodServiceImpl;
import mjy.order.service.impl.LogisticServiceImpl;
import mjy.order.service.impl.OrderServiceImpl;
import mjy.order.service.impl.ShopServiceImpl;
import net.sf.json.JSONArray;

@WebServlet("/servlet/order/orderServlet")
public class OrderServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
	//审核
	public void shenHe(HttpServletRequest request,HttpServletResponse response){
		/**
		 * 1.��������ˣ���������ʱ����һ����Ҫ���ľ��ǲ�ѯ���к�̨�����ж���״̬Ϊ��˵Ķ���������Ĳ�ѯΪ��ҳ��ѯ��
		 * 		��ҳ��ҳ����ǰ̨��ÿҳ��ʾҳ����������ͬ�Ͽ�ʱ��ķ�ҳ��ѯ��
		 * 2.�����õ����ݷ�װ��һ��request��Attribute�Ȼ��ͨ��ת�������ݷ��͵�ǰ̨jsp
		 * 
		 * 3.jsp���յ����ݺ�ͨ������ѭ��д������δ��˶�����tbody;
		 * 
		 * 
		 */
		try {
			request.setCharacterEncoding("utf-8");
			response.setContentType("application/json;charset=utf-8");
			
			request.setAttribute("pageInfo", getAllInfos(request, response));
			request.getRequestDispatcher("/Order/jsp/daiShenHe.jsp").forward(request, response);
		}  catch (Exception e) {
			e.printStackTrace();
		}
	
	
	}
	//反审
	public void fanShen(HttpServletRequest request,HttpServletResponse response){
		try {
			/**
			 * ����
			 * 		�����ж���״̬Ϊ���󵥵Ķ�����ѯ������ͨ�������ת�����͵�jsp��д�ڶ�Ӧ��tbody��
			 */
			request.setAttribute("pageInfo", getAllInfos(request, response));
			request.getRequestDispatcher("/Order/jsp/fanShen.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//发货
	public void faHuo(HttpServletRequest request,HttpServletResponse response){
		try {
			/**
			 * ͬ���ǲ�ѯ���ݿ��ж���״̬Ϊ���󵥵Ķ���
			 */
			request.setAttribute("pageInfo", getAllInfos(request, response));
			request.getRequestDispatcher("/Order/jsp/daiFaHuo.jsp").forward(request, response);
			/*������ӡ���ܡ����в����ڴ�ӡ�������ʹ�ӡ��ݵ��ֶ�״̬��
			 * ��ʾʱ����jspҳ�渳ֵĬ��״ֵ̬��δ��ӡ��*/
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//合并
	public void heBing(HttpServletRequest request,HttpServletResponse response) {
		try {
			/**
			 * ʵ��˼·��
			 * 1.��ҳ��������ת���ϲ�ҳ��ʱ�����ȵ�һ���¾��Ǽ�鶩��״̬Ϊ�󵥵Ķ������鿴�����Ƿ�����û�����ͬ��
			 * 		�ֻ�����ͬ��������ͬ�Ŀ�ݣ�������Ϊͬһ�˵ģ�������У��򽫸��ж�����ʾ���·������ҽ�
			 * 		ҳ��ʵ�ֵĸ��������е�ҳ����ͬ��������Ʒ���Բ�ͬ��
			 * 2.ͬ���ģ�����ѯ�Ľ����ת���ķ�ʽ���͵���Ӧ��jsp
			 * 3.��ʵ�ֲ�ѯ����������˵
			 */
			request.getRequestDispatcher("/Order/jsp/daiHeBing.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	
	}
	
	//拆分
	public void chaiFen(HttpServletRequest request,HttpServletResponse response) {
		try {
			/**
			 * ��ֵ�˼·��
			 * 1.����ʵ�ֲ�ѯ����ѯ����״̬Ϊ�󵥵����ж����У���������1�Ķ�����Ȼ�����еĶ�������Ϣͨ��ת���ķ�ʽ
			 * 		ת������Ӧ��jsp
			 */
			
			request.getRequestDispatcher("/Order/jsp/daiChaiFen.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	
	}
	
	//商品信息
	public void details(HttpServletRequest request,HttpServletResponse response) {
		try {
			OrderService orderService = new OrderServiceImpl();
			BuyerService buyerService = new BuyerServiceImpl();
			DetailGoodService detailGoodService = new DetailGoodServiceImpl();
			LogisticService logisticService = new LogisticServiceImpl();
			request.setCharacterEncoding("utf-8");
			response.setContentType("application/json;charset=utf-8");
			String orderCode = request.getParameter("orderCode");
			
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
			
			/**/
			ClientMessageService cmsc=new ClientMessageServiceImpl();
			ClientMessagePo cmpo=new ClientMessagePo();
			cmpo.setOrderCode(orderCode);
			ClientMessage clientMessage=cmsc.queryClient(cmpo);
			ordernfo.setClientMessage(clientMessage);
			
			DealMessageService dmsc=new DealMessageServiceImpl();
			DealMessagePo dmpo=new DealMessagePo();
			dmpo.setOrderCode(orderCode);
			DealMessage dealMessage=dmsc.queryDeal(dmpo);
			ordernfo.setDealMessage(dealMessage);
			/**/
			JSONArray jsonArray = JSONArray.fromObject(ordernfo);
			PrintWriter out = response.getWriter();
			out.println(jsonArray.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
	
	}
	
	//已发货
	public void yiFaHuo(HttpServletRequest request,HttpServletResponse response){
		try {
			/**
			 *
			 */
			request.setAttribute("pageInfo", getAllInfos(request,response));
			request.getRequestDispatcher("/Order/jsp/yiFaHuo.jsp").forward(request, response);
		} catch (ServletException e) {
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	private PageInfo<OrderInfo> getAllInfos(HttpServletRequest request,HttpServletResponse response) {
		OrderService orderService = new OrderServiceImpl();
		BuyerService buyerService = new BuyerServiceImpl();
		DetailGoodService detailGoodService = new DetailGoodServiceImpl();
		LogisticService logisticService = new LogisticServiceImpl();
		ShopService shopService = new ShopServiceImpl();
		
		PageInfo<OrderInfo> pageInfo = new PageInfo<OrderInfo>();
		
		String method = request.getParameter("method");
		HttpSession session = request.getSession();
		UserInfoVO userInfoVO = (UserInfoVO) session.getAttribute("userInfoVO");
		Integer userId = userInfoVO.getBossPO().getUserID();
		//
		
		//页面行数
		String pageSize = request.getParameter("pageSize")==null?"10":request.getParameter("pageSize");
		//当前页
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
		
		
		OrderPO orderPO = new OrderPO();
		BuyerPO buyerPO = new BuyerPO();
		DetailGoodPO detailGoodPO = new DetailGoodPO();
		
		
		//给pageInfo添加信息
		pageInfo.setPageSize(Integer.parseInt(pageSize));
		pageInfo.setPageNow(Integer.parseInt(pageNow));
		orderPO.setPageSize(pageInfo.getPageSize());
		orderPO.setBeginRow(pageInfo.getPgaeBegin());
		
		if (userId!=null) {
			orderPO.setUserId(userId);
		}
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
		//
		//String uri = request.getRequestURI();
		//判断是审核，还是反审，还是发货
		String orderCheck = request.getParameter("orderCheck");
		if (orderCheck!=null&&!orderCheck.equals("")&&method.equals("shenHe")) {
			orderService.uqdate(orderCheck,2);
		}else if(orderCheck!=null&&!orderCheck.equals("")&&method.equals("fanShen")){
			orderService.uqdate(orderCheck, 1);
		}else if(orderCheck!=null&&!orderCheck.equals("")&&method.equals("faHuo")){
			orderService.uqdate(orderCheck, 3);
		}
		
		if (method.equals("shenHe")||method.equals("heBing")||method.equals("chaiFen")) {
			orderPO.setOrderState(1);
		}else if(method.equals("fanShen")||method.equals("faHuo")) {
			orderPO.setOrderState(2);
		}else if(method.equals("yiFaHuo")) {
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
		
		
		pageInfo.setLogistics(logistics);
		pageInfo.setOrderInfos(allInfos);
		pageInfo.setShops(shops);
		//��ö�������
		pageInfo.setOrdersNum(orderService.orderQueryCount(orderPO));
		
		pageInfo.setServletUri(request.getRequestURI()+"?method="+method);
		return pageInfo;
	}
}
