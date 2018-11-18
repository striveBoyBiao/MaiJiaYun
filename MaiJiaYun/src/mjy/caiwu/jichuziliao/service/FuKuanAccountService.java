package mjy.caiwu.jichuziliao.service;

import java.util.List;

import mjy.caiwu.jichuziliao.vo.FuKuanAccountVO;

public interface FuKuanAccountService {
	List<FuKuanAccountVO> listBy(); 
	void addFuKuanAccount(FuKuanAccountVO fkVO);
}
