package mjy.caiwu.fukuan.beans;

/**
 * 
 * @author student
 * 2016年12月9日
 */

public class FuKuanPO {

	private String keyword;//关键字搜索
	private String shouzhiTypeId;//收支类型查询
	
	private int rowstart;
	
	private String queryurl;//传给servlet的请求参数
	
	public String getShouzhiTypeId() {
		return shouzhiTypeId;
	}
	public void setShouzhiTypeId(String shouzhiTypeId) {
		this.shouzhiTypeId = shouzhiTypeId;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	public String getQueryurl() {
		StringBuffer sb=new StringBuffer();
		if(shouzhiTypeId!=null&&!shouzhiTypeId.equals("")){
			sb.append("&shouzhiTypeId="+shouzhiTypeId);
		}
		if(keyword!=null&&!keyword.equals("")){
			sb.append("&keyword="+keyword);
		}
		return sb.toString();
	}
	
	public void setQueryurl(String queryurl) {
		this.queryurl = queryurl;
	}
	public int getRowstart() {
		return rowstart;
	}
	public void setRowstart(int rowstart) {
		this.rowstart = rowstart;
	}
}
