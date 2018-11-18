package mjy.caiwu.fukuan.service;

import java.util.Date;
import java.util.List;

import mjy.caiwu.fukuan.beans.FuKuanVo;
import mjy.caiwu.jichuziliao.vo.ShouZhiTypeVO;
/**
 * 添加应付单
 * @author student
 *
 */

public interface AddFuKuanService {
	/*
	 * 创建初始操作时间
	 */
	String getCreatTime();
	/*
	 * 添加应付单
	 */
	void addFuKuan(FuKuanVo fuKuanVo);
	/*
	 * 从根据支付类型获得ID
	 */
	Integer getIdByName(List<ShouZhiTypeVO> list,String name);
		
}
