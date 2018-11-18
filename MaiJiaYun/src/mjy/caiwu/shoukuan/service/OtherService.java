package mjy.caiwu.shoukuan.service;

import java.util.List;

import mjy.caiwu.shoukuan.beans.CwShouKuanVO;

/**
 * 对其他表进行增删改查的service
 *
 */
public interface OtherService {
	//通过采购退货单的ID获取数据
		public CwShouKuanVO CwCaiGouTuiHuoSelect(int returnId);
		public  Integer select(String UserId);
}
