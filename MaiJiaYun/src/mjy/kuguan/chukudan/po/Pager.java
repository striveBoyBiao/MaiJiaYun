package mjy.kuguan.chukudan.po;

import java.util.List;

import org.junit.Test;

public class Pager<T> {
	private int pageNum;//ҳ��
	private int pageSize;//һ����ʾ����
	private int total;//��ǰҳ��������
	private int total1;//����ĵ�һ��ҳ��������
	private int total2;//����ĵڶ���ҳ��������
	private int maxPageNum;//���ҳ��
	private int maxNum;//��ѯ�����ж���������
	private List<T> data;//��ѯ����������
	private List<T> cangkus;//�ֿ�
	
	public int getTotal1() {
		return total1;
	}
	/**
	 * ����ĵ�һ��ҳ��������
	 * @return
	 */
	public void setTotal1(int total1) {
		this.total1 = total1;
	}
	
	public int getPageNum() {
		return pageNum;
	}
	/**
	 * ҳ��
	 * @param pageNum
	 */
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	public int getPageSize() {
		return pageSize;
	}
	/**
	 * ҳ���С
	 * @param pageSize
	 */
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getTotal() {
		return total;
	}
	/**
	 * ���õ�ǰҳ������
	 * @param total
	 */
	public void setTotal(int total) {
		this.total = total;
	}
	
	
	
	public int getMaxPageNum() {
		maxPageNum = (int)Math.ceil(this.getMaxNum()*1.0/this.getPageSize());
		return maxPageNum;
	}
	/**
	 * ���ҳ��
	 * @param maxPageNum
	 */
	public void setMaxPageNum(int maxPageNum) {
		this.maxPageNum = maxPageNum;
	}
	
	public List<T> getData() {
		return data;
	}
	/**
	 * ��ѯ�����ļ���
	 * @return
	 */
	public void setData(List<T> data) {
		this.data = data;
	}
	public int getTotal2() {
		return total2;
	}
	/**
	 * ����ĵڶ���ҳ��������
	 * @param total2
	 */
	public void setTotal2(int total2) {
		this.total2 = total2;
	}
	public int getMaxNum() {
		return maxNum;
	}
	/**
	 * ÿ��ҳ���ѯ����������
	 * @param maxNum
	 */
	public void setMaxNum(int maxNum) {
		this.maxNum = maxNum;
	}
	public List<T> getCangkus() {
		return cangkus;
	}
	/*
	 * �ֿ⼯��
	 */
	public void setCangkus(List<T> cangkus) {
		this.cangkus = cangkus;
	}
	
}
