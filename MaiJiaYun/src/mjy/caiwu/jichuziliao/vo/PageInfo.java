package mjy.caiwu.jichuziliao.vo;

public class PageInfo {
	// 每页显示的记录条数
	public static int pageSize = 10;
	// 总页数
	public static int pageCount;
	// 当前页码
	private String pageNo;
	//记录开始的行数
	private int pageBegin;
	// 总记录条数
	private int lineCount;
	// 请求参数
	private String queryParam;
	
	public PageInfo() {
		super();
	}

	public PageInfo(String pageNo) {
		super();
		this.pageNo = pageNo;
		this.pageBegin = (Integer.parseInt(pageNo) - 1) * 10;
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

	public int getLineCount() {
		return lineCount;
	}

	public void setLineCount(int lineCount) {
		this.lineCount = lineCount;
	}

	public String getQueryParam() {
		return queryParam;
	}

	public void setQueryParam(String queryParam) {
		this.queryParam = queryParam;
	}

}
