package mjy.caiwu.fukuan.beans;

import java.util.List;

public class PageInfo<T> {

	private String pageNo;//当前页码
	public static int pageSize;//每页显示的记录条数
	private int pageBegin;//从哪开始
	private int rowCount;//总记录条数
	private int pageCount;//总页数
	private List<T> pageDate;//当前页数据
	private String queryParam;//请求参数
	
	public PageInfo(String pageNo) {
		this.pageNo=pageNo;
	}
	
	public String getPageNo() {
		return pageNo;
	}
	public void setPageNo(String pageNo) {
		this.pageNo = pageNo;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
		this.pageBegin=(Integer.parseInt(pageNo)-1)*pageSize;
	}
	public int getPageBegin() {
		return pageBegin;
	}
	public void setPageBegin(int pageBegin) {
		this.pageBegin = pageBegin;
	}
	public int getRowCount() {
		return rowCount;
	}
	public void setRowCount(int rowCount) {
		this.rowCount = rowCount;
	}
	public int getPageCount() {
		return pageCount;
	}
	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}
	public List<T> getPageDate() {
		return pageDate;
	}
	public void setPageDate(List<T> pageDate) {
		this.pageDate = pageDate;
	}
	public String getQueryParam() {
		return queryParam;
	}
	public void setQueryParam(String queryParam) {
		this.queryParam = queryParam;
	}
	
}
