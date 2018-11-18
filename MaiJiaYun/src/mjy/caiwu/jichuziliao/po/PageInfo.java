package mjy.caiwu.jichuziliao.po;

import java.util.List;

public class PageInfo<T> {

	public static int pageSize=10;
	private String pageNo;
	private int pageBegin;
	private int lineCount;
	private int pageCount;
	private String queryParam;
	private List<T> pageData;
	
	public PageInfo(String pageNo) {
		super();
		this.pageNo = pageNo;
		this.pageBegin = (Integer.parseInt(pageNo)-1)*10;
	}

	public String getPageNo() {
		return pageNo;
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

	public int getLineCount() {
		return lineCount;
	}

	public void setLineCount(int lineCount) {
		this.lineCount = lineCount;
	}

	public int getPageCount() {
		return pageCount;
	}

	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
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
	
}
