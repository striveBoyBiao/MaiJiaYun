package mjy.kuguan.chukudan.dao;

import java.util.List;

import mjy.kuguan.chukudan.po.ChuKuDanPO;
import mjy.kuguan.chukudan.vo.ChuKuDanVO;







public interface IChuKuDanDao {
	/**
	 * 获得已完成的总条数
	 * 根据id查询单据类型
	 * @return
	 */
	public String getTypeById(int chukudanId);
	
	
	/**
	 * 跟据chuku单id查询出库单对象
	 * @param chukuID
	 * @return
	 */
	public ChuKuDanPO querybyId(int chukuID);

	
	/**
	 * 插入出库单(调拨出库和采购退货出库时应用)
	 * @param chuku
	 */
	public void insert(ChuKuDanPO chuku);
	
	/**
	 * 更改出库单，主要用于编辑出库后将出库状态改为已出库
	 * @param chuku
	 */
	public void update(ChuKuDanPO chuku);
	
	
	/**
	 * 删除出库单，主要用于采购退货出库页面中的驳回到采购退货单业务
	 * @param chukuID
	 */
	public void deleteByID(int chukuID);
	
	/**
	 * 根据业务类chukudanvo查询，用于在页面中显示数据
	 * @param chukuvo
	 * @return
	 */
	public List<ChuKuDanPO> listBy(ChuKuDanVO chukuvo);
	
	/**
	 * 获取出库单表中的最大id
	 */
	public int getMaxId();
	
	
	
	
	
	
	/**
	 * 查询所有采购退货、通过出库编号查询,加一个仓库名
	 * @return 数据集合
	 */
	public List<ChuKuDanPO> getAllcgu(int pageNum,int pageSize,String chukuNum,String cangku );
	
	/**
	 * 查询所有盘点退货、通过出库编号查询，加一个仓库名
	 * @return 数据集合
	 */
	public List<ChuKuDanPO> getAlltb(int pageNum,int pageSize,String chukuNum,String cangku );
	/**
	 * 查询已完成、通过出库编号查询，加一个仓库名
	 * @return 数据集合
	 */
	public List<ChuKuDanPO> getAllywc(int pageNum,int pageSize,String chukuNum,String cangku );
	/**
	 * 获得采购单的总条数(可以通过返回查询的数据长度)
	 * @return
	 */
	public int getcgCount(String chukuNum,String cangku);
	
	/**
	 * 获得调拨单的总条数(可以通过返回查询的数据长度)
	 * @return
	 */
	public int gettbCount(String chukuNum,String cangku);
	/**
	 * 获得已完成的总条数(可以通过返回查询的数据长度)
	 * @return
	 */
	public int getywcCount(String chukuNum,String cangku);
	/**
	 * 获得仓库名
	 * @return
	 */
	public List<ChuKuDanPO> getCangku();
	
	
	
}
