package mjy.caiwu.jichuziliao.service;

import java.util.List;

import mjy.caiwu.jichuziliao.po.ShouZhiTypePO;
import mjy.caiwu.jichuziliao.vo.ShouZhiTypeVO;

public interface ShouZhiTypeService {
	void addShouZhiType(ShouZhiTypeVO sVO);
	void updateShouZhiType(ShouZhiTypeVO sVO);
	List<ShouZhiTypeVO> listByPage(ShouZhiTypePO sPO);
	List<ShouZhiTypeVO> listBy(ShouZhiTypePO sPO);
}
