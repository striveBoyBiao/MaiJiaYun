package mjy.caigou.dao;

import java.util.List;

import mjy.caigou.po.SupplierPO;
import mjy.caigou.vo.SupplierVO;

public interface SupplierDao {
	// 新增供应商
	void addSupplier(SupplierVO supplierVO);

	// 修改供应商
	void updateSupplier(SupplierVO supplierVO);

	// 删除供应商
	void deleteSupplier(int supplierId);

	// 查询供应商
	List<SupplierVO> querySupplier(SupplierPO supplierPO);

	// 查询总记录数
	int getTotalRecords(SupplierPO supplierPO);
}
