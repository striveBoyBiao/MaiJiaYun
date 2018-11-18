package mjy.kuguan.ruku.util;

import java.util.List;




public class PageInfoBean<T> {
	// ��ǰҳ��
	private String pageNo;
	// ÿҳ�ж�����
	public  int pageSize = 10;
	// �ӵڼ�����ʼ
	private String pageBegin;
	// һ���ж���ҳ
	private String pageCount;
	// �������
	private List<T> list;
	// ��Ӳ�ѯ���������
	private String queryParm;
	// һ����������
	private String rowCount;

	public String getPageNo() {
		return pageNo;
	}

	public void setPageNo(String pageNo) {
		this.pageNo = pageNo;
		int i = Integer.parseInt(pageNo);
		this.pageBegin = String.valueOf((i-1)*pageSize); 
	}

	public String getPageBegin() {
		return pageBegin;
	}

	public void setPageBegin(String pageBegin) {
		this.pageBegin = pageBegin;
	}

	public String getPageCount() {
		return pageCount;
	}

	public void setPageCount(String pageCount) {
		this.pageCount = pageCount;
	}

	public List<T> getList() {
		return list;
	}

	public void setList(List<T> list) {
		this.list = list;
	}

	public String getQueryParm() {
		return queryParm;
	}

	public void setQueryParm(String queryParm) {
		this.queryParm = queryParm;
	}

	public String getRowCount() {
		return rowCount;
	}

	public void setRowCount(String rowCount) {
		this.rowCount = rowCount;
	}

}
