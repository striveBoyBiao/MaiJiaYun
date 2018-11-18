package mjy.caiwu.kucunchengben.dao.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mjy.caiwu.kucunchengben.dao.KucuncbDao;
import mjy.caiwu.kucunchengben.dao.KucunmxDao;
import mjy.caiwu.kucunchengben.po.KucuncbPo;
import mjy.caiwu.kucunchengben.po.PageInfo;
import mjy.caiwu.kucunchengben.util.DbUtil;
import mjy.caiwu.kucunchengben.vo.Caiwu_kucunmx;
import mjy.caiwu.kucunchengben.vo.kuguan_goodlog;

public class KucuncbDaoImpl implements KucuncbDao {
	private DbUtil db = new DbUtil();
	private KucunmxDao kcmxDao = new KucunmxDaoImpl();

	/**
	 * 从库存表中查询字段，在根据相关字段查询其他关联表
	 */
	@Override
	public <T> List<T> query(Class<T> cla, int pageNum, int pageSize, Object obj) {
		// TODO Auto-generated method stub
		List<T> list = null;
		String str = "select a.goodId,goodPicture,goodName,sku,wareHouseName,goodNum,goodAttribute,kucunCost from kuguan_goodlog a "
				+ "join caigou_goods  b on  b.goodId=a.goodId join caigou_warehouse c on c.wareHouseId=a.wareHouseId "
				+ "join caiwu_kucuncb d on d.goodId=a.goodId and d.wareHouseId=a.wareHouseId " + " limit ?,?";
		String str1 = "select a.goodId,goodPicture,goodName,sku,wareHouseName,goodNum,goodAttribute,kucunCost from "
				+ "kuguan_goodlog a join caigou_goods  b on  b.goodId=a.goodId join caigou_warehouse "
				+ "c on c.wareHouseId=a.wareHouseId join caiwu_kucuncb d on d.goodId=a.goodId and d.wareHouseId=a.wareHouseId  where a.goodId like ? or goodName like ? "
				+ " limit ?,?";
		if (obj == null || obj == "") {
			list = db.selectFenye(cla, str, pageNum, pageSize, obj);
		} else {
			list = db.selectFenye(cla, str1, pageNum, pageSize, obj);
		}
		return list;
	}

