package mjy.order.dao;

import java.util.List;

import mjy.order.bean.po.DetailGoodPO;
import mjy.order.bean.vo.DetailGood;

public interface DetailGoodDao {
	
	public List<DetailGood> detailGoodQuery(DetailGoodPO goodPO);
	
}
