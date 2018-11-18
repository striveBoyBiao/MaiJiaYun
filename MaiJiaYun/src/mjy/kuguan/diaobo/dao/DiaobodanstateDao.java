package mjy.kuguan.diaobo.dao;

import java.util.List;


import mjy.kuguan.diaobo.po.DiaobodanPO;
import mjy.kuguan.diaobo.po.DiaobodanstatePO;
import mjy.kuguan.diaobo.po.PageInfo;
import mjy.kuguan.diaobo.vo.DiaobodanstateVO;


public interface DiaobodanstateDao {
	
	public List<DiaobodanstateVO> listBy(DiaobodanPO diaobodanPO,PageInfo pageInfo);
	
	public int getCount(DiaobodanPO diaobodanPO);
	
	public boolean insert(List<DiaobodanstatePO> diaobodanstatePOs);

	
	public boolean updateAsState(String diaobodanCode ,String diaobodanAuditor,String diaobodanAudittime,String diaoboState );


	//已完成的模糊查询
	public List<DiaobodanstateVO> listByCheck (DiaobodanstatePO diaobodanstatePO,PageInfo<DiaobodanstateVO> pageInfo);
	
	public List<DiaobodanstateVO> queryByCode(String diaobodanCode);

	//已完成
	public int getCount(DiaobodanstatePO diaobodanstatePO);
}
