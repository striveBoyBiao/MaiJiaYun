package mjy.caiwu.jichuziliao.dao;

import java.util.List;

import mjy.caiwu.jichuziliao.po.FuKuanAccountPO;
import mjy.caiwu.jichuziliao.vo.FuKuanAccountVO;

public interface FuKuanAccountDao {
	//�����˻�����
	void addFuKuanAccount(FuKuanAccountVO fkVO);
	//ɾ��
	void deleteFuKuanAccount(String fkzhBankId,int flshopId);
	//����
	void updateFuKuanAccount();
	//��������ѯ����ʾȫ����Ϣ��
	List<FuKuanAccountVO> listBy();
}
