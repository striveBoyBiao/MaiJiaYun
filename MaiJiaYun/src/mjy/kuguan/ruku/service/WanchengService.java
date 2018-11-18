package mjy.kuguan.ruku.service;

import java.util.List;

import mjy.kuguan.ruku.po.WanchengPO;





public interface WanchengService {
	//根据入库单编号，相关单据号，制单人查询
	List<WanchengPO> listBy(int wanchengBossId,String temp,int pageNumber,int pageSize);
	//根据查询条件查询总条数
	public int getCount(int wanchengBossId);
}
