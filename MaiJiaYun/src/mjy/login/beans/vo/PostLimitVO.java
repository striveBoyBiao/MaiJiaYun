package mjy.login.beans.vo;

import java.io.Serializable;

/**
 * ����Ȩ��ʵ��
 * @author student
 *
 */
public class PostLimitVO implements Serializable{
	/**
	 * id
	 */
	private Integer limitId;
	/**
	 * ����
	 */
	private String limitName;
	/**
	 * ͼ��
	 */
	private String limitIcon;
	/**
	 * ҳ������
	 */
	private String limitUrl;
	/**
	 * �Ƿ�ΪĬ��Ȩ��
	 */
	private boolean defaulted;
	/**
	 * �Ƿ�Ϊ�����Ȩ��
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
