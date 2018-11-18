package mjy.kuguan.cangkuxinxi.dao;

import java.util.List;

import mjy.kuguan.cangkuxinxi.po.GoodKuCunPO;
import mjy.kuguan.cangkuxinxi.vo.GoodKuCunVO;

public interface GoodKuCunDao {
	List<GoodKuCunVO> listGood(GoodKuCunPO gPO);
	List<GoodKuCunVO> listBy(GoodKuCunPO gPO);
}
