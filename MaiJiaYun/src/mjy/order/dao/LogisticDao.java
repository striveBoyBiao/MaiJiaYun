package mjy.order.dao;

import java.util.List;

import mjy.order.bean.po.LogisticPO;
import mjy.order.bean.vo.Logistic;

public interface LogisticDao {
	
	public List<Logistic> logisticQuery(LogisticPO logisticPO);
	
}
