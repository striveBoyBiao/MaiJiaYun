package mjy.caigou.dao;

import java.util.List;

import mjy.caigou.beans.PageInfo;
import mjy.caigou.vo.KCCBMXVO;
import mjy.caigou.vo.KCCBVO;

public interface KCCBDao {
	
	List<KCCBVO> queryKccb(String querytext ,int userid,int pagebegin);
	//根据搜索框里的内容查询
	List<KCCBVO> queryBySkuOrGoodsName(String querytext,int userid);
	
	//获取页面信息
	public PageInfo<KCCBVO> getpageinfo(int userId  ,PageInfo<KCCBVO> pageinfo);

	
	//添加库存 明细
	public void updateKccbMx(KCCBMXVO kccbmxvo);
	
		

}
