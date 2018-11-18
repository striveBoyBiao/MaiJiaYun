package mjy.caiwu.jichuziliao.vo;

public class PageInfo {
	// ÿҳ��ʾ�ļ�¼����
	public static int pageSize = 10;
	// ��ҳ��
	public static int pageCount;
	// ��ǰҳ��
	private String pageNo;
	//��¼��ʼ������
	private int pageBegin;
	// �ܼ�¼����
	private int lineCount;
	// �������
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
