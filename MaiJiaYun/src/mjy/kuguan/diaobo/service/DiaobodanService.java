package mjy.kuguan.diaobo.service;

import java.util.List;

import mjy.kuguan.diaobo.po.DiaobodanPO;
import mjy.kuguan.diaobo.po.DiaobodanstatePO;
import mjy.kuguan.diaobo.po.PageInfo;
import mjy.kuguan.diaobo.po.XiangqingDiaoboPO;
import mjy.kuguan.diaobo.vo.DiaobodanVO;
import mjy.kuguan.diaobo.vo.DiaobodanstateVO;

public interface DiaobodanService {

	PageInfo<DiaobodanstateVO> listByPage(DiaobodanPO diaobodanPO, PageInfo<DiaobodanstateVO> page);

	int getCount(DiaobodanPO diaobodanPO);

	public boolean insertDiaobodanstate(List<DiaobodanstatePO> diaobodanstatePOs);

	public boolean insertDiaobodan(List<DiaobodanVO> diaobodanVOs);

	public boolean deleteBydiaobostateCode(String diaobodanCode);

	
	public boolean updateAsState(String diaobodanCode ,String diaobodanAuditor,String diaobodanAudittime,String diaoboState );
	
	public List<XiangqingDiaoboPO> querydiaobo(String diaobodanCode);


	// 已完成
	PageInfo<DiaobodanstateVO> listByPage(DiaobodanstatePO diaobodanstatePO,PageInfo<DiaobodanstateVO> page);

	// 已完成
	int getCount(DiaobodanstatePO diaobodanstatePO);

}
