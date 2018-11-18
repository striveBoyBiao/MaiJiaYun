package mjy.order.service;

import java.util.List;

import mjy.order.bean.po.LogisticPO;
import mjy.order.bean.vo.Logistic;

public interface LogisticService {
	
	Logistic logisticQuery(LogisticPO logisticPO);
	List<Logistic> logisticQueryAll();
}
