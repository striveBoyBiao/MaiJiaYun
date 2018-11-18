package mjy.caiwu.shoukuan.service.impl;

import java.util.List;

import mjy.caiwu.shoukuan.beans.CwPageInfo;
import mjy.caiwu.shoukuan.beans.CwShouKuanPO;
import mjy.caiwu.shoukuan.beans.CwShouKuanVO;
import mjy.caiwu.shoukuan.dao.CwShouKuanDao;
import mjy.caiwu.shoukuan.dao.impl.CwShouKuanDaoImpl;
import mjy.caiwu.shoukuan.service.CwShouKuanService;

public class CwShouKuanServiceImpl implements CwShouKuanService {

	CwShouKuanDao BaoCun = new CwShouKuanDaoImpl();


	public void BaoCun(CwShouKuanVO cw) {
		// TODO Auto-generated method stub
		BaoCun.insert(cw);
	}

	private CwShouKuanDao cwShouKuanDao = new CwShouKuanDaoImpl();

	@Override
	public CwPageInfo<CwShouKuanVO> listByPage(CwShouKuanPO cwShouKuanPO, CwPageInfo<CwShouKuanVO> page) {
		// 计算总记录数
		int rowCount = getCount(cwShouKuanPO);
		page.setRowCount(rowCount);
		int pageSize = page.getPageSize();
		int pageCount = rowCount / pageSize;
		pageCount = ((rowCount % pageSize == 0) ? pageCount : pageCount + 1);
		page.setPageCount(pageCount);
		// 获取当前页数据
		List<CwShouKuanVO> cwShouKuans = listBy(cwShouKuanPO, page);
		// 获取操作人姓名
		for (CwShouKuanVO cwShouKuanVO : cwShouKuans) {
			String Opname = listById(cwShouKuanVO.getSkOperatorId());
			cwShouKuanVO.setSkOperatorId(Opname);
		}
		// 设置此页面数据
		page.setPageDate(cwShouKuans);
		return page;
	}

	@Override
	public List<CwShouKuanVO> listBy(CwShouKuanPO cwShouKuanPO, CwPageInfo<CwShouKuanVO> page) {

		return cwShouKuanDao.listBy(cwShouKuanPO, page);
	}

	@Override
	public int getCount(CwShouKuanPO cwShouKuanPO) {

		return cwShouKuanDao.getCount(cwShouKuanPO);
	}

	/**
	 * 通过id查询数据
	 */
	@Override
	public CwShouKuanVO queryCwShouKuanById(int skId) {
		// TODO Auto-generated method stub
		return cwShouKuanDao.queryCwShouKuanById(skId);
	}



	/**
	 * 通过id修改表中数据
	 */
	@Override
	public void update(CwShouKuanVO cwShouKuanVO) {
		cwShouKuanDao.update(cwShouKuanVO);

	}

	@Override
	public String listById(String id) {
		return cwShouKuanDao.listById(id);
	}

	

}
