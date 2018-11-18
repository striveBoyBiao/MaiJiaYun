package mjy.caiwu.jichuziliao.dao;

import java.util.List;

import mjy.caiwu.jichuziliao.po.FuKuanAccountPO;
import mjy.caiwu.jichuziliao.vo.FuKuanAccountVO;

public interface FuKuanAccountDao {
	//新增账户类型
	void addFuKuanAccount(FuKuanAccountVO fkVO);
	//删除
	void deleteFuKuanAccount(String fkzhBankId,int flshopId);
	//更新
	void updateFuKuanAccount();
	//无条件查询（显示全部信息）
	List<FuKuanAccountVO> listBy();
}
