package mjy.kuguan.ruku.factory;

import mjy.kuguan.ruku.po.CaigourukuPO;
import mjy.kuguan.ruku.po.CaigouxiangqingPO;
import mjy.kuguan.ruku.po.DiaoborukuPO;
import mjy.kuguan.ruku.po.DiaoboxiangqingPO;
import mjy.kuguan.ruku.po.TuihuorukuPO;
import mjy.kuguan.ruku.po.TuihuoxiangqingPO;
import mjy.kuguan.ruku.po.WanchengPO;
/**
 * PO工厂
 * @author student
 *
 */
public class PersistentObjectFactory {
	private static final String CLASS_PATH = "mjy.kuguan.ruku.po.";
	
	public static CaigourukuPO getCaigourukuPO(){
		return (CaigourukuPO)getObject("CaigourukuPO");
	}
	public static CaigouxiangqingPO getCaigouxiangqingPO(){
		return (CaigouxiangqingPO)getObject("CaigouxiangqingPO");
	}
	public static TuihuorukuPO getTuihuorukuPO(){
		return (TuihuorukuPO)getObject("TuihuorukuPO");
	}
	public static TuihuoxiangqingPO getTuihuoxiangqingPO(){
		return (TuihuoxiangqingPO)getObject("TuihuoxiangqingPO");
	}
	public static DiaoborukuPO getDiaoborukuPO(){
		return (DiaoborukuPO)getObject("DiaoborukuPO");
	}
	public static DiaoboxiangqingPO getDiaoboxiangqingPO(){
		return (DiaoboxiangqingPO)getObject("DiaoboxiangqingPO");
	}
	public static WanchengPO getWanchengPO(){
		return (WanchengPO)getObject("WanchengPO");
	}
	
	private static Object getObject(String className){
		Object obj = null;
		try {
			obj = Class.forName(CLASS_PATH + className).newInstance();
		} catch (InstantiationException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return obj;
	}
}
