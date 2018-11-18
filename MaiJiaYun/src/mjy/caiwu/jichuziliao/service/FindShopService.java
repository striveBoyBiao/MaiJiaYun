package mjy.caiwu.jichuziliao.service;

import java.util.List;

import mjy.caiwu.jichuziliao.beans.PageInfo;
import mjy.caiwu.jichuziliao.po.ShopPO;
import mjy.caiwu.jichuziliao.vo.FukuanzhVO;
import mjy.caiwu.jichuziliao.vo.IsDefaultVO;
import mjy.caiwu.jichuziliao.vo.ShopVO;
import mjy.caiwu.jichuziliao.vo.fkzhDataVO;

public interface FindShopService {
	List<ShopVO> listBy(ShopPO params);
	void insertFK(FukuanzhVO fukuan);
	List<fkzhDataVO> getfkzhDada(PageInfo params);
	void ChangeId(int temp,int fkzhDafaultId);
	List <IsDefaultVO> listDefault(String shopName);
	void deleteById(int param);
	void editData(fkzhDataVO editData);
	int getPageCount();
}
