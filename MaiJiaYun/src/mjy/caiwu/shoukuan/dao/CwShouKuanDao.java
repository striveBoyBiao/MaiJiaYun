package mjy.caiwu.shoukuan.dao;

import java.util.List;
import mjy.caiwu.shoukuan.beans.CwPageInfo;
import mjy.caiwu.shoukuan.beans.CwShouKuanPO;
import mjy.caiwu.shoukuan.beans.CwShouKuanVO;

public interface CwShouKuanDao {
	public void insert(CwShouKuanVO cwShouKuanVO);
	
	public void update(CwShouKuanVO cwShouKuanVO);

	public List<CwShouKuanVO> listBy(CwShouKuanPO cwShouKuanPO,CwPageInfo<CwShouKuanVO> page);
	public int getCount(CwShouKuanPO cwShouKuanPO);
	
	// 根据id获取该条数据
	public CwShouKuanVO queryCwShouKuanById(int skId);
	//通过id查询操作人
	public String listById(String id);
	
}
