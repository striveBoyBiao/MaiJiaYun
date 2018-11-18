package mjy.caiwu.fukuan.service;

import java.util.List;
import java.util.Map;

import mjy.caiwu.fukuan.beans.FuKuanZhVo;
/**添加应付单
 * 获取银行表的业务
 * @author student
 *
 */
public interface GetBankService {
	/*
	 * 返回银行表的所有数据
	 */
	List<FuKuanZhVo> listByBank(int boosId);
	/*
	 * 获得无重复的银行name
	 */
	Map<String,String> getAllBank(List<FuKuanZhVo> list);
	/*
	 * 查询数据库中是否存在数据
	 */
	boolean idIsExit(String id,String name);
	/*
	 * 根据银行账户获得默认ID
	 */
	String getDefaultByID(List<FuKuanZhVo> list,String id);
	
	/**
	 * 根据相关单据号获得银行默认账号
	 * @return
	 */
	public List<FuKuanZhVo> getBankId(String fkNo);
	
	
	/**
	 * 根据默认id查找到银行的账户和开户机构
	 * @return
	 */
	List<FuKuanZhVo> getBankIdAndBankName(String dafaultBankId);
}
