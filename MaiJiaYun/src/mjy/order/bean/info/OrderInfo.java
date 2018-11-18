package mjy.order.bean.info;

import java.util.List;

import mjy.order.bean.vo.Buyer;
import mjy.order.bean.vo.ClientMessage;
import mjy.order.bean.vo.DealMessage;
import mjy.order.bean.vo.DetailGood;
import mjy.order.bean.vo.Logistic;
import mjy.order.bean.vo.Order;
import mjy.order.bean.vo.Shop;

public class OrderInfo {
	private Order order;
	private Buyer buyer;
	private Shop shop;
	private Logistic logistic;
	private List<DetailGood> detailGoods;
	private ClientMessage clientMessage;//客户信息
	private DealMessage dealMessage;//交易信息

	
	public OrderInfo() {
		
	}
	
	public OrderInfo(Order order, Buyer buyer,  Logistic logistic, List<DetailGood> detailGoods) {
		this.order = order;
		this.buyer = buyer;
		this.logistic = logistic;
		this.detailGoods = detailGoods;
	}

	public Logistic getLogistic() {
		return logistic;
	}
	public void setLogistic(Logistic logistic) {
		this.logistic = logistic;
	}
	public Shop getShop() {
		return shop;
	}
	public void setShop(Shop shop) {
		this.shop = shop;
	}
	public Order getOrder() {
		return order;
	}
	public Buyer getBuyer() {
		return buyer;
	}
	public void setOrder(Order order) {
		this.order = order;
	}
	public void setBuyer(Buyer buyer) {
		this.buyer = buyer;
	}
	public List<DetailGood> getDetailGoods() {
		return detailGoods;
	}
	public void setDetailGoods(List<DetailGood> detailGoods) {
		this.detailGoods = detailGoods;
	}
	
	//
	public ClientMessage getClientMessage() {
		return clientMessage;
	}

	public void setClientMessage(ClientMessage clientMessage) {
		this.clientMessage = clientMessage;
	}

	public DealMessage getDealMessage() {
		return dealMessage;
	}

	public void setDealMessage(DealMessage dealMessage) {
		this.dealMessage = dealMessage;
	}

}
