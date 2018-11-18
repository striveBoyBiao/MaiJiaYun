package mjy.common.bean;

import java.util.List;

/**
 * ��װ��ҳ������
 * 
 * @author igeek
 *
 */
public class PageInfo<T> {

	// ��ǰҳ��
	private String pageNo;
	// ÿҳ��ʾ�ļ�¼����
	public static  int pageSize;
	//limit�п�ʼ����
	private int pageBegin;
	// �ܼ�¼����
	private int rowCount;
	// ��ҳ��
	private int pageCount;
	// ��ǰҳ����
	private List<T> pageData;
	// �������
	private String queryParam;

	public PageInfo(String pageNo,int pageSize) {
		this.pageNo = pageNo;
		this.pageSize =pageSize;
		this.pageBegin = (Integer.parseInt(pageNo) - 1) * pageSize;
	}
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

	public List<T> getPageData() {
		return pageData;
	}

	public void setPageData(List<T> pageData) {
		this.pageData = pageData;
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
