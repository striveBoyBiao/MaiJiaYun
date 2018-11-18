package mjy.caigou.po;

import java.util.List;

/**
 * @author student
 *
 * @param <T>
 */
public class PageInfo<T> {
	// ��ǰҳ����
	private String pageNum;
	// ҳ���С
	public static  Integer pageSize=0 ;
	// ҳ���ѯ����
	private List<T> pageData;
	// ��ҳ��
	private Integer pageCount;
	// �ܼ�¼��
	private Integer totalRecords;
	// ��ѯ����
	private String queryUrl;

	private int pageBegin;


	public PageInfo(String pageNum) {
		this.pageNum = pageNum;
		this.pageBegin = (Integer.parseInt(pageNum) - 1) * pageSize;


	}

	public void setPageNum(String pageNum) {
		this.pageNum = pageNum;
	}

	public String getPageNum() {
		return pageNum;
	}

	

	

	public static Integer getPageSize() {
		return pageSize;
	}

	public static void setPageSize(Integer pageSize) {
		PageInfo.pageSize = pageSize;
	}

	public int getPageBegin() {
		return pageBegin;
	}

	public void setPageBegin(int pageBegin) {
		this.pageBegin = pageBegin;
	}

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

	public List<T> getPageData() {
		return pageData;
	}

	public void setPageData(List<T> pageData) {
		this.pageData = pageData;
	}

}
