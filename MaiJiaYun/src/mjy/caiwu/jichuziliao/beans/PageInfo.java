package mjy.caiwu.jichuziliao.beans;

import java.util.List;

public class PageInfo<T> {

	private String pageNo;//��ǰҳ��
	public static int pageSize;//ÿҳ��ʾ�ļ�¼����
	private int pageBegin;//���Ŀ�ʼ
	private int rowCount;//�ܼ�¼����
	private int pageCount;//��ҳ��
	private List<T> pageDate;//��ǰҳ����
	private String queryParam;//�������
	
	public PageInfo(String pageNo) {
		this.pageNo=pageNo;
	}
	
	public String getPageNo() {
		return pageNo;
	}
	public void setPageNo(String pageNo) {
		this.pageNo = pageNo;
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
		this.pageBegin =(Integer.parseInt(pageNo)-1)*pageSize;;
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
	public String getQueryParam() {
		return queryParam;
	}
	public void setQueryParam(String queryParam) {
		this.queryParam = queryParam;
	}
	
}
