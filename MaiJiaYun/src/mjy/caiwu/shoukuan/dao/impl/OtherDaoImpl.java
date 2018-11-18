package mjy.caiwu.shoukuan.dao.impl;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import mjy.caigou.dao.impl.ShopDaoImpl;
import mjy.caigou.vo.ShopVO;
import mjy.caiwu.shoukuan.beans.CwShouKuanVO;
import mjy.caiwu.shoukuan.dao.OtherDao;


public class OtherDaoImpl  extends BaseDao<CwShouKuanVO> implements OtherDao {
	
	//通过userId 找到用户类型
		@Override
		public String getType(String  userId) {
			List<Object> params = new ArrayList<Object>();
			String sql = "SELECT userType FROM common_user WHERE userId = ?";
			params.add(userId);
			return  this.nameForList(sql,params);
		}
		//通过bossId 找到所有ShopId
		@Override
		public List<ShopVO> getShopId(String userId) {
			ShopDaoImpl  shopDaoImpl =new ShopDaoImpl();
			List<Object> params = new ArrayList<Object>();
			String sql = "SELECT * FROM caigou_shop WHERE userId= ?";
			params.add(userId);
			return  shopDaoImpl.queryForList(sql, params);
			
		}

		@Override
		public String getBossId(String userId) {
			List<Object> params = new ArrayList<Object>();
			String sql = "SELECT employeeBossUserId FROM common_employee WHERE userId= ?";
			params.add(userId);
			return this.nameForList(sql,params);
		}
		

	@Override
	public List<CwShouKuanVO> mapRow(ResultSet rs) throws Exception {
		
		return null;
	}


	
	

}
