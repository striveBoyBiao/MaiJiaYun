package mjy.caigou.beans;

import java.util.List;

/**
 * 封装分页用数据
 * 
 * @author igeek
 *
 */
public class PageInfo<T> {

	// 当前页码
	private String pageNo;
	// 每页显示的记录条数
	public static int pageSize=3 ;

	private int pageBegin;
	// 总记录条数
	private int rowCount;
	// 总页数
	private int pageCount;
	// 当前页数据
	private List<T> pageDate;
	// 请求参数
	public static String  queryParam="";

	public PageInfo(String pageNo) {
		this.pageNo = pageNo;
		this.pageBegin = (Integer.parseInt(pageNo) - 1) * pageSize;
	}

	public String getPageNo() {
		return pageNo;
	}

	public void setPageNo(String pageNo) {
		this.pageNo = pageNo;
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

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getPageBegin() {
		return pageBegin;
	}

	public void setPageBegin(int pageBegin) {
		this.pageBegin = pageBegin;
	}

	public String getQueryParam() {
		return queryParam;
	}

	public void setQueryParam(String queryParam) {
		this.queryParam = queryParam;
	}

}
