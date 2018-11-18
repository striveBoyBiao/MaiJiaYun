package mjy.login.dao;

import mjy.login.beans.po.BossPO;

public interface BossDao {
	BossPO getBossPO(Integer bossID);
	boolean registerBossPO(BossPO b);
}
