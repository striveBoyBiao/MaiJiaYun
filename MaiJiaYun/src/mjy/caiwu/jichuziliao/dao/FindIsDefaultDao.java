package mjy.caiwu.jichuziliao.dao;

import java.util.List;

import mjy.caiwu.jichuziliao.vo.IsDefaultVO;

public interface FindIsDefaultDao {
	List <IsDefaultVO> listDefault(String shopName);
	void deleteById(int param);
}
