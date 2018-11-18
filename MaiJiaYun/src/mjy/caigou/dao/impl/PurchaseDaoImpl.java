package mjy.caigou.dao.impl;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;


import mjy.caigou.dao.BaseDao;
import mjy.caigou.dao.PurchaseDao;
import mjy.caigou.po.DetailsPO;
import mjy.caigou.po.GoodsPO;
import mjy.caigou.po.PageInfo;
import mjy.caigou.po.PurchasePO;
import mjy.caigou.po.SupplierPO;
import mjy.caigou.vo.GoodsVO;
import mjy.caigou.vo.PurchaseVO;
import mjy.caigou.vo.StuEntity;
import mjy.caigou.vo.SupplierVO;
import mjy.caigou.vo.WarehouseVO;


public class PurchaseDaoImpl extends BaseDao<PurchaseVO> implements PurchaseDao {

	@Override
	public void insert(PurchaseVO purchase) {
		String sql="insert into caigou_purchase (purchaseId,purchaseCode,supplierId,wareHouseId,purchaseSum,purchaseNumber,creatTime,remark,userId) value(?,?,?,?,?,?,?,?,?)";
		List<Object> params = new ArrayList<Object>();
		params.add(purchase.getPurchaseId());
		params.add(purchase.getPurchaseCode());
		params.add(purchase.getSupplierId());
		params.add(purchase.getWareHouseId());
		params.add(purchase.getPurchaseSum());
		params.add(purchase.getPurchaseNumber());
		params.add(purchase.getCreatTime());
		params.add(purchase.getRemark());
		params.add(purchase.getUserId());
		
		this.SaveOrUpdate(sql, params);

	}

	@Override
	public void update(PurchaseVO purchase) {
		String sql = "update caigou_purchase set state=? where purchaseCode=?";
		List<Object> params = new ArrayList<Object>();
		params.add(purchase.getState());
		params.add(purchase.getPurchaseCode());

		this.SaveOrUpdate(sql, params);

	}

	@Override
	public void delete(int goodId) {

		String sql = "delete from caigou_purchase where goodId=?";
		List<Object> params = new ArrayList<Object>();
		params.add(goodId);

		this.SaveOrUpdate(sql, params);
	}

	@Override
	public void deleteByPurchaseCode(String purchaseCode) {
		String sql = "delete from caigou_purchase where purchaseCode=?";
		List<Object> params = new ArrayList<Object>();
		params.add(purchaseCode);

		this.SaveOrUpdate(sql, params);

	}

	@Override
	public List<PurchaseVO> listBy(PurchasePO purchasePo) {

		List<Object> params=new ArrayList<Object>();
		
		//���ݲ�ѯ����д��Ҫִ��sql���
//		String sql="select a.purchaseId,purchaseCode,a.supplierId,storageState,a.wareHouseId,purchaseSum,purchaseNumber,creatTime,a.remark,operation,a.userId,storageQuantity,storageState,paymentState,state,wareHouseName,userType,supplierCName from caigou_purchase a left join caigou_supplier b on a.supplierId=b.supplierId left join common_user c on a.userId=c.userId left join caigou_warehouse d on a.wareHouseId=d.wareHouseId  where 1=1";
////		String sql="select purchaseId from caigou_purchase where 1=1";
//		if(purchasePo!=null&&purchasePo.getUserId()!=null){
////			System.out.println("userId:"+purchasePo.getUserId());
//			
//			sql=sql+" and a.userId= ?";
//			params.add(purchasePo.getUserId());
//			
//		}
//		if(purchasePo!=null&&purchasePo.getPurchaseCode()!=null){
//			sql=sql+" and purchaseCode = ?";
////			System.out.println(purchasePo.getPurchaseCode());
//			params.add(purchasePo.getPurchaseCode());
//			
//		}
		
		String sql="select purchaseCode,a.supplierId,storageState,a.wareHouseId,purchaseSum,purchaseNumber,creatTime,a.remark,operation,a.userId,storageQuantity,storageState,paymentState,state,wareHouseName,userType,supplierCName,max(purchaseId) as purchaseId from caigou_purchase a left join caigou_supplier b on a.supplierId=b.supplierId left join common_user c on a.userId=c.userId left join caigou_warehouse d on a.wareHouseId=d.wareHouseId where 1=1";

		return this.queryForList(sql,params);
		

	}

