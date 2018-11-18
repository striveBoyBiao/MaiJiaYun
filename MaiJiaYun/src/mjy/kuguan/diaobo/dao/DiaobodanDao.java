package mjy.kuguan.diaobo.dao;

import java.util.List;

import mjy.kuguan.diaobo.po.XiangqingDiaoboPO;
import mjy.kuguan.diaobo.vo.DiaobodanVO;

public interface DiaobodanDao {
	
	public boolean insert(List<DiaobodanVO> diaobodanVOs);
	
	public boolean deleteBydiaoboCode(String diaobodanCode);
	
	public List<DiaobodanVO> querydiaobo(String diaobodanCode);
}
