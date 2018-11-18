package mjy.login.dao;

import java.util.List;

import mjy.login.beans.po.RepPO;

public interface RepDao{
	//存储rep
	boolean saveRep(List<RepPO> reps);
}