	@Override
	public List<PurchaseVO> mapRow(ResultSet rs) throws Exception {
		List<PurchaseVO> list = new ArrayList<>();
		PurchaseVO purchase = null;
		SupplierVO supplierVo = null;
		while (rs.next()) {
			purchase = new PurchaseVO();
			supplierVo = new SupplierVO();
			purchase.setPurchaseId(rs.getInt("purchaseId"));
			// System.out.println(rs.getString("purchaseCode"));
			purchase.setPurchaseCode(rs.getString("purchaseCode"));
			purchase.setSupplierId(rs.getString("supplierId"));
			purchase.setWareHouseId(rs.getInt("wareHouseId"));
			purchase.setPurchaseSum(rs.getInt("purchaseSum"));
			purchase.setPurchaseNumber(rs.getInt("purchaseNumber"));
			purchase.setCreatTime(rs.getTimestamp("creatTime"));

			purchase.setRemark(rs.getString("remark"));
			purchase.setOperation(rs.getString("operation"));
			// purchase.setUserId(rs.getInt("userId"));
			purchase.setStorageQuantity(rs.getInt("storageQuantity"));
			purchase.setStorageState(rs.getString("storageState"));
			purchase.setPaymentState(rs.getString("paymentState"));
			purchase.setState(rs.getString("state"));
			purchase.setWareHouseName(rs.getString("wareHouseName"));
			purchase.setUserType(rs.getString("userType"));
			purchase.setSupplierCName(rs.getString("supplierCName"));



			list.add(purchase);
		}

		return list;
	}

	@Override
	public List<PurchaseVO> listBy1(PurchasePO purchasePo) {

		return listByCom(purchasePo, "1");
	}

	@Override
	public List<PurchaseVO> listBy2(PurchasePO purchasePo) {

		return listByCom(purchasePo, "2");
	}
	
	
	@Override
	public List<PurchaseVO> listBy3(PurchasePO purchasePo) {
		return listByCom(purchasePo, "3");
	}

	public List<PurchaseVO> listByCom(PurchasePO purchasePo,String str) {

		List<Object> params=new ArrayList<Object>();
		
		//���ݲ�ѯ����д��Ҫִ��sql���
		String sql="select a.purchaseId,purchaseCode,a.supplierId,storageState,a.wareHouseId,purchaseSum,purchaseNumber,creatTime,a.remark,operation,a.userId,storageQuantity,storageState,paymentState,state,wareHouseName,userType,supplierCName "
				+ "from caigou_purchase a "
				+ "left join caigou_supplier b on a.supplierId=b.supplierId "
				+ "left join common_user c on a.userId=c.userId "
				+ "left join caigou_warehouse d on a.wareHouseId=d.wareHouseId  "
				+ "where 1=1";
			
		if(purchasePo!=null&&purchasePo.getUserId()!=null){
			sql=sql+" and a.userId= ?";
			params.add(purchasePo.getUserId());
			
		}
		if(purchasePo!=null&&purchasePo.getState()!=null&&purchasePo.getState().equals(str)){
			sql=sql+" and state = ?";
			System.out.println(purchasePo.getState());
			params.add(purchasePo.getState());

		}

		if(purchasePo!=null&&purchasePo.getPurchaseCode()!=null&&!purchasePo.getPurchaseCode().equals("")){
			sql=sql+" and purchaseCode like ?";
			params.add("%"+purchasePo.getPurchaseCode()+"%");
			
		}

		if(purchasePo!=null&&purchasePo.getStorageState()!=null&&!purchasePo.getStorageState().equals("")){
			sql=sql+" and storageState = ?";
		
			params.add(purchasePo.getStorageState());

		}
		
//		System.out.println("rowStart="+purchasePo.getRowStart());
	
//		System.out.println("pageSize="+ PageInfo.pageSize);
		if (purchasePo != null && purchasePo.getRowStart() != null) {			
						
			sql = sql + " LIMIT " + purchasePo.getRowStart() + "," + PageInfo.pageSize;
		}	


		return this.queryForList(sql,params);
	
	}

	

