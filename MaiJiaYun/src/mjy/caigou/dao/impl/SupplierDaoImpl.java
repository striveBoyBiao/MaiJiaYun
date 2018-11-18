package mjy.caigou.dao.impl;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import mjy.common.util.jdbc.BaseDao;
import mjy.caigou.beans.gys.PageInfo;
import mjy.caigou.dao.SupplierDao;
import mjy.caigou.po.SupplierPO;
import mjy.caigou.vo.SupplierVO;

public class SupplierDaoImpl extends BaseDao<SupplierVO> implements SupplierDao {

	@Override
	public void addSupplier(SupplierVO supplierVO) {
		String sql = "insert into caigou_supplier(SupplierCName,SupplierCAddress,SupplierLPerson,SupplierLPhone,SupplierLMName,SupplierLMMobile,SupplierLMEmail,SupplierLMQq,userId) values(?,?,?,?,?,?,?,?,?)";
		List<Object> params = new ArrayList<Object>();
		params.add(supplierVO.getSupplierCName());
		params.add(supplierVO.getSupplierCAddress());
		params.add(supplierVO.getSupplierLPerson());
		params.add(supplierVO.getSupplierLPhone());
		params.add(supplierVO.getSupplierLMName());
		params.add(supplierVO.getSupplierLMMobile());
		params.add(supplierVO.getSupplierLMEmail());
		params.add(supplierVO.getSupplierLMQq());
		params.add(supplierVO.getUserId());

		this.SaveOrUpdate(sql, params);
	}

	@Override
	public void updateSupplier(SupplierVO supplierVO) {
		String sql = "update caigou_supplier set supplierCName=?,SupplierCAddress=?,supplierLPerson=?,SupplierLPhone=?,SupplierLMName=?,SupplierLMMobile=?,SupplierLMEmail=?,SupplierLMQq=? where supplierId=?";
		List<Object> params = new ArrayList<Object>();
		params.add(supplierVO.getSupplierCName());
		params.add(supplierVO.getSupplierCAddress());
		params.add(supplierVO.getSupplierLPerson());
		params.add(supplierVO.getSupplierLPhone());
		params.add(supplierVO.getSupplierLMName());
		params.add(supplierVO.getSupplierLMMobile());
		params.add(supplierVO.getSupplierLMEmail());
		params.add(supplierVO.getSupplierLMQq());
		params.add(supplierVO.getSupplierId());

		this.SaveOrUpdate(sql, params);
	}

	@Override
	public void deleteSupplier(int supplierId) {
		String sql = "update caigou_supplier set supplierboolean=1 where supplierId=?";
		List<Object> params = new ArrayList<Object>();
		params.add(supplierId);

		this.SaveOrUpdate(sql, params);
	}

	@Override
	public List<SupplierVO> querySupplier(SupplierPO supplierPO) {
		String sql = "select * from caigou_supplier where supplierboolean=0 and userId=?";
		List<Object> params = new ArrayList<>();
		params.add(supplierPO.getUserId());
		if (supplierPO.getSupplierCName() != null) {
			sql = sql + " and supplierCName like ?";
			params.add("%" + supplierPO.getSupplierCName() + "%");
		}
		if (supplierPO.getSupplierId() != null) {
			sql = sql + " and supplierId=?";
			params.add(supplierPO.getSupplierId());
		}
		sql = sql + " order by supplierId desc";
		if (supplierPO.getBeginNum() != null) {
			sql = sql + " limit ?," + PageInfo.pageSize;
			params.add(supplierPO.getBeginNum());
		}

		return this.queryForList(sql, params);
	}

	@Override
	public int getTotalRecords(SupplierPO supplierPO) {
		String sql = "select * from caigou_supplier where supplierboolean=0 and userId=?";
		List<Object> params = new ArrayList<>();
		params.add(supplierPO.getUserId());
		if (supplierPO.getSupplierCName() != null) {
			sql = sql + " and supplierCName like ?";
			params.add("%" + supplierPO.getSupplierCName() + "%");
		}
		if (supplierPO.getSupplierId() != null) {
			sql = sql + " and supplierId=?";
			params.add(supplierPO.getSupplierId());
		}
		sql = sql + " order by supplierId desc";

		return this.queryForList(sql, params).size();
	}

	@Override
	public List<SupplierVO> mapRow(ResultSet rs) throws Exception {
		List<SupplierVO> supplierVOs = new ArrayList<>();
		SupplierVO supplierVO = null;
		while (rs.next()) {
			supplierVO = new SupplierVO();
			supplierVO.setSupplierId(rs.getInt("supplierId"));
			supplierVO.setSupplierCName(rs.getString("supplierCName"));
			supplierVO.setSupplierCAddress(rs.getString("supplierCAddress"));
			supplierVO.setSupplierLPerson(rs.getString("supplierLPerson"));
			supplierVO.setSupplierLPhone(rs.getString("supplierLPhone"));
			supplierVO.setSupplierLMName(rs.getString("supplierLMName"));
			supplierVO.setSupplierLMMobile(rs.getString("supplierLMMobile"));
			supplierVO.setSupplierLMEmail(rs.getString("supplierLMEmail"));
			supplierVO.setSupplierLMQq(rs.getString("supplierLMQq"));

			supplierVOs.add(supplierVO);
		}

		return supplierVOs;
	}
}
