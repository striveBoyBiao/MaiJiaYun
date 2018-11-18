package mjy.caigou.service.impl;

import java.util.List;

import mjy.caigou.dao.SupplierDao;
import mjy.caigou.dao.impl.SupplierDaoImpl;
import mjy.caigou.po.SupplierPO;
import mjy.caigou.service.SupplierService;
import mjy.caigou.vo.SupplierVO;
import mjy.caigou.beans.gys.PageInfo;

public class SupplierServiceImpl implements SupplierService {
	SupplierDao supplierDao = new SupplierDaoImpl();

	@Override
	public void addSupplier(SupplierVO supplierVO) {
		supplierDao.addSupplier(supplierVO);
	}

	@Override
	public void updateSupplier(SupplierVO supplierVO) {
		supplierDao.updateSupplier(supplierVO);
	}

	@Override
	public void deleteSupplier(int supplierId) {
		supplierDao.deleteSupplier(supplierId);
	}

	@Override
	public int getTotalRecords(SupplierPO supplierPO) {
		return supplierDao.getTotalRecords(supplierPO);
	}

	@Override
	public PageInfo<SupplierVO> getPageInfo(SupplierPO supplierPO, PageInfo<SupplierVO> pageInfo) {
		int totalRecords = supplierDao.getTotalRecords(supplierPO);
		pageInfo.setTotalRecords(totalRecords);

		int pageCount = 0;
		// ������ҳ������СΪ1
		if (totalRecords % PageInfo.pageSize == 0) {
			pageCount = totalRecords / PageInfo.pageSize == 0 ? 1 : totalRecords / PageInfo.pageSize;
		} else {
			pageCount = totalRecords / PageInfo.pageSize + 1;
		}
		pageInfo.setPageCount(pageCount);

		// �ж���һҳ����һҳ�Ƿ񳬳���Χ
		if (pageInfo.getPageNum() == 0) {
			pageInfo.setPageNum(1);
		}
		if (pageInfo.getPageNum() == pageCount + 1) {
			pageInfo.setPageNum(pageCount);
		}

		supplierPO.setBeginNum((pageInfo.getPageNum() - 1) * PageInfo.pageSize);
		pageInfo.setPageData(this.querySupplier(supplierPO));
		pageInfo.setQueryUrl(supplierPO.getQueryUrl());

		return pageInfo;
	}

	@Override
	public List<SupplierVO> querySupplier(SupplierPO supplierPO) {
		return supplierDao.querySupplier(supplierPO);
	}

}
