package mjy.caiwu.jichuziliao.dao;

import java.util.List;

import mjy.caiwu.jichuziliao.beans.PageInfo;
import mjy.caiwu.jichuziliao.vo.fkzhDataVO;

public interface FindfkzhDataDao {
	List<fkzhDataVO> getfkzhDada(PageInfo params);
	void editData(fkzhDataVO editData);
	void ChangeId(int i,int fkzhDafaultId);
	int getPageCount();
}
