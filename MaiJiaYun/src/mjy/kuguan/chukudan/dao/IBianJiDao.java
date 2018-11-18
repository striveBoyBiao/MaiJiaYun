package mjy.kuguan.chukudan.dao;

import java.util.List;

import mjy.kuguan.chukudan.po.BianJiPO;





public interface IBianJiDao {

	/**
	 * �������༭��(����һ�����ⵥ��ͬʱ����)
	 * @param bianji
	 */
	public void insert(BianJiPO bianji);
	
	/**
	 * ���ĳ���༭������Ҫ���ڱ༭����ʱ���ı��γ��������ͱ�ע
	 * @param bianji
	 */
	public void update(BianJiPO bianji);
	
	
	/**
	 * ɾ������༭���������زɹ��˻���ʱ��ɾ����Ӧ����༭����ɾ����Ӧ���ⵥ��
	 */
	public void deleteByID(int chukuId);
	
	/**
	 * ����chukudanId��ѯ��Ӧ�༭��
	 * ��ajaxʵ�֣���chukudanId��Ϊ��������servlet�У���json
	 * @param chukudanId
	 * @return
	 */
	public List<BianJiPO> listBy(int chukudanId);
	
}
