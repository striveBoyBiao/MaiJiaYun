package mjy.kuguan.diaobo.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;

import mjy.kuguan.diaobo.dao.DiaobodanDao;
import mjy.kuguan.diaobo.dao.DiaobodanstateDao;
import mjy.kuguan.diaobo.dao.impl.DiaobodanDaoImpl;
import mjy.kuguan.diaobo.dao.impl.DiaobodanstateDaoImpl;
import mjy.kuguan.diaobo.po.DiaobodanPO;
import mjy.kuguan.diaobo.po.DiaobodanstatePO;
import mjy.kuguan.diaobo.po.PageInfo;
import mjy.kuguan.diaobo.po.XiangqingDiaoboPO;
import mjy.kuguan.diaobo.service.DiaobodanService;
import mjy.kuguan.diaobo.vo.DiaobodanVO;
import mjy.kuguan.diaobo.vo.DiaobodanstateVO;

public class DiaobodanServiceImpl implements DiaobodanService {

	DiaobodanstateDao diaobodanstateDao = new DiaobodanstateDaoImpl();

	DiaobodanDao diaobodanDao = new DiaobodanDaoImpl();

	@Override
	public boolean insertDiaobodan(List<DiaobodanVO> diaobodanVOs) {
		// TODO Auto-generated method stub
		return diaobodanDao.insert(diaobodanVOs);
	}

	@Override
	public boolean insertDiaobodanstate(List<DiaobodanstatePO> diaobodanstatePOs) {
		return diaobodanstateDao.insert(diaobodanstatePOs);

	}

	@Override
	public boolean deleteBydiaobostateCode(String diaobodanCode) {

		return diaobodanDao.deleteBydiaoboCode(diaobodanCode);
	}
	@Override
	public boolean updateAsState(String diaobodanCode, String diaobodanAuditor, String diaobodanAudittime,
			String diaoboState) {
		// TODO Auto-generated method stub
		return diaobodanstateDao.updateAsState(diaobodanCode, diaobodanAuditor, diaobodanAudittime, diaoboState);
	}

	
	

	@Override
	public PageInfo<DiaobodanstateVO> listByPage(DiaobodanPO diaobodanPO, PageInfo<DiaobodanstateVO> page) {

		// 设置请求参数
		page.setQueryParam(diaobodanPO.getQueryUrl());

		// 计算总页数
		int rowCount = diaobodanstateDao.getCount(diaobodanPO);
		page.setRowCount(rowCount);

		int pageCount = 0;
		int pageSize = page.getPageSize();

		if (rowCount % pageSize == 0) {
			pageCount = rowCount / pageSize;
		} else {
			pageCount = rowCount / pageSize + 1;
		}
		page.setPageCount(pageCount);

		// 获取当前页数据
		List<DiaobodanstateVO> pageData = diaobodanstateDao.listBy(diaobodanPO, page);
		page.setPageData(pageData);

		return page;
	}

	@Test
	public void test() {
		/*
		 * PageInfo<DiaobodanstateVO> pi = new PageInfo<>();
		 * System.out.println(listByPage(new DiaobodanPO(),pi).getPageData());
		 */
		
		//System.out.println(querydiaobo("DB201612090859001"));
		querydiaobo("DB201612090859001");
	}

	@Override
	public int getCount(DiaobodanPO diaobodanPO) {

		return diaobodanstateDao.getCount(diaobodanPO);
	}


	@Override
	public List<XiangqingDiaoboPO> querydiaobo(String diaobodanCode) {
		List<DiaobodanVO> diaobodan=diaobodanDao.querydiaobo(diaobodanCode);
		
		List<DiaobodanstateVO> diaobodanstate=diaobodanstateDao.queryByCode(diaobodanCode);
		System.out.println(diaobodanstate);
		List<XiangqingDiaoboPO> xiangqingDiaobos=new ArrayList<>();
		XiangqingDiaoboPO xiangqingDiaobo = null;
		for (DiaobodanVO Diaobo:diaobodan) {
			xiangqingDiaobo = new XiangqingDiaoboPO();
			xiangqingDiaobo.setSku(Diaobo.getSku());
			xiangqingDiaobo.setGoodName(Diaobo.getGoodName());
			xiangqingDiaobo.setBeizhu(Diaobo.getBeizhu());
			xiangqingDiaobo.setGoodProperty(Diaobo.getGoodProperty());
			xiangqingDiaobo.setGoodRepertory(Diaobo.getGoodRepertory());
			xiangqingDiaobo.setOutNumber(Diaobo.getOutNumber());
			
			xiangqingDiaobo.setDiaobodanOutStore(diaobodanstate.get(0).getDiaobodanOutStore());
			xiangqingDiaobo.setDiaobodanInStore(diaobodanstate.get(0).getDiaobodanInStore());
			xiangqingDiaobo.setDiaoboBeizhu(diaobodanstate.get(0).getDiaoboBeizhu());
			xiangqingDiaobo.setDiaoboState(diaobodanstate.get(0).getDiaoboState());
			xiangqingDiaobos.add(xiangqingDiaobo);
		}
		
		return xiangqingDiaobos;
	}

	

	// 已完成
	@Override
	public PageInfo<DiaobodanstateVO> listByPage(DiaobodanstatePO diaobodanstatePO, PageInfo<DiaobodanstateVO> page) {
		// 设置请求参数
		page.setQueryParam(diaobodanstatePO.getQueryUrl());

	

		// 计算总页数
		int rowCount = diaobodanstateDao.getCount(diaobodanstatePO);
		page.setRowCount(rowCount);

		int pageCount = 0;
		int pageSize = page.getPageSize();

		if (rowCount % pageSize == 0) {
			pageCount = rowCount / pageSize;
		} else {
			pageCount = rowCount / pageSize + 1;
		}
		page.setPageCount(pageCount);
		page.setPageBegin((Integer.parseInt(page.getPageNo()) - 1) * page.getPageSize());

		// 获取当前页数据
		List<DiaobodanstateVO> pageData = diaobodanstateDao.listByCheck(diaobodanstatePO, page);
		page.setPageData(pageData);

		return page;
	}

	@Override
	public int getCount(DiaobodanstatePO diaobodanstatePO) {
		return diaobodanstateDao.getCount(diaobodanstatePO);
	}

}
