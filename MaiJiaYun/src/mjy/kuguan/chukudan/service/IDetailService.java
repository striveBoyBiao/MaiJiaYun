package mjy.kuguan.chukudan.service;

import java.util.List;

import mjy.kuguan.chukudan.po.BianJiPO;

public interface IDetailService {

 /**
  * ����chukudanId��ѯ��ѯ��Ӧ�ı༭���е�����
  */
	public List<BianJiPO> queryDetail(int chukudanId);
	
	 /**
	  * ����chukudanId��ѯ��ѯ��Ӧ�ĵ�������
	  */
	public String getType(int chukudanId);
	
}
