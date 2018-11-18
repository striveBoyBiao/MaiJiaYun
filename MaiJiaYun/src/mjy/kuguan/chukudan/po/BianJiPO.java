package mjy.kuguan.chukudan.po;

public class BianJiPO {

	private int bjId;
	private int chukudanId;
	private String bjskuCode;
	private String bjgoodName;
	private String bjgoodProperty;
	private int bjxuchukuNum;
	private int bjyichukuNum;
	private int bjbencichukuNum;
	private String bjbeizhu;
	private String bjchukuBeizhu;
	private String bjcangku;
	public int getBjId() {
		return bjId;
	}
	public void setBjId(int bjId) {
		this.bjId = bjId;
	}
	public int getChukudanId() {
		return chukudanId;
	}
	public void setChukudanId(int chukudanId) {
		this.chukudanId = chukudanId;
	}
	public String getBjskuCode() {
		return bjskuCode;
	}
	public void setBjskuCode(String bjskuCode) {
		this.bjskuCode = bjskuCode;
	}
	public String getBjgoodName() {
		return bjgoodName;
	}
	public void setBjgoodName(String bjgoodName) {
		this.bjgoodName = bjgoodName;
	}
	public String getBjgoodProperty() {
		return bjgoodProperty;
	}
	public void setBjgoodProperty(String bjgoodProperty) {
		this.bjgoodProperty = bjgoodProperty;
	}
	public int getBjxuchukuNum() {
		return bjxuchukuNum;
	}
	public void setBjxuchukuNum(int bjxuchukuNum) {
		this.bjxuchukuNum = bjxuchukuNum;
	}
	public int getBjyichukuNum() {
		return bjyichukuNum;
	}
	public void setBjyichukuNum(int bjyichukuNum) {
		this.bjyichukuNum = bjyichukuNum;
	}
	public int getBjbencichukuNum() {
		return bjbencichukuNum;
	}
	public void setBjbencichukuNum(int bjbencichukuNum) {
		this.bjbencichukuNum = bjbencichukuNum;
	}
	public String getBjbeizhu() {
		return bjbeizhu;
	}
	public void setBjbeizhu(String bjbeizhu) {
		this.bjbeizhu = bjbeizhu;
	}
	public String getBjchukuBeizhu() {
		return bjchukuBeizhu;
	}
	public void setBjchukuBeizhu(String bjchukuBeizhu) {
		this.bjchukuBeizhu = bjchukuBeizhu;
	}
	public BianJiPO(int bjId, int chukudanId, String bjskuCode, String bjgoodName, String bjgoodProperty,
			int bjxuchukuNum, int bjyichukuNum, int bjbencichukuNum, String bjbeizhu, String bjchukuBeizhu,String bjcangku) {
		super();
		this.bjId = bjId;
		this.chukudanId = chukudanId;
		this.bjskuCode = bjskuCode;
		this.bjgoodName = bjgoodName;
		this.bjgoodProperty = bjgoodProperty;
		this.bjxuchukuNum = bjxuchukuNum;
		this.bjyichukuNum = bjyichukuNum;
		this.bjbencichukuNum = bjbencichukuNum;
		this.bjbeizhu = bjbeizhu;
		this.bjchukuBeizhu = bjchukuBeizhu;
		this.bjcangku=bjcangku;
	}
	public String getBjcangku() {
		return bjcangku;
	}
	public void setBjcangku(String bjcangku) {
		this.bjcangku = bjcangku;
	}
	public BianJiPO() {
		super();
		
	}

	
	
}
