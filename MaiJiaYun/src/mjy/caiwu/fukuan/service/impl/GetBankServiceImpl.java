package mjy.caiwu.fukuan.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import mjy.caiwu.fukuan.beans.FuKuanZhVo;
import mjy.caiwu.fukuan.dao.GetBankDao;
import mjy.caiwu.fukuan.dao.impl.GetBankDaoImpl;
import mjy.caiwu.fukuan.service.GetBankService;
/**
 * 获得银行数据
 * @author student
 *
 */
public class GetBankServiceImpl implements GetBankService {
	GetBankDao getBankDao = new GetBankDaoImpl();
	/*
	 * 获取所有的银行的list数据
	 * (non-Javadoc)
	 * @see mjy.caiwu.fukuan.service.GetBankService#listByBank()
	 */
	@Override
	public List<FuKuanZhVo> listByBank(int boosId) {
		// TODO Auto-generated method stub
		return getBankDao.listByBank(boosId);
	}
	/*
	 * (non-Javadoc)
	 * @see mjy.caiwu.fukuan.service.GetBankService#getAllBank(java.util.List)
	 */
	@Override
	public Map<String,String> getAllBank(List<FuKuanZhVo> list) {
		Map<String, String> map=new HashMap<>();
		List<String> list1 = new ArrayList<>();
		for (FuKuanZhVo obj : list) {
			String name=(String)obj.getFkzhBankName();
			String bankID=(String)obj.getFkzhBankId();
			map.put(name,bankID);
		}
		
		return map;
	}
	/*
	 * 检查Id是否存在
	 * (non-Javadoc)
	 * @see mjy.caiwu.fukuan.service.GetBankService#idIsExit(java.lang.String, java.lang.String)
	 */
	@Override
	public boolean idIsExit(String id,String name) {
		// TODO Auto-generated method stub
		return getBankDao.idIsExit(id,name);
	}
	/*
	 * 获得根据ID获取getFkzhDafaultId
	 * @see mjy.caiwu.fukuan.service.GetBankService#getDefaultByID(java.util.List, java.lang.String)
	 */
	@Override
	public String getDefaultByID(List<FuKuanZhVo> list, String id) {
		for (FuKuanZhVo fuKuanZhVo : list) {
			if(fuKuanZhVo.getFkzhBankId().equals(id)){
				return fuKuanZhVo.getFkzhDafaultId();
			}
		}
		return null;
	}
	@Override
	public List<FuKuanZhVo> getBankId(String fkNo) {
		// TODO Auto-generated method stub
		return getBankDao.getBankId(fkNo);
	}
		
	/**
	 * 根据默认id查找到银行的账户和开户机构
	 * @return
	 */
	@Override
	public List<FuKuanZhVo> getBankIdAndBankName(String dafaultBankId) {
	
		return getBankDao.getBankIdAndBankName(dafaultBankId);
	}

}
