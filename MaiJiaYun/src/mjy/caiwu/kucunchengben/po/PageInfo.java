package mjy.caiwu.kucunchengben.po;

/**
 * ��װ��ҳ��Ϣ
 * 
 * @author david
 *
 */
public class PageInfo<T> {
	private int firstpage;// ��һҳ
	private int total;// ��¼����
	private int pageNum;// ��ǰҳ����
	private int pageSize;// ÿҳ��ʾ����
	private int maxPageNum;// ҳ������
	private Object searchCondition;//��������

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