	@Override
	public int getCount(PurchasePO purchasePo,String str) {
		// ���sql���ִ�еĲ���
		List<Object> params = new ArrayList<Object>();

		String sql = " select count(*) from caigou_purchase where 1=1";
		
		if (purchasePo != null && purchasePo.getUserId() != null) {
			// System.out.println("userId:"+purchasePo.getUserId());

			sql = sql + " and userId= ?";
			params.add(purchasePo.getUserId());

		}
		if (purchasePo != null && purchasePo.getState() != null && purchasePo.getState().equals(str)) {
			sql = sql + " and state = ?";
		//	System.out.println("state="+purchasePo.getState());
			params.add(purchasePo.getState());
		}
		
		if (purchasePo != null && purchasePo.getPurchaseCode() != null && !purchasePo.getPurchaseCode().equals("")) {
			sql = sql + " and purchaseCode like ?";
			params.add("%" + purchasePo.getPurchaseCode() + "%");

		}
		if(purchasePo!=null&&purchasePo.getStorageState()!=null&&!purchasePo.getStorageState().equals("")){
			sql=sql+" and storageState = ?";
		
			params.add(purchasePo.getStorageState());

		}

		return super.getCount(sql, params);
	}

	@Override
	public String MaxPurchaseCode(PurchasePO purchasePo) {
		String sql="select a.purchaseId,a.supplierId,storageState,a.wareHouseId,purchaseSum,purchaseNumber,creatTime,a.remark,operation,a.userId,storageQuantity,storageState,paymentState,state,wareHouseName,userType,supplierCName,max(purchaseCode) as purchaseCode from caigou_purchase a left join caigou_supplier b on a.supplierId=b.supplierId left join common_user c on a.userId=c.userId left join caigou_warehouse d on a.wareHouseId=d.wareHouseId where a.userId=?";
		List<Object> params=new ArrayList<>();
		params.add(purchasePo.getUserId());
		List<PurchaseVO> list=this.queryForList(sql,params);
		
		for (PurchaseVO purchaseVo : list) {
			return purchaseVo.getPurchaseCode();
		}
		return null;
	}


	
	
	
	//�����ķ���
//	public List<PurchaseVO> listByDC(PurchasePO purchasePo ,String str){
//		
//		String sql="select a.purchaseId,purchaseCode,a.supplierId,storageState,a.wareHouseId,purchaseSum,purchaseNumber,creatTime,a.remark,operation,a.userId,storageQuantity,storageState,paymentState,state,wareHouseName,userType,supplierCName from caigou_purchase a left "
//				+ "join caigou_supplier b on a.supplierId=b.supplierId left join common_user c on a.userId=c.userId left "
//				+ "join caigou_warehouse d on a.wareHouseId=d.wareHouseId  where 1=1";
//		List<Object> params = new ArrayList<Object>();
//		// �ж�
//		if (purchasePo != null && purchasePo.getPurchaseCode() != null && !purchasePo.getPurchaseCode().equals("")) {
//			sql = sql + " and purchaseCode = ?";
//			params.add( purchasePo.getPurchaseCode());
//		}
//		return this.queryForList(sql, params);
//	}

