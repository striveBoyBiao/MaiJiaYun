package mjy.caiwu.jichuziliao.service.impl;

import java.util.List;

import mjy.caiwu.jichuziliao.dao.ShouZhiTypeDao;
import mjy.caiwu.jichuziliao.dao.impl.ShouZhiTypeDaoImpl;
import mjy.caiwu.jichuziliao.po.ShouZhiTypePO;
import mjy.caiwu.jichuziliao.service.ShouZhiTypeService;
import mjy.caiwu.jichuziliao.vo.ShouZhiTypeVO;

public class ShouZhiTypeServiceImpl implements ShouZhiTypeService {

	private ShouZhiTypeDao sDao = new ShouZhiTypeDaoImpl();
	@Override
	public void addShouZhiType(ShouZhiTypeVO sVO) {
		sDao.addShouZhiType(sVO);
	}
	@Override
	public List<ShouZhiTypeVO> listBy(ShouZhiTypePO sPO) {
		return sDao.listBy(sPO);
	}
	@Override
	public void updateShouZhiType(ShouZhiTypeVO sVO) {
		sDao.updateShouZhiType(sVO);
	}
	@Override
	public List<ShouZhiTypeVO> listByPage(ShouZhiTypePO sPO) {
		return sDao.listByPage(sPO);
	}

}