	/**
	 * 显示当前库存成本
	 */
	@Override
	public <T> List<T> show(Class<T> cla, int goodId, int wareHouseId) {
		String sql = "select lastCost from " + cla.getSimpleName() + " where goodId=? and wareHouseId=?";
		List<T> list = null;
		try {
			list = (List<T>) db.select(cla, sql, goodId, wareHouseId);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	/**
	 * 修改当前库存成本
	 */
	@Override
	public void operate(double kucunCost, int goodId, String wareHouseName) {
		// TODO Auto-generated method stub
		int wareHouseId = kcmxDao.getWareHouseId(wareHouseName);
		int num = 0;// 记录初始化库存
		long time = 0;// 比较时间大小
		Date date = null;// 记录最近一次修改时间
		int firstInventory = 0;// 记录上一次期末库存
		double firstCost = 0; // 记录上一次期末成本
		String sql1 = "update Caiwu_kucuncb set kucunCost=? where goodId=? and wareHouseId=?";
		String sql2 = "insert into Caiwu_kucunmx values(?,?,?,?,?,?,?,?,?)";
		String sql3 = "select * from Caiwu_kucunmx where goodId=? and wareHouseId=?";
		String sql4 = "select * from kuguan_goodlog where goodId=? and wareHouseId=?";
		String sql5 = "select changeTime from Caiwu_kucunmx where goodId=? and wareHouseId=?";
		String sql6 = "select * from Caiwu_kucunmx where changeTime=?";
		try {
			db.update(sql1, kucunCost, goodId, wareHouseId);// 更新Caiwu_kucuncb表
			List<Caiwu_kucunmx> list = db.select(Caiwu_kucunmx.class, sql3, goodId, wareHouseId);// 通过2个ID查询，确定是否是初始化
			List<kuguan_goodlog> list1 = db.select(kuguan_goodlog.class, sql4, goodId, wareHouseId);
			for (kuguan_goodlog kuguan_inventory : list1) {
				num = kuguan_inventory.getGoodNum();
			}
			if (list.size() == 0) {
				db.update(sql2, goodId, wareHouseId, "库存初始化", "管理员",
						new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()), num, kucunCost, num, kucunCost);
			} else {
				List<Caiwu_kucunmx> list2 = db.select(Caiwu_kucunmx.class, sql5, goodId, wareHouseId);
				for (Caiwu_kucunmx caiwu_kucunmx : list2) {
					if (caiwu_kucunmx.getChangeTime().getTime() > time) {
						time = caiwu_kucunmx.getChangeTime().getTime();
					}
					date = new Date(time);
				}
				List<Caiwu_kucunmx> list3 = db.select(Caiwu_kucunmx.class, sql6, date);
				for (Caiwu_kucunmx caiwu_kucunmx : list3) {
					firstCost = caiwu_kucunmx.getLastCost();
					firstInventory = caiwu_kucunmx.getLastInventory();
				}
				db.update(sql2, goodId, wareHouseId, "手工调价", "管理员",
						new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()), firstInventory, firstCost, num,
						kucunCost);
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// 从数据库查询信息
	public <T> int getTotalFromDB(Class<T> cla, Object searchCondition) {
		int total = 0;
		String str = "select a.goodId,goodPicture,goodName,sku,wareHouseName,goodNum,goodAttribute,kucunCost from "
				+ "kuguan_goodlog a join caigou_goods  b on  b.goodId=a.goodId join caigou_warehouse "
				+ "c on c.wareHouseId=a.wareHouseId join caiwu_kucuncb d on d.goodId=a.goodId and d.wareHouseId=a.wareHouseId  where a.goodId like ? or goodName like ? ";
		try {
			if (searchCondition == null || searchCondition == "") {
				total = db.select(kuguan_goodlog.class, "select * from kuguan_goodlog ").size();
			} else {
				total = db.select(cla, str, "%" + searchCondition + "%", "%" + searchCondition + "%").size();
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return total;
	}

	public boolean fenyeMethod(PageInfo<?> pageInfo, Object searchCondition, HttpServletRequest request,
			HttpServletResponse response) {
		/**
		 * 分页列表开始
		 */
		int total = 0;// 记录总数
		try {
			total = this.getTotalFromDB(KucuncbPo.class, searchCondition);
		} catch (Exception e) {
			e.printStackTrace();
		}
		pageInfo.setTotal(total);
		int firstpage = 1;// 通过第一页确定其余页码
		String pageNum = request.getParameter("pageNum");// 当前页码
		if (pageNum == null) {
			pageNum = 1 + "";
		}
		pageInfo.setPageNum(Integer.parseInt(pageNum));
		String pageSize = request.getParameter("pageSize");// 每页条数
		if (pageSize == null) {
			pageSize = 10 + "";
		}
		pageInfo.setPageSize(Integer.parseInt(pageSize));
		// 页面总数
		int maxPageNum = (int) Math.ceil(total / pageInfo.getPageSize()) + 1;
		pageInfo.setMaxPageNum(maxPageNum);
		try {
			// 处理不合法请求
			if (Integer.parseInt(pageNum) > maxPageNum || Integer.parseInt(pageNum) < 1) {
				return false;
			}
			if (pageInfo.getPageSize() != 10 && pageInfo.getPageSize() != 20 && pageInfo.getPageSize() != 50
					&& pageInfo.getPageSize() != 100 && pageInfo.getPageSize() != 200) {
				return false;
			}
		} catch (Exception e) {
			return false;
		}
		// 第一页特殊处理
		if (Integer.parseInt(pageNum) - 2 > 1) {
			firstpage = Integer.parseInt(pageNum) - 2;
		}
		pageInfo.setFirstpage(firstpage);
		pageInfo.setSearchCondition(searchCondition);
		/**
		 * 分页列表结束
		 */
		return true;
	}
}
