package mjy.kuguan.chukudan.dao;

import java.util.List;

import mjy.kuguan.chukudan.po.ChuKuDanPO;
import mjy.kuguan.chukudan.vo.ChuKuDanVO;







public interface IChuKuDanDao {
	/**
	 * �������ɵ�������
	 * ����id��ѯ��������
	 * @return
	 */
	public String getTypeById(int chukudanId);
	
	
	/**
	 * ����chuku��id��ѯ���ⵥ����
	 * @param chukuID
	 * @return
	 */
	public ChuKuDanPO querybyId(int chukuID);

	
	/**
	 * ������ⵥ(��������Ͳɹ��˻�����ʱӦ��)
	 * @param chuku
	 */
	public void insert(ChuKuDanPO chuku);
	
	/**
	 * ���ĳ��ⵥ����Ҫ���ڱ༭����󽫳���״̬��Ϊ�ѳ���
	 * @param chuku
	 */
	public void update(ChuKuDanPO chuku);
	
	
	/**
	 * ɾ�����ⵥ����Ҫ���ڲɹ��˻�����ҳ���еĲ��ص��ɹ��˻���ҵ��
	 * @param chukuID
	 */
	public void deleteByID(int chukuID);
	
	/**
	 * ����ҵ����chukudanvo��ѯ��������ҳ������ʾ����
	 * @param chukuvo
	 * @return
	 */
	public List<ChuKuDanPO> listBy(ChuKuDanVO chukuvo);
	
	/**
	 * ��ȡ���ⵥ���е����id
	 */
	public int getMaxId();
	
	
	
	
	
	
	/**
	 * ��ѯ���вɹ��˻���ͨ�������Ų�ѯ,��һ���ֿ���
	 * @return ���ݼ���
	 */
	public List<ChuKuDanPO> getAllcgu(int pageNum,int pageSize,String chukuNum,String cangku );
	
	/**
	 * ��ѯ�����̵��˻���ͨ�������Ų�ѯ����һ���ֿ���
	 * @return ���ݼ���
	 */
	public List<ChuKuDanPO> getAlltb(int pageNum,int pageSize,String chukuNum,String cangku );
	/**
	 * ��ѯ����ɡ�ͨ�������Ų�ѯ����һ���ֿ���
	 * @return ���ݼ���
	 */
	public List<ChuKuDanPO> getAllywc(int pageNum,int pageSize,String chukuNum,String cangku );
	/**
	 * ��òɹ�����������(����ͨ�����ز�ѯ�����ݳ���)
	 * @return
	 */
	public int getcgCount(String chukuNum,String cangku);
	
	/**
	 * ��õ�������������(����ͨ�����ز�ѯ�����ݳ���)
	 * @return
	 */
	public int gettbCount(String chukuNum,String cangku);
	/**
	 * �������ɵ�������(����ͨ�����ز�ѯ�����ݳ���)
	 * @return
	 */
	public int getywcCount(String chukuNum,String cangku);
	/**
	 * ��òֿ���
	 * @return
	 */
	public List<ChuKuDanPO> getCangku();
	
	
	
}
