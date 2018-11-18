package mjy.caiwu.fukuan.dao;

import java.util.List;

import mjy.caiwu.fukuan.beans.FuKuanZhVo;
/**
 * 获取银行数据业务
 * @author student
 *
 */
public interface GetBankDao {
	/*
	 * 查询银行数据
	 */
	List<FuKuanZhVo> listByBank(int boosId);
	/*
	 * 银行ID是否存在
	 */
	boolean idIsExit(String id,String name);
	
	/**
	 * 根据相关单据号获得银行默认账号
	 * @return
	 */
	public List<FuKuanZhVo> getBankId(String fkNo);
	
	/**
	 * 根据账户默认id查找银行账户和银行id
	 * @param dafaultBankId
	 * @return
	 */
	public List<FuKuanZhVo> getBankIdAndBankName(String dafaultBankId);
}
