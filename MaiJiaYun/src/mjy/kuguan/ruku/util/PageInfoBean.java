package mjy.kuguan.ruku.util;

import java.util.List;




public class PageInfoBean<T> {
	// 当前页数
	private String pageNo;
	// 每页有多少行
	public  int pageSize = 10;
	// 从第几条开始
	private String pageBegin;
	// 一共有多少页
	private String pageCount;
	// 请求参数
	private List<T> list;
	// 添加查询条件的语句
	private String queryParm;
	// 一共多少数据
	private String rowCount;

	public String getPageNo() {
		return pageNo;
	}

	public void setPageNo(String pageNo) {
		this.pageNo = pageNo;
		int i = Integer.parseInt(pageNo);
		this.pageBegin = String.valueOf((i-1)*pageSize); 
	}

	public String getPageBegin() {
		return pageBegin;
	}

	public void setPageBegin(String pageBegin) {
		this.pageBegin = pageBegin;
	}

	public String getPageCount() {
		return pageCount;
	}

	public void setPageCount(String pageCount) {
		this.pageCount = pageCount;
	}

	public List<T> getList() {
		return list;
	}

	public void setList(List<T> list) {
		this.list = list;
	}

	public String getQueryParm() {
		return queryParm;
	}

	public void setQueryParm(String queryParm) {
		this.queryParm = queryParm;
	}

	public String getRowCount() {
		return rowCount;
	}

	public void setRowCount(String rowCount) {
		this.rowCount = rowCount;
	}

}
