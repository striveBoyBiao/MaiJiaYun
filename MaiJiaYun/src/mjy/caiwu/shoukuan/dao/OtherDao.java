package mjy.caiwu.shoukuan.dao;

import java.util.List;

import mjy.caigou.vo.ShopVO;


public interface OtherDao {
	  
		//通过userId 获取 用户类型
		public String getType(String userId);
		//通过BossId  找到所有店铺
		 public List<ShopVO> getShopId(String userId); 
		 //通过员工Id 找到BossId
		 public  String  getBossId(String userId);

}
