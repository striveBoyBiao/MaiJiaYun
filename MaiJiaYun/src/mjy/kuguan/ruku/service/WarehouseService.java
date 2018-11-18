package mjy.kuguan.ruku.service;

import java.util.ArrayList;
import java.util.List;

import mjy.kuguan.ruku.dao.impl.CaigourukuDaoImpl;
import mjy.kuguan.ruku.factory.DaoImplFactory;

public class WarehouseService {
	public List<String> getWareHouse(int id){
		List<String> list= new ArrayList<>();
		//��ȡ�ֿ����������
		
		CaigourukuDaoImpl cd = DaoImplFactory.getCaigourukuDaoImpl();
		list= cd.getAllWarehouse(id);
		
		return list;
	}
}
