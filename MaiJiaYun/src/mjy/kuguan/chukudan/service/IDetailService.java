package mjy.kuguan.chukudan.service;

import java.util.List;

import mjy.kuguan.chukudan.po.BianJiPO;

public interface IDetailService {

 /**
  * 根据chukudanId查询查询对应的编辑表中的内容
  */
	public List<BianJiPO> queryDetail(int chukudanId);
	
	 /**
	  * 根据chukudanId查询查询对应的单据类型
	  */
	public String getType(int chukudanId);
	
}
