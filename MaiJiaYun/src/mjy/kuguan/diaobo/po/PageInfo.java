package mjy.kuguan.diaobo.po;

import java.util.List;

/**
 * @author student
 *
 * @param <T>
 */
public class PageInfo<T> {
	//当前页码
	private String pageNo;
	//每页显示的记录条数
	public  Integer pageSize;
	//当前页数据
	
	private int pageBegin;
	
	private List<T> pageData;
	//总页数
	private Integer pageCount;
	//总记录条数
	private int rowCount;
	//请求参数
	private String queryParam;
	
	

	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

	public Integer getPageCount() {
		return pageCount;
	}

	public void setPageCount(Integer pageCount) {
		this.pageCount = pageCount;
	}


	public String getPageNo() {
		return pageNo;
	}

	public PageInfo(String pageNo) {
		super();
		this.pageNo = pageNo;
	}
	

	public PageInfo() {
		super();
	}

	public void setPageNo(String pageNo) {
		this.pageNo = pageNo;
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

	public String getQueryParam() {
		return queryParam;
	}

	public void setQueryParam(String queryParam) {
		this.queryParam = queryParam;
	}

	public List<T> getPageData() {
		return pageData;
	}

	public void setPageData(List<T> pageData) {
		this.pageData = pageData;
	}

	@Override
	public String toString() {
		return "PageInfo [pageNo=" + pageNo + ", pageSize=" + pageSize + ", pageBegin=" + pageBegin + ", pageData="
				+ pageData + ", pageCount=" + pageCount + ", rowCount=" + rowCount + ", queryParam=" + queryParam + "]";
	}

	
}
