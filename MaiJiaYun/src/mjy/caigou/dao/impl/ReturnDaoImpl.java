package mjy.caigou.dao.impl;

import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import mjy.caigou.beans.gys.PageInfo;
import mjy.caigou.dao.ReturnDao;
import mjy.caigou.po.ReturnPO;
import mjy.caigou.vo.ReturnVO;
import mjy.common.util.jdbc.BaseDao;

public class ReturnDaoImpl extends BaseDao<ReturnVO> implements ReturnDao {

	@Override
	public void addReturn(ReturnVO returnVO) {
		String sql = "insert into caigou_return(returnCode,purchaseId,WarehouseId,ReturnNumber,ReturnOutNum,ReturnMoney,returnTime,returnMaker,returnChecker,returnRemark,returnState,userId) values(?,?,?,?,?,?,?,?,?,?,?,?)";
		List<Object> params = new ArrayList<Object>();
		params.add(returnVO.getReturnCode());
		params.add(returnVO.getPurchaseId());
		params.add(returnVO.getReturnWarehouseId());
		params.add(returnVO.getReturnNumber());
		params.add(returnVO.getReturnOutNum());
		params.add(returnVO.getReturnMoney());
		params.add(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date()));
		params.add(returnVO.getReturnMaker());
		params.add(returnVO.getReturnChecker());
		params.add(returnVO.getReturnRemark());
		params.add(returnVO.getReturnState());
		params.add(returnVO.getUserId());

		this.SaveOrUpdate(sql, params);
	}

	@Override
	public void updateReturn(ReturnVO returnVO) {
		String sql = "update caigou_return set returnState=?,returnChecker=?";
		List<Object> params = new ArrayList<Object>();
		params.add(returnVO.getReturnState());
		params.add(returnVO.getUserId());
		if (returnVO.getReturnNumber() != null) {
			sql += ",returnNumber=?";
			params.add(returnVO.getReturnNumber());
		}
		if (returnVO.getReturnWarehouseId() != null) {
			sql += ",returnWarehouseId=?";
			params.add(returnVO.getReturnWarehouseId());
		}
		if (returnVO.getReturnMoney() != null) {
			sql += ",returnMoney=?";
			params.add(returnVO.getReturnMoney());
		}
		if (returnVO.getReturnRemark() != null) {
			sql += ",returnRemark=?";
			params.add(returnVO.getReturnRemark());
		}
		sql += " where returnId=?";
		params.add(returnVO.getReturnId());

		this.SaveOrUpdate(sql, params);
	}

	@Override
	public void deleteReturn(int returnId) {
		String sql = "update caigou_return set deleteState=1 where returnId=?";
		List<Object> params = new ArrayList<Object>();
		params.add(returnId);

		this.SaveOrUpdate(sql, params);
	}

	@Override
	public int getMaxReturnId() {
		String sql = "select * from caigou_return_query where returnId=(select max(returnId) from caigou_return)";
		List<Object> params = new ArrayList<Object>();
		List<ReturnVO> returnVOs = this.queryForList(sql, params);
		Integer returnId = null;
		for (ReturnVO returnVO : returnVOs) {
			returnId = returnVO.getReturnId();
		}
		return returnId;
	}

	@Override
	public List<ReturnVO> queryReturn(ReturnPO returnPO) {
		String sql = "select * from caigou_return_query where deleteState=0 and userId=?";
		List<Object> params = new ArrayList<Object>();
		params.add(returnPO.getUserId());
		if (returnPO.getReturnState() != null) {
			sql += " and returnState=?";
			params.add(returnPO.getReturnState());
		}
		if (returnPO.getReturnId() != null) {
			sql += " and returnId=?";
			params.add(returnPO.getReturnId());
		}
		sql += " order by returnId desc";
		if (returnPO.getBeginNum() != null) {
			sql += " limit ?," + PageInfo.pageSize;
			params.add(returnPO.getBeginNum());
		}

		return this.queryForList(sql, params);
	}

	@Override
	public List<ReturnVO> mapRow(ResultSet rs) throws Exception {
		List<ReturnVO> returnVOs = new ArrayList<>();
		ReturnVO returnVO = null;
		while (rs.next()) {
			returnVO = new ReturnVO();
			returnVO.setReturnId(rs.getInt("returnId"));
			returnVO.setReturnCode(rs.getString("returnCode"));
			returnVO.setPurchaseId(rs.getInt("purchaseId"));
			returnVO.setPurchaseCode(rs.getString("purchaseCode"));
			returnVO.setSupplierCName(rs.getString("supplierCName"));
			returnVO.setReturnWarehouseId(rs.getInt("returnWarehouseId"));
			returnVO.setReturnWarehouseName(rs.getString("returnWarehouseName"));
			returnVO.setPurchaseWarehouseId(rs.getInt("purchaseWarehouseId"));
			returnVO.setPurchaseWarehouseName(rs.getString("purchaseWarehouseName"));
			returnVO.setReturnNumber(rs.getInt("returnNumber"));
			returnVO.setReturnOutNum(rs.getInt("returnOutNum"));
			returnVO.setReturnMoney(rs.getDouble("returnMoney"));
			returnVO.setPurchaseSum(rs.getDouble("purchaseSum"));
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			returnVO.setReturnTime(sdf.format(rs.getTimestamp("returnTime")));
			returnVO.setReturnMaker(rs.getInt("returnMaker"));
			returnVO.setReturnMakerName(rs.getString("returnMakerName"));
			returnVO.setReturnChecker(rs.getInt("returnChecker"));
			returnVO.setRetrunCheckerName(rs.getString("returnCheckerName"));
			returnVO.setReturnRemark(rs.getString("returnRemark"));
			returnVO.setReturnState(rs.getInt("returnState"));

			returnVOs.add(returnVO);
		}

		return returnVOs;
	}

	@Override
	public int getTotalRecords(ReturnPO returnPO) {
		String sql = "select * from caigou_return_query where deleteState=0 and userId=?";
		List<Object> params = new ArrayList<Object>();
		params.add(returnPO.getUserId());
		if (returnPO.getReturnState() != null) {
			sql += " and returnState=?";
			params.add(returnPO.getReturnState());
		}

		return this.queryForList(sql, params).size();
	}

}
