package mjy.caiwu.shoukuan.dao.impl;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import mjy.caiwu.jichuziliao.vo.FuKuanAccountVO;
import mjy.caiwu.shoukuan.dao.CaiWuAddBankId;


public class CaiWuAddBankIdImpl  extends BaseDao<FuKuanAccountVO> implements CaiWuAddBankId{

	@Override
	public List<FuKuanAccountVO> mapRow(ResultSet rs) throws Exception {
		List<FuKuanAccountVO> FuKuanAccountVOs=new ArrayList<FuKuanAccountVO>();
		FuKuanAccountVO FuKuanAccountVO=null;
		while(rs.next()){
			FuKuanAccountVO=new FuKuanAccountVO();
			FuKuanAccountVO.setDafaultBankId(rs.getBoolean("dafaultBankId"));
			FuKuanAccountVO.setFkzhBankId(rs.getString("fkzhBankId"));
			FuKuanAccountVO.setFkzhBankName(rs.getString("fkzhBankName"));
			FuKuanAccountVO.setFkzhDafaultId(rs.getInt("fkzhDafaultId"));
			FuKuanAccountVO.setFkzhRemark(rs.getString("fkzhRemark"));
			FuKuanAccountVO.setFlshopId(rs.getInt("flshopId"));

			FuKuanAccountVOs.add(FuKuanAccountVO);
		}
		return FuKuanAccountVOs;
	}

	@Override
	public List<FuKuanAccountVO> listBy1(String param) {
		List<Object> params = new ArrayList<Object>();
		params.add(param);
		// 根据查询参数写出要执行sql语句
		String sql = "select * from caiwu_fukuanzh where flshopId=?";


		return this.queryForList(sql, params);
	}

}
