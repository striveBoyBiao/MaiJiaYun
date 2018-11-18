package mjy.caiwu.kucunchengben.po;

/**
 * 封装分页信息
 * 
 * @author david
 *
 */
public class PageInfo<T> {
	private int firstpage;// 第一页
	private int total;// 记录总数
	private int pageNum;// 当前页面数
	private int pageSize;// 每页显示数量
	private int maxPageNum;// 页面总数
	private Object searchCondition;//搜索条件

	public Object getSearchCondition() {
		return searchCondition;
	}

	public void setSearchCondition(Object searchCondition) {
		this.searchCondition = searchCondition;
	}

	public int getFirstpage() {
		return firstpage;
	}

	public void setFirstpage(int firstpage) {
		this.firstpage = firstpage;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getMaxPageNum() {
		return maxPageNum;
	}

	public void setMaxPageNum(int maxPageNum) {
		this.maxPageNum = maxPageNum;
	}

}
