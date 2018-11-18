package mjy.kuguan.chukudan.service;

import java.util.List;

import mjy.kuguan.chukudan.po.ChuKuDanPO;
import mjy.kuguan.chukudan.po.Pager;

public interface IChuKuDanService {
	/**
	 * 查询所有采购退货、通过出库编号查询
	 * @return 数据集合
	 */
	public Pager<ChuKuDanPO> getAllcgu(int pageNum,int pageSize,String chukuNum,String cangku );
	
	/**
	 * 查询所有盘点退货、通过出库编号查询
	 * @return 数据集合
	 */
	public Pager<ChuKuDanPO> getAlltb(int pageNum,int pageSize,String chukuNum,String cangku );
	
	/**
	 * 查询已完成、通过出库编号查询
	 * @return 数据集合
	 */
	public Pager<ChuKuDanPO> getAllywc(int pageNum,int pageSize,String chukuNum,String cangku );
	
	
}
