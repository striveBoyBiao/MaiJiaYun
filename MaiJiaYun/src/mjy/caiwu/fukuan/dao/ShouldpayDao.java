package mjy.caiwu.fukuan.dao;

import java.util.List;

import mjy.caiwu.fukuan.beans.FuKuanPO;
import mjy.caiwu.fukuan.beans.FuKuanVo;
import mjy.caiwu.fukuan.beans.FuKuanZhVo;
import mjy.caiwu.fukuan.beans.PageInfo;

public interface ShouldpayDao {
	
	/**
	 * 应付款--操作付款
	 */
	public void Pay(FuKuanVo spv);
	
	/**
	 * 应付款--操作坏账
	 */
	public void Bad_Pay(FuKuanVo spv);
	
	/**
	 * 根据相关单据号获得应付款页面的详情
	 * @param fkNo
	 * @return
	 */
	public List<FuKuanVo> getDetailDate(String fkNo);
	
	/**
	 * 将详情页面新加的内容插入数据库
	 * @param fkCreater
	 * @return
	 */
	public void insertPayMoney(FuKuanVo fkv);
	
	/**
	 * 将详情页面改动的银行账号插入数据库
	 * @param fkv
	 */
	public void updateBankAccount(FuKuanVo fkv);
	
	/**
	 * 获取应付款页面的所有数据
	 * @return
	 */
	public List<FuKuanVo> listByPage(FuKuanPO fkp,int fkState,PageInfo<FuKuanVo> page,int bossId);
	
	/**
	 * 更改采购单的付款状态为“已付款”
	 */
	public void updateCaigouState(String paymentState,String fkNo,int userId);
	
	/**
	 * 将从退款退货过来的数据插入数据库
	 */
	public void insertFromBackGood(FuKuanVo fkv);
	
}
