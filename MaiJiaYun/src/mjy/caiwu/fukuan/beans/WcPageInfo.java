package mjy.caiwu.fukuan.beans;
import java.util.List;
/**
 * 分页
 * 
 * @author igeek
 *
 */
public class WcPageInfo<T> {
	//当前页
	private String pageNo;
	//每页大小
	public static int pageSize =10;
	//每页开始
	public static int pageBegin=0;
	//总共多少条数据
	private int rowCount;
	//页的数量
	private int pageCount;
	//每页数据
	private List<T> pageDate;
	//查询的数量
	private Integer queryCount;

	public WcPageInfo(String pageNo) {
		this.pageNo = pageNo;
		this.pageBegin = (Integer.parseInt(pageNo) - 1)*pageSize;
		
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

	public Integer getQueryCount() {
		return queryCount;
	}

	public void setQueryCount(Integer queryCount) {
		this.queryCount = queryCount;
	}

	

}
