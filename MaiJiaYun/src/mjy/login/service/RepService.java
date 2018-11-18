package mjy.login.service;

import java.util.List;

import mjy.login.beans.po.RepPO;

public interface RepService {
	//存rep
	boolean saveRep(List<RepPO> reps);
}
