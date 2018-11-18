package mjy.kuguan.ruku.factory;

import mjy.kuguan.ruku.dao.impl.CaigouTransaction;
import mjy.kuguan.ruku.dao.impl.CaigourukuDaoImpl;
import mjy.kuguan.ruku.dao.impl.CaigouxiangqingDaoImpl;
import mjy.kuguan.ruku.dao.impl.DiaoboTransaction;
import mjy.kuguan.ruku.dao.impl.DiaoborukuDaoImpl;
import mjy.kuguan.ruku.dao.impl.DiaoboxiangqingDaoImpl;
import mjy.kuguan.ruku.dao.impl.RukuUserDaoImpl;
import mjy.kuguan.ruku.dao.impl.RukuWarehouseDaoImpl;
import mjy.kuguan.ruku.dao.impl.TuihuoTransaction;
import mjy.kuguan.ruku.dao.impl.TuihuorukuDaoImpl;
import mjy.kuguan.ruku.dao.impl.TuihuoxiangqingDaoImpl;
import mjy.kuguan.ruku.dao.impl.WanchengrukuDaoImpl;

/**
 * Dao实现类工厂
 * @author student
 *
 */
public class DaoImplFactory {
	private static final String CLASS_PATH = "mjy.kuguan.ruku.dao.impl.";
	
	public static CaigourukuDaoImpl getCaigourukuDaoImpl(){
		return (CaigourukuDaoImpl)getObject("CaigourukuDaoImpl");
	}
	public static CaigouxiangqingDaoImpl getCaigouxiangqingDaoImpl(){
		return (CaigouxiangqingDaoImpl)getObject("CaigouxiangqingDaoImpl");
	}
	public static CaigouTransaction getCaigouTransaction(){
		return (CaigouTransaction)getObject("CaigouTransaction");
	}
	public static TuihuorukuDaoImpl getTuihuorukuDaoImpl(){
		return (TuihuorukuDaoImpl)getObject("TuihuorukuDaoImpl");
	}
	public static TuihuoxiangqingDaoImpl getTuihuoxiangqingDaoImpl(){
		return (TuihuoxiangqingDaoImpl)getObject("TuihuoxiangqingDaoImpl");
	}
	public static TuihuoTransaction getTuihuoTrasaction(){
		return (TuihuoTransaction)getObject("TuihuoTransaction");
	}
	public static DiaoborukuDaoImpl getDiaoborukuDaoImpl(){
		return (DiaoborukuDaoImpl)getObject("DiaoborukuDaoImpl");
	}
	public static DiaoboxiangqingDaoImpl getDiaoboxiangqingDaoImpl(){
		return (DiaoboxiangqingDaoImpl)getObject("DiaoboxiangqingDaoImpl");
	}
	public static DiaoboTransaction getDiaoboTransaction(){
		return (DiaoboTransaction)getObject("DiaoboTransaction");
	}
	public static WanchengrukuDaoImpl getWanchengrukuDaoImpl(){
		return (WanchengrukuDaoImpl)getObject("WanchengrukuDaoImpl");
	}
	public static RukuUserDaoImpl getRukuUserDaoImpl(){
		return (RukuUserDaoImpl)getObject("RukuUserDaoImpl");
	}
	public static RukuWarehouseDaoImpl getRukuWarehouseDaoImpl(){
		return (RukuWarehouseDaoImpl)getObject("RukuWarehouseDaoImpl");
	}
	
	private static Object getObject(String className){
		Object obj = null;
		try {
			obj = Class.forName(CLASS_PATH + className).newInstance();
		} catch (InstantiationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		return obj;
	}
}