	// @Override
	// public List<SupplierVO> listBySupplier(SupplierPO supplierPo) {
	// List<Object> params=new ArrayList<Object>();
	// String sql="select * from caigou_supplier ";
	//// if(supplierPo!=null&&!supplierPo.getSupplierCName().equals("")){
	//// sql=sql+" and state = ?";
	//// params.add(supplierPo.getSupplierCName());
	////
	//// }
	// return this.q;
	// }
	@Override
	public  List<StuEntity> getAllByExcel(String file) throws IOException{
        List<StuEntity> list=new ArrayList<StuEntity>();
		FileInputStream excelFileInputStream = new FileInputStream(file);
		StuEntity stuEntidty=null;
		HSSFWorkbook workbook = new HSSFWorkbook(excelFileInputStream);
		excelFileInputStream.close();
		//getSheetAt(0) ָ�������������ȡ��Ӧ���
		HSSFSheet sheet = workbook.getSheetAt(0);
		for (int rowIndex = 0; rowIndex <= sheet.getLastRowNum(); rowIndex++) {
			// XSSFRow ����һ������
			HSSFRow row = sheet.getRow(rowIndex);
			if (row == null) {
			continue;
			}
			if(rowIndex == 0){
				stuEntidty=new StuEntity();
				HSSFCell supplierCell = row.getCell(1);
//				System.out.println(supplierCell.getNumericCellValue());
				stuEntidty.setSupplierId((int)supplierCell.getNumericCellValue());
				HSSFCell wareHouseCell = row.getCell(3);
				stuEntidty.setWareHouseId((int)wareHouseCell.getNumericCellValue());
				list.add(stuEntidty);
				
			}else if(rowIndex == 1){
				HSSFCell remark_1Cell = row.getCell(1);
				stuEntidty=new StuEntity();
				stuEntidty.setRemark_1(remark_1Cell.getStringCellValue());
				list.add(stuEntidty);
				
			}else if(rowIndex == 2){
				
				continue;
			}
			else{
				stuEntidty=new StuEntity();
				HSSFCell skuCell = row.getCell(0); // SKU����
				stuEntidty.setSku(skuCell.getStringCellValue());
			
				HSSFCell purchaseNumCell = row.getCell(1); // �ɹ�����
				System.out.println(purchaseNumCell.getNumericCellValue());
				stuEntidty.setPurchaseNumber((int)purchaseNumCell.getNumericCellValue());
				HSSFCell purchasePriceCell = row.getCell(2); // �ɹ���
				stuEntidty.setPurchasePrice(purchasePriceCell.getNumericCellValue());
				HSSFCell remark_2Cell = row.getCell(3); // ��ע
				stuEntidty.setRemark_2(remark_2Cell.getStringCellValue());
				list.add(stuEntidty);
			}
			
		}
		return list;
	}
//        try {
//            Workbook rwb=Workbook.getWorkbook(new File(file));
//            Sheet rs=rwb.getSheet("Test Shee 1");//����rwb.getSheet(0)
//            int clos=rs.get;//�õ����е���
//            int rows=rs.getRows();//�õ����е���
//            
//            System.out.println(clos+" rows:"+rows);
//            for (int i = 1; i < rows; i++) {
//                for (int j = 0; j < clos; j++) {
//                    //��һ�����������ڶ���������
//                    String id=rs.getCell(j++, i).getContents();//Ĭ������߱��Ҳ��һ�� ���������j++
//                    String name=rs.getCell(j++, i).getContents();
//                    String sex=rs.getCell(j++, i).getContents();
//                    String num=rs.getCell(j++, i).getContents();
//                    
//                    System.out.println("id:"+id+" name:"+name+" sex:"+sex+" num:"+num);
////                    list.add(new StuEntity(Integer.parseInt(id), name, sex, Integer.parseInt(num)));
//                }
//            }
//        } catch (Exception e) {
//            // TODO Auto-generated catch block
//            e.printStackTrace();
//        } 
//        return list;

	@Override
	public List<DetailsPO> listByXQ(DetailsPO deta, String str) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public PurchaseVO getPurchaseByPK(int purchaseId) {
		List<Object> params=new ArrayList<Object>();
		
		//���ݲ�ѯ����д��Ҫִ��sql���
		String sql="select a.purchaseId,purchaseCode,a.supplierId,storageState,a.wareHouseId,purchaseSum,purchaseNumber,creatTime,a.remark,operation,a.userId,storageQuantity,storageState,paymentState,state,wareHouseName,userType,supplierCName "
				+ "from caigou_purchase a "
				+ "left join caigou_supplier b on a.supplierId=b.supplierId "
				+ "left join common_user c on a.userId=c.userId "
				+ "left join caigou_warehouse d on a.wareHouseId=d.wareHouseId  "
				+ "where a.purchaseId=?";
		params.add(purchaseId);
		List<PurchaseVO> list=this.queryForList(sql, params);
		for (PurchaseVO purchaseVO : list) {
			return purchaseVO;
		}
		return null;
	}
        
//    }

}
