package mjy.kuguan.chukudan.service;

import java.util.List;

import mjy.kuguan.chukudan.po.ChuKuDanPO;
import mjy.kuguan.chukudan.po.Pager;

public interface IChuKuDanService {
	/**
	 * ��ѯ���вɹ��˻���ͨ�������Ų�ѯ
	 * @return ���ݼ���
	 */
	public Pager<ChuKuDanPO> getAllcgu(int pageNum,int pageSize,String chukuNum,String cangku );
	
	/**
	 * ��ѯ�����̵��˻���ͨ�������Ų�ѯ
	 * @return ���ݼ���
	 */
	public Pager<ChuKuDanPO> getAlltb(int pageNum,int pageSize,String chukuNum,String cangku );
	
	/**
	 * ��ѯ����ɡ�ͨ�������Ų�ѯ
	 * @return ���ݼ���
	 */
	public Pager<ChuKuDanPO> getAllywc(int pageNum,int pageSize,String chukuNum,String cangku );
	
	
}
