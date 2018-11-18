package mjy.caiwu.fukuan.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import mjy.caiwu.fukuan.beans.FuKuanVo;
import mjy.caiwu.fukuan.dao.AddFuKuanDao;
import mjy.caiwu.fukuan.dao.impl.AddFuKuanDaoImpl;
import mjy.caiwu.fukuan.service.AddFuKuanService;
import mjy.caiwu.jichuziliao.vo.ShouZhiTypeVO;

public class AddFuKuanServiceImpl implements AddFuKuanService {
	AddFuKuanDao addFuKuanDao = new AddFuKuanDaoImpl();
	/*
	 * 获得一个当前时间
	 * (non-Javadoc)
	 * @see mjy.caiwu.fukuan.service.AddFuKuanService#getCreatTime()
	 */
	@Override
	public String getCreatTime() {
		Date createTime=new Date();
		String sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(createTime);
		return sdf;
	}
	/*
	 * 添加数据库添加
	 * (non-Javadoc)
	 * @see mjy.caiwu.fukuan.service.AddFuKuanService#addFuKuan(mjy.caiwu.fukuan.beans.FuKuanVo)
	 */
	@Override
	public void addFuKuan(FuKuanVo fuKuanVo) {
		// TODO Auto-generated method stub
		 addFuKuanDao.addFuKuan(fuKuanVo);
	}
	/*
	 * 根据收支类型的name获得收支类型的id
	 * @see mjy.caiwu.fukuan.service.AddFuKuanService#getIdByName(mjy.caiwu.jichuziliao.vo.ShouZhiTypeVO)
	 */
	@Override
	public Integer getIdByName(List<ShouZhiTypeVO> list,String name) {
		Map<String, Integer> map=new HashMap<String, Integer>();
		for (ShouZhiTypeVO shouZhiTypeVo : list) {
			map.put(shouZhiTypeVo.getShouzhilxType(),shouZhiTypeVo.getShouzhilxId() );
		}
		Integer id=map.get(name);
		return id;
	}


	

}
