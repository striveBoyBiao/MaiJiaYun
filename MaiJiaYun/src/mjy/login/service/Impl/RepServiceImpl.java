package mjy.login.service.Impl;

import java.util.List;

import mjy.login.beans.po.RepPO;
import mjy.login.dao.impl.RepDaoImpl;
import mjy.login.service.RepService;

public class RepServiceImpl implements RepService{
	//存储rep
	//调用repdaoimpl的saverep方法来存储 
	@Override
	public boolean saveRep(List<RepPO> reps) {
		new RepDaoImpl().saveRep(reps);
		return false;
	}
}
