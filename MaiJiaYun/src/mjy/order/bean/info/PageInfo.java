package mjy.order.bean.info;

import java.util.List;

import mjy.order.bean.vo.Logistic;
import mjy.order.bean.vo.Shop;

public class PageInfo<T> {
	private List<T> orderInfos;//������Ӧ��������Ϣ
	private List<Logistic> logistics;//���е�������˾
	private List<Shop> shops;//���еĵ���
	private Integer ordersNum;//�ܵĶ�������
	private Integer pageNow;//��ǰҳ��
	private Integer pageCounts;//��ҳ��
	private Integer pageSize;//ҳ����ʾ������
	private Integer pgaeBegin;//��ʼ����
	private String servletUri;
	
	public PageInfo() {
		
	}
	public List<T> getOrderInfos() {
		return orderInfos;
	}
	public List<Logistic> getLogistics() {
		return logistics;
	}
	public List<Shop> getShops() {
		return shops;
	}
	public Integer getOrdersNum() {
		return ordersNum;
	}
	public Integer getPageNow() {
		return pageNow;
	}
	public Integer getPageCounts() {
		return pageCounts;
	}
	public Integer getPageSize() {
		return pageSize;
	}
	public Integer getPgaeBegin() {
		return pgaeBegin;
	}
	public String getServletUri() {
		return servletUri;
	}
	public void setOrderInfos(List<T> orderInfos) {
		this.orderInfos = orderInfos;
	}
	public void setLogistics(List<Logistic> logistics) {
		this.logistics = logistics;
	}
	public void setShops(List<Shop> shops) {
		this.shops = shops;
	}
	public void setOrdersNum(Integer ordersNum) {
		this.ordersNum = ordersNum;
		setPageCounts();
	}
	public void setPageNow(Integer pageNow) {
		this.pageNow = pageNow;
		setPgaeBegin();
	}
	//ҳ����ҳ����������/pageSize
	private void setPageCounts() {
		if (this.ordersNum!=null&&this.pageSize!=null) {
			if (ordersNum%pageSize==0) {
				this.pageCounts = ordersNum/pageSize;
			}else{
				this.pageCounts = ordersNum/pageSize+1;
			}
		}
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
		setPgaeBegin();
		setPageCounts();
	}
	private void setPgaeBegin() {
		if (pageSize!=null&&pageNow!=null) {
			this.pgaeBegin = (pageNow-1)*pageSize;
		}
	}
	public void setServletUri(String servletUri) {
		this.servletUri = servletUri;
	}
	
	

	
}
