package mjy.login.beans.vo;

import java.io.Serializable;

/**
 * 基本权限实体
 * @author student
 *
 */
public class PostLimitVO implements Serializable{
	/**
	 * id
	 */
	private Integer limitId;
	/**
	 * 名称
	 */
	private String limitName;
	/**
	 * 图标
	 */
	private String limitIcon;
	/**
	 * 页面链接
	 */
	private String limitUrl;
	/**
	 * 是否为默认权限
	 */
	private boolean defaulted;
	/**
	 * 是否为额外的权限
	 */
	private boolean selected;
	
	public Integer getLimitId() {
		return limitId;
	}
	public void setLimitId(Integer limitId) {
		this.limitId = limitId;
	}
	public String getLimitName() {
		return limitName;
	}
	public void setLimitName(String limitName) {
		this.limitName = limitName;
	}

	public String getLimitIcon() {
		return limitIcon;
	}
	public void setLimitIcon(String limitIcon) {
		this.limitIcon = limitIcon;
	}
	public String getLimitUrl() {
		return limitUrl;
	}
	public void setLimitUrl(String limitUrl) {
		this.limitUrl = limitUrl;
	}



	public boolean getDefaulted() {
		return defaulted;
	}
	public void setDefaulted(boolean defaulted) {
		this.defaulted = defaulted;
	}
	public boolean getSelected() {
		return selected;
	}
	public void setSelected(boolean selected) {
		this.selected = selected;
	}
	@Override
	public String toString() {
		return "PostLimitVO [limitId=" + limitId + ", limitName=" + limitName + ", limitIcon=" + limitIcon
				+ ", limitUrl=" + limitUrl + ", defaulted=" + defaulted + ", selected=" + selected + "]";
	}




	
}
