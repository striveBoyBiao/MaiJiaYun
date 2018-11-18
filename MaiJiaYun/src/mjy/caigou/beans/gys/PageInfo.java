package mjy.caigou.beans.gys;

import java.util.List;

/**
 * @author student
 *
 * @param <T>
 */
public class PageInfo<T> {
	// 当前页面数
	private Integer pageNum;
	// 页面大小
	public static Integer pageSize;
	// 页面查询数据
	private List<T> pageData;
	// 总页数
	private Integer pageCount;
	// 总记录数
	private Integer totalRecords;
	// 查询参数
	private String queryUrl;

	public String getQueryUrl() {
		return queryUrl;
	}

	public void setQueryUrl(String queryUrl) {
		this.queryUrl = queryUrl;
	}

	public Integer getTotalRecords() {
		return totalRecords;
	}

	public void setTotalRecords(Integer totalRecords) {
		this.totalRecords = totalRecords;
	}

	public Integer getPageCount() {
		return pageCount;
	}

	public void setPageCount(Integer pageCount) {
		this.pageCount = pageCount;
	}

	public PageInfo(int pageNum) {
		this.pageNum = pageNum;
	}

	public void setPageNum(Integer pageNum) {
		this.pageNum = pageNum;
	}

	public Integer getPageNum() {
		return pageNum;
	}

	public List<T> getPageData() {
		return pageData;
	}

	public void setPageData(List<T> pageData) {
		this.pageData = pageData;
	}

}
