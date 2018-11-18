package mjy.caiwu.kucunchengben.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.SystemUtils;

import mjy.caiwu.kucunchengben.dao.KucunmxDao;
import mjy.caiwu.kucunchengben.po.KucunmxPo;
import mjy.caiwu.kucunchengben.util.DbUtil;
import mjy.caiwu.kucunchengben.vo.Caigou_goodwarehouse;
import mjy.caiwu.kucunchengben.vo.Caigou_warehouse;
import mjy.caiwu.kucunchengben.vo.Caiwu_kucunmx;

public class KucunmxDaoImpl implements KucunmxDao {
	private DbUtil db = new DbUtil();

	@Override
	public <T> List query(Class<T> cla, int goodId, String wareHouseName) {
		// TODO Auto-generated method stub
		String sql2 = "select * from Caiwu_kucunmx where goodId=? and warehouseId=?";
		List<T> list1 = null;
		List<KucunmxPo> list2 = new ArrayList<KucunmxPo>();
		try {
			list1 = db.select(cla, sql2, goodId, getWareHouseId(wareHouseName));
			for (T t : list1) {
				KucunmxPo kcmxPo = new KucunmxPo();
				Caiwu_kucunmx kcmxVo = (Caiwu_kucunmx) t;
				kcmxPo.setBills(kcmxVo.getBillsName());
				kcmxPo.setBusiness(kcmxVo.getBusinessName());
				kcmxPo.setChangeTime(kcmxVo.getChangeTime());
				kcmxPo.setChangePrice(0);
				kcmxPo.setFirstCost(kcmxVo.getFirstCost());
				kcmxPo.setFirstCount(kcmxVo.getFirstInventory());
				kcmxPo.setLastCost(kcmxVo.getLastCost());
				kcmxPo.setLastCount(kcmxVo.getLastInventory());
				kcmxPo.setChangeCount(kcmxPo.getLastCount() - kcmxPo.getFirstCount());
				kcmxPo.setJieyu(kcmxPo.getLastCost() * kcmxPo.getLastCount());
				list2.add(kcmxPo);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list2;
	}

	// 通过仓库名称获得仓库id
	@Override
	public int getWareHouseId(String wareHouseName) {
		int WareHouseId = 0;
		String sql1 = "select * from Caigou_warehouse where wareHouseName=?";
		List<Caigou_warehouse> list = null;
		try {
			list = db.select(Caigou_warehouse.class, sql1, wareHouseName);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		for (Caigou_warehouse cg : list) {
			WareHouseId = cg.getWareHouseId();
			break;
		}
		return WareHouseId;
	}
}