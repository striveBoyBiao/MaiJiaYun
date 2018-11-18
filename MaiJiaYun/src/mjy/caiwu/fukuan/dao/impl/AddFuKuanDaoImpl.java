package mjy.caiwu.fukuan.dao.impl;

import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import mjy.caiwu.fukuan.beans.FuKuanVo;
import mjy.caiwu.fukuan.dao.AddFuKuanDao;

public class AddFuKuanDaoImpl extends BaseDao<FuKuanVo> implements AddFuKuanDao {
	/*
	 * 添加应付单的DaoImpl
	 * 在caiwu_fukuan插入数据
	 * @see mjy.caiwu.fukuan.dao.AddFuKuanDao#addFuKuan(mjy.caiwu.fukuan.beans.FuKuanVo)
	 */
	@Override
	public void addFuKuan(FuKuanVo fuKuanVo) {
		String sql="INSERT INTO caiwu_fukuan(fkSkName,fkSkNickName,fkShouldpayMoney,fkPayMoney,fkShouzhilxId,fkNo,fkRemark,fkzhDafaultId,fkCreaterId,fkState,fkCreaterTime) VALUES(?,?,?,?,?,?,?,?,?,?,?)";
		List<Object> params = new ArrayList<Object>();
		params.add(fuKuanVo.getFkSkName());
		params.add(fuKuanVo.getFkSkNickName());
		params.add(fuKuanVo.getFkShouldpayMoney().doubleValue());
		params.add(fuKuanVo.getFkPayMoney().doubleValue());
		params.add(fuKuanVo.getFkShouzhilxId());
		params.add(fuKuanVo.getFkNo());
		params.add(fuKuanVo.getFkRemark());
		params.add(fuKuanVo.getFkzhDafaultId());
		params.add(fuKuanVo.getFkCreaterId());
		params.add(2);
		params.add(fuKuanVo.getFkCreaterTime());
		this.SaveOrUpdate(sql, params);
	}

	


	@Override
	public List<FuKuanVo> mapRow(ResultSet rs) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
