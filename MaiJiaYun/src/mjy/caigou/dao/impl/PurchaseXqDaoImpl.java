package mjy.caigou.dao.impl;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import mjy.caigou.dao.BaseDao;
import mjy.caigou.dao.PurchaseDao;
import mjy.caigou.po.DetailsPO;
import mjy.caigou.po.PurchasePO;
import mjy.caigou.vo.PurchaseVO;
import mjy.caigou.vo.StuEntity;

public class PurchaseXqDaoImpl  extends BaseDao<DetailsPO> implements PurchaseDao{

	@Override
	public void insert(PurchaseVO purchaseVo) {			
	}
	@Override
	public void update(PurchaseVO purchaseVo) {		
	}
	@Override
	public void delete(int goodId) {
	}
	@Override
	public void deleteByPurchaseCode(String purchaseCode) {		
	}
	@Override
	public List<PurchaseVO> listBy(PurchasePO purchasePO) {		
		return null;
	}
	@Override
	public List<PurchaseVO> listBy1(PurchasePO purchasePO) {		
		return null;
	}

	@Override
	public List<PurchaseVO> listBy2(PurchasePO purchasePO) {		
		return null;
	}
	@Override
	public List<PurchaseVO> listBy3(PurchasePO purchasePO) {		
		return null;
	}
	// �����õ�ӳ��
	@Override
	public List<DetailsPO> mapRow(ResultSet rs) throws Exception {
		List<DetailsPO> list = new ArrayList<>();
		DetailsPO deta=null;
		while(rs.next()){
			deta = new DetailsPO();
			deta.setSku(rs.getString("sku"));
			deta.setGoodName(rs.getString("goodName"));
			deta.setGoodPrice(rs.getInt("goodPrice"));
			deta.setPurchaseSum(rs.getInt("purchaseNumber"));
			deta.setStorageQuantity(rs.getString("storageQuantity"));
			deta.setRemark(rs.getString("remark"));
			deta.setGoodPicture(rs.getString("goodPicture"));
			deta.setSupplierCName(rs.getString("supplierCName"));//������ID
			deta.setWarehouseName(rs.getString("warehouseName"));//�ֿ���
			deta.setPurchaseNumber(rs.getString("purchaseSum"));//��Ʒ�ܽ��
			list.add(deta);
		}
		return list;
	}
	 // �����õķ��� 
		@Override
		public List<DetailsPO> listByXQ(DetailsPO deta, String str) {
			List<Object> params = new ArrayList<Object>();
			String sql="select sku ,goodName,goodPrice,supplierCName,a.purchaseNumber,storageQuantity,goodPicture,remark ,e.warehouseName,a.purchaseSum "
					+ "from caigou_purchase a "
					+ " left join caigou_purchasegood b on a.purchaseId=b.purchaseId  "
					+ " left join caigou_goods c on b.goodId=c.goodId  "
					+ " left join caigou_supplier d on a.supplierId=d.supplierId  "
					+ " left join caigou_warehouse e on a.warehouseId=e.warehouseId where 1=1";
			//�жϴ������Ĳ����ǲ��ǿյ�
			if(str!=null){
				sql=sql+" and purchaseCode=?";
				params.add(str);
			}
			return this.queryForList(sql, params);
		}
		@Override
		public int getCount(PurchasePO purchasePo, String str) {
			// TODO Auto-generated method stub
			return 0;
		}
		@Override
		public String MaxPurchaseCode(PurchasePO purchasePo) {
			// TODO Auto-generated method stub
			return null;
		}
		@Override
		public List<StuEntity> getAllByExcel(String file) throws IOException {
			// TODO Auto-generated method stub
			return null;
		}
		@Override
		public PurchaseVO getPurchaseByPK(int purchaseId) {
			// TODO Auto-generated method stub
			return null;
		}
	
}
