package mjy.caigou.service;

import java.util.List;

import mjy.caigou.po.SupplierPO;
import mjy.caigou.vo.SupplierVO;
import mjy.caigou.beans.gys.PageInfo;

public interface SupplierService {

	// 新增供应商
	void addSupplier(SupplierVO supplierVO);

	// 修改供应商
	void updateSupplier(SupplierVO supplierVO);

	// 删除供应商
	void deleteSupplier(int supplierId);

	// 查询供应商
	List<SupplierVO> querySupplier(SupplierPO supplierPO);

	// 查询页面信息
	PageInfo<SupplierVO> getPageInfo(SupplierPO supplierPO, PageInfo<SupplierVO> pageInfo);

	// 查询总记录数
	int getTotalRecords(SupplierPO supplierPO);
}
