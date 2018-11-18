package mjy.caiwu.jichuziliao.service.impl;

import java.util.List;

import mjy.caiwu.jichuziliao.beans.PageInfo;
import mjy.caiwu.jichuziliao.dao.FindIsDefaultDao;
import mjy.caiwu.jichuziliao.dao.FindShopDao;
import mjy.caiwu.jichuziliao.dao.FindfkzhDataDao;
import mjy.caiwu.jichuziliao.dao.impl.FindIsDefaultDaoImpl;
import mjy.caiwu.jichuziliao.dao.impl.FindShopDaoImp;
import mjy.caiwu.jichuziliao.dao.impl.FindfkzhDataDaoImpl;
import mjy.caiwu.jichuziliao.po.ShopLocationPO;
import mjy.caiwu.jichuziliao.po.ShopPO;
import mjy.caiwu.jichuziliao.service.FindShopService;
import mjy.caiwu.jichuziliao.vo.FukuanzhVO;
import mjy.caiwu.jichuziliao.vo.IsDefaultVO;
import mjy.caiwu.jichuziliao.vo.ShopVO;
import mjy.caiwu.jichuziliao.vo.fkzhDataVO;

public class FindShopServiceImp implements FindShopService {
	FindShopDao shop = new FindShopDaoImp();
	FindfkzhDataDao data = new FindfkzhDataDaoImpl();
	FindIsDefaultDao isDef = new FindIsDefaultDaoImpl();
	@Override
	public List<ShopVO> listBy(ShopPO params) {
		return shop.listBy(params);
	}
	@Override
	public void insertFK(FukuanzhVO fukuan) {
		shop.insertFK(fukuan);
		
	}
	@Override
	public List<fkzhDataVO> getfkzhDada(PageInfo params) {
		// TODO Auto-generated method stub
		return data.getfkzhDada(params);
	}
	@Override
	public void ChangeId(int temp,int fkzhDafaultId) {
		data.ChangeId(temp,fkzhDafaultId);
		
	}
	@Override
	public List<IsDefaultVO> listDefault(String shopName) {
		// TODO Auto-generated method stub
		return isDef.listDefault(shopName);
	}
	@Override
	public void deleteById(int param) {
		isDef.deleteById(param);
		
	}
	@Override
	public void editData(fkzhDataVO editData) {
		data.editData(editData);
		
	}
	@Override
	public int getPageCount() {
		// TODO Auto-generated method stub
		return data.getPageCount();
	}

}
