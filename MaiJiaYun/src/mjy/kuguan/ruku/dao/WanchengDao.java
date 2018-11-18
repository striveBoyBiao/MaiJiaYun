package mjy.kuguan.ruku.dao;

import java.util.List;

import mjy.kuguan.ruku.po.WanchengPO;






public interface WanchengDao {
	
	
	
	//入库单编号查
	public List<WanchengPO> listByRkd(int wanchengBossId,String rkd,int pageNumber,int pageSize);
	//相关单据号查询
	public List<WanchengPO> listByDjh(int wanchengBossId,String djh,int pageNumber,int pageSize);
	//制单人查询
	public List<WanchengPO> listByZdr(int wanchengBossId,String zdr,int pageNumber,int pageSize);
	//总条数查询
	public int getTotalCount(int wanchengBossId);
	//根据采购单号查询详情表
	

}
