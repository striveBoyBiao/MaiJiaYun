package mjy.order.service;

import java.util.List;

import mjy.order.bean.po.DetailGoodPO;
import mjy.order.bean.vo.DetailGood;

public interface DetailGoodService {
	
	List<DetailGood> detailGoodQueryAll(DetailGoodPO detailGoodPO);
	DetailGood detailGoodQuery(DetailGoodPO detailGoodPO);
}
