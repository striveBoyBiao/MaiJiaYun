package mjy.kuguan.ruku.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import mjy.kuguan.ruku.dao.WanchengDao;
import mjy.kuguan.ruku.dao.impl.RukuUserDaoImpl;
import mjy.kuguan.ruku.dao.impl.WanchengDaoImpl;
import mjy.kuguan.ruku.po.WanchengPO;
import mjy.login.dao.UserDao;
import mjy.login.dao.impl.UserDaoImpl;



public class WanchengServiceImpl implements WanchengService {

	WanchengDao wanchengDao = new WanchengDaoImpl();
	List<WanchengPO> list = null;

	@Override
	public  List<WanchengPO> listBy(int wanchengBossId,String temp, int pageNumber, int pageSize) {
		list = wanchengDao.listByRkd(wanchengBossId,temp, pageNumber, pageSize);
		if(list.size() != 0){
			return changeUserNameById(list);
		}
		
		list = wanchengDao.listByDjh(wanchengBossId,temp,pageNumber,pageSize);
		if(list.size() != 0){
			return changeUserNameById(list);
			
		}
		list = wanchengDao.listByZdr(wanchengBossId,temp,pageNumber,pageSize);
		
		if(list.size() != 0){
			return changeUserNameById(list);
			
		}
		return new ArrayList<WanchengPO>();
	}
	/*public static void main(String[] args) {
	List<WanchengPO> list =	new WanchengServiceImpl().listBy(10001,"2",1,1);
	for (WanchengPO wanchengPO : list) {
		System.out.println(wanchengPO);
		
	}
	RukuUserDaoImpl wancheng = new RukuUserDaoImpl();
	
	System.out.println(wancheng.getSelectIdByName("Blue"));
	
	}*/
	
	public  List<WanchengPO> changeUserNameById(List<WanchengPO> list){
		UserDao userDao = new UserDaoImpl();
		
		for (WanchengPO po : list) {
			po.setWanchengAuthor(userDao.getUserInfo(Integer.parseInt(po.getWanchengAuthor())).getUserNickname());
			po.setWanchengChecker(userDao.getUserInfo(Integer.parseInt(po.getWanchengChecker())).getUserNickname());
		}
		
		return list;
	}
//	public  List<WanchengPO> changeIDByUserName(String userName){
//
//		RukuUserDaoImpl wancheng = new RukuUserDaoImpl();
//		List<Integer> idList =wancheng.getSelectIdByName(userName);
//		for(WanchengPO po : list){
//			po.setWanchengChecker(Integer.parseInt(s)idList.get(0));
//		}
//		
//	}
	@Override
	public int getCount(int wanchengBossId) {
		
		return wanchengDao.getTotalCount(wanchengBossId);
	}
	
}
	