package mjy.caigou.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import mjy.caigou.beans.gys.PageInfo;
import mjy.caigou.beans.PurchaseInfo;
import mjy.caigou.dao.GoodsDao;
import mjy.caigou.dao.ReturnDao;
import mjy.caigou.dao.ReturnGoodsDao;
import mjy.caigou.dao.impl.GoodsDaoImpl;
import mjy.caigou.dao.impl.ReturnDaoImpl;
import mjy.caigou.dao.impl.ReturnGoodsDaoImpl;
import mjy.caigou.po.PurchaseGoodPO;
import mjy.caigou.po.ReturnGoodsPO;
import mjy.caigou.po.ReturnPO;
import mjy.caigou.service.PurchaseGoodService;
import mjy.caigou.service.ReturnService;
import mjy.caigou.vo.GoodsVO;
import mjy.caigou.vo.PurchaseGoodVO;
import mjy.caigou.vo.ReturnGoodsVO;
import mjy.caigou.vo.ReturnVO;
import mjy.caiwu.shoukuan.beans.CwShouKuanVO;
import mjy.caiwu.shoukuan.dao.CwShouKuanDao;
import mjy.caiwu.shoukuan.dao.impl.CwShouKuanDaoImpl;
import mjy.common.util.jdbc.JdbcUtil;
import mjy.common.util.jdbc.TransactionManager;
import mjy.kuguan.chukudan.dao.IBianJiDao;
import mjy.kuguan.chukudan.dao.IChuKuDanDao;
import mjy.kuguan.chukudan.dao.impl.BianJiDaoImpl;
import mjy.kuguan.chukudan.dao.impl.ChuKuDanImpl;
import mjy.kuguan.chukudan.po.BianJiPO;
import mjy.kuguan.chukudan.po.ChuKuDanPO;

public class ReturnServiceImpl implements ReturnService {
	ReturnDao returnDao = new ReturnDaoImpl();
	ReturnGoodsDao returnGoodsDao = new ReturnGoodsDaoImpl();

	@Override
	public void addReturn(ReturnVO returnVO, List<ReturnGoodsVO> returnGoodsVOs) {
		TransactionManager tm = null;
		try {
			tm = JdbcUtil.getTransactionManager();
			tm.startTransaction();
			// 插入新增采购退货单
			returnDao.addReturn(returnVO);

			int returnId = returnDao.getMaxReturnId();

			// 插入采购退货单相关商品信息
			for (ReturnGoodsVO returnGoodsVO : returnGoodsVOs) {
				returnGoodsVO.setReturnId(returnId);
				returnGoodsDao.addReturnGoods(returnGoodsVO);
			}

			tm.commitAndClose();
		} catch (Exception e) {
			tm.rollbackAndClose();
			e.printStackTrace();
		}
	}

	@Override
	public void updateReturn(ReturnVO returnVO, List<ReturnGoodsVO> returnGoodsVOs) {
		TransactionManager tm = null;
		try {
			tm = JdbcUtil.getTransactionManager();
			tm.startTransaction();
			returnVO.setReturnState(0);
			// 修改采购退货单
			returnDao.updateReturn(returnVO);

			int returnId = returnVO.getReturnId();

			// 修改采购退货单相关商品信息
			for (ReturnGoodsVO returnGoodsVO : returnGoodsVOs) {
				returnGoodsVO.setReturnId(returnId);
				returnGoodsDao.updateReturnGoods(returnGoodsVO);
			}

			tm.commitAndClose();
		} catch (Exception e) {
			tm.rollbackAndClose();
			e.printStackTrace();
		}
	}

	@Override
	public void deleteReturn(int returnId) {
		returnDao.deleteReturn(returnId);
	}

	@Override
	public List<ReturnVO> queryReturn(ReturnPO returnPO) {
		return returnDao.queryReturn(returnPO);
	}

