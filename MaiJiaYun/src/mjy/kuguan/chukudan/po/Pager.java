package mjy.kuguan.chukudan.po;

import java.util.List;

import org.junit.Test;

public class Pager<T> {
	private int pageNum;//页码
	private int pageSize;//一共显示几条
	private int total;//当前页面总条数
	private int total1;//另外的第一个页面总条数
	private int total2;//另外的第二个页面总条数
	private int maxPageNum;//最大页码
	private int maxNum;//查询出来有多少条数据
	private List<T> data;//查询出来的数据
	private List<T> cangkus;//仓库
	
	public int getTotal1() {
		return total1;
	}
	/**
	 * 另外的第一个页面总条数
	 * @return
	 */
	public void setTotal1(int total1) {
		this.total1 = total1;
	}
	
	public int getPageNum() {
		return pageNum;
	}
	/**
	 * 页码
	 * @param pageNum
	 */
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	public int getPageSize() {
		return pageSize;
	}
	/**
	 * 页面大小
	 * @param pageSize
	 */
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getTotal() {
		return total;
	}
	/**
	 * 设置当前页总条数
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
	 * 最大页码
	 * @param maxPageNum
	 */
	public void setMaxPageNum(int maxPageNum) {
		this.maxPageNum = maxPageNum;
	}
	
	public List<T> getData() {
		return data;
	}
	/**
	 * 查询出来的集合
	 * @return
	 */
	public void setData(List<T> data) {
		this.data = data;
	}
	public int getTotal2() {
		return total2;
	}
	/**
	 * 另外的第二个页面总条数
	 * @param total2
	 */
	public void setTotal2(int total2) {
		this.total2 = total2;
	}
	public int getMaxNum() {
		return maxNum;
	}
	/**
	 * 每个页面查询出来的条数
	 * @param maxNum
	 */
	public void setMaxNum(int maxNum) {
		this.maxNum = maxNum;
	}
	public List<T> getCangkus() {
		return cangkus;
	}
	/*
	 * 仓库集合
	 */
	public void setCangkus(List<T> cangkus) {
		this.cangkus = cangkus;
	}
	
}
