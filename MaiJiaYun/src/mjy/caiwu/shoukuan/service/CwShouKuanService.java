package mjy.caiwu.shoukuan.service;


import mjy.caiwu.shoukuan.beans.CwShouKuanVO;
import mjy.caiwu.jichuziliao.vo.ShouZhiTypeVO;
import mjy.caiwu.shoukuan.beans.CwPageInfo;
import java.util.List;
import mjy.caiwu.shoukuan.beans.CwShouKuanPO;



public interface CwShouKuanService {

	public CwPageInfo<CwShouKuanVO> listByPage(CwShouKuanPO cwShouKuanPO, CwPageInfo<CwShouKuanVO> page);
	public void BaoCun(CwShouKuanVO cw);

	 public List<CwShouKuanVO> listBy(CwShouKuanPO cwShouKuanPO,CwPageInfo<CwShouKuanVO> page);
	 //查询数据
//	 public List<CwShouKuanVO> cwquery(CwShouKuanPO cwShouKuanPO);
     public int getCount(CwShouKuanPO cwShouKuanPO);
	
	// 根据id获取该条数据
	public CwShouKuanVO queryCwShouKuanById(int skId);


	//	修改数据
	public void update(CwShouKuanVO cwShouKuanVO);
	//
	public String listById(String id);
	//采购退货单插入银行账户和账号
	
	
}