	@Override
	public void changeReturnStatu(ReturnVO returnVO) {
		ReturnPO returnPO = new ReturnPO();
		returnPO.setReturnId(returnVO.getReturnId());
		returnPO.setUserId(returnVO.getUserId());

		TransactionManager tm = null;
		try {
			tm = JdbcUtil.getTransactionManager();
			tm.startTransaction();

			returnVO.setReturnState(1);
			// 修改采购退货单
			returnDao.updateReturn(returnVO);
			// 获取选择的采购退货单
			ReturnVO returnVO_out = returnDao.queryReturn(returnPO).get(0);

			// 插入数据到采购收款表
			CwShouKuanVO cwShouKuanVO = new CwShouKuanVO();
			cwShouKuanVO.setSkPayerName(returnVO_out.getSupplierCName());
			cwShouKuanVO.setSkPayerNickname(returnVO_out.getSupplierCName());
			cwShouKuanVO.setSkReceiptsCode(returnVO_out.getReturnCode());
			cwShouKuanVO.setSkPayables(returnVO_out.getReturnMoney());
			cwShouKuanVO.setSkReceivable(returnVO_out.getReturnMoney());
			cwShouKuanVO.setSkCreator(returnVO_out.getReturnMaker() + "");
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			cwShouKuanVO.setSkCreateDate(sdf.format(new Date()));
			cwShouKuanVO.setSkBeiZhu(returnVO_out.getReturnRemark());
			cwShouKuanVO.setSkState(0);
			cwShouKuanVO.setShouzhilxId(2);

			CwShouKuanDao cwShouKuanDao = new CwShouKuanDaoImpl();
			cwShouKuanDao.insert(cwShouKuanVO);

			// 插入数据到库管出库表
			ChuKuDanPO chuku = new ChuKuDanPO();
			chuku.setChukuxiangguandanCode(returnVO_out.getPurchaseCode());
			chuku.setChukuType(1);
			chuku.setChukuCangku(returnVO_out.getReturnWarehouseName());
			chuku.setChukuNum(returnVO_out.getReturnNumber());
			chuku.setChukudanPeople(returnVO_out.getRetrunCheckerName());
			chuku.setChukuState(1);
			chuku.setChukudanTime(sdf.format(new Date()));

			IChuKuDanDao iChuKuDanDao = new ChuKuDanImpl();
			iChuKuDanDao.insert(chuku);

			// 插入数据到库存商品表
			BianJiPO bianji = new BianJiPO();
			ReturnGoodsPO returnGoodsPO = new ReturnGoodsPO();
			returnGoodsPO.setReturnId(returnVO_out.getReturnId());
			List<ReturnGoodsVO> returnGoodsVOs = returnGoodsDao.queryReturnGoods(returnGoodsPO);
			List<PurchaseInfo> purchaseInfos = getPurchaseInfo(returnVO_out.getPurchaseId());
			for (int i = 0; i < returnGoodsVOs.size(); i++) {
				purchaseInfos.get(i).setQuantity(returnGoodsVOs.get(i).getQuantity());
			}
			PurchaseInfo purchaseInfo = purchaseInfos.get(0);
			bianji.setChukudanId(iChuKuDanDao.getMaxId());
			/* bianji.setChukudanId(617); */
			bianji.setBjskuCode(purchaseInfo.getSku());
			bianji.setBjgoodName(purchaseInfo.getGoodName());
			bianji.setBjgoodProperty(purchaseInfo.getProperties());
			bianji.setBjxuchukuNum(purchaseInfo.getQuantity());
			bianji.setBjyichukuNum(0);
			bianji.setBjcangku(returnVO_out.getReturnWarehouseName());

			IBianJiDao iBianJiDao = new BianJiDaoImpl();
			iBianJiDao.insert(bianji);

			tm.commitAndClose();
		} catch (Exception e) {
			e.printStackTrace();
			tm.rollbackAndClose();
		}

	}

	@Override
	public PageInfo<ReturnVO> getPageInfo(ReturnPO returnPO, PageInfo<ReturnVO> pageInfo) {
		// 获得总记录数
		int totalRecords = returnDao.getTotalRecords(returnPO);
		pageInfo.setTotalRecords(totalRecords);

		// 计算总页数
		int pageCount = 0;
		if (totalRecords % PageInfo.pageSize == 0) {
			pageCount = totalRecords / PageInfo.pageSize == 0 ? 1 : totalRecords / PageInfo.pageSize;
		} else {
			pageCount = totalRecords / PageInfo.pageSize + 1;
		}
		pageInfo.setPageCount(pageCount);

		// 判断页数是否超出范围
		if (pageInfo.getPageNum() <= 0) {
			pageInfo.setPageNum(1);
		}
		if (pageInfo.getPageNum() > pageCount) {
			pageInfo.setPageNum(pageCount);
		}
		returnPO.setBeginNum((pageInfo.getPageNum() - 1) * PageInfo.pageSize);
		pageInfo.setPageData(returnDao.queryReturn(returnPO));

		return pageInfo;
	}

	// 获取商品信息
	public List<PurchaseInfo> getPurchaseInfo(int purchaseId) {
		PurchaseGoodPO purchaseGoodPO = new PurchaseGoodPO();
		purchaseGoodPO.setPurchaseId(purchaseId);

		PurchaseGoodService purchaseGoodService = new PurchaseGoodServiceImpl();
		List<PurchaseGoodVO> purchaseGoodVOs = purchaseGoodService.listBy(purchaseGoodPO);

		List<PurchaseInfo> purchaseInfos = new ArrayList<>();
		// 获取商品信息
		GoodsDao goodsDao = new GoodsDaoImpl();
		PurchaseInfo purchaseInfo = null;
		GoodsVO goodVO = null;
		for (PurchaseGoodVO purchaseGoodVO : purchaseGoodVOs) {
			purchaseInfo = new PurchaseInfo();
			int goodId = purchaseGoodVO.getGoodId();
			goodVO = goodsDao.queryGoodInfoById(goodId);

			purchaseInfo.setGoodId(goodId);
			purchaseInfo.setGoodPicture(goodVO.getGoodPicture());
			purchaseInfo.setSku(goodVO.getSku());
			purchaseInfo.setGoodName(goodVO.getGoodName());
			purchaseInfo.setPurchaseNumber(purchaseGoodVO.getPurchaseNum());
			purchaseInfo.setPurchaseSum(purchaseGoodVO.getPurchaseSum());
			purchaseInfo.setProperties("属性");

			purchaseInfos.add(purchaseInfo);
		}
		return purchaseInfos;
	}
}
