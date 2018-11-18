package mjy.caigou.servlet.cgd;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mjy.caigou.po.GoodsPO;
import mjy.caigou.po.PurchasePO;
import mjy.caigou.po.SupplierPO;
import mjy.caigou.po.WarehousePO;
import mjy.caigou.service.PurchaseGoodService;
import mjy.caigou.service.PurchaseService;
import mjy.caigou.service.SPService;
import mjy.caigou.service.SupplierService;
import mjy.caigou.service.WarehouseService;
import mjy.caigou.service.impl.PurchaseGoodServiceImpl;
import mjy.caigou.service.impl.PurchaseServiceImpl;
import mjy.caigou.service.impl.SPServiceImpl;
import mjy.caigou.service.impl.SupplierServiceImpl;
import mjy.caigou.service.impl.WarehouseServiceImpl;
import mjy.caigou.vo.PurchaseGoodVO;
import mjy.caigou.vo.PurchaseVO;
import mjy.caigou.vo.StuEntity;
import mjy.caigou.vo.SupplierVO;
import mjy.login.beans.vo.UserInfoVO;



/**
 * Servlet implementation class Dcg_DrServlet
 */
@WebServlet("/caigou/servlet/Dcg_DrServlet")
public class Dcg_DrServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String filePath=request.getParameter("pimage");
		//成功添加时 所得到的参数
		String addSuccess=request.getParameter("addSuccess");
		System.out.println("filePath:"+filePath);
		
		PurchaseService ps=new PurchaseServiceImpl();
//		List<StuEntity> stuEntity=ps.getAllByExcel(filePath);
		UserInfoVO userInfoVo=(UserInfoVO)request.getSession().getAttribute("userInfoVO");
		int bossId=userInfoVo.getBossPO().getUserID();
		int supplierId=0;
		String supplierName=null;
		int wareHouseId=0;
		String wareHouseName=null;
		String beizu=null;
		PurchasePO purchasePo=new PurchasePO();
		PurchaseGoodVO purchaseGoodVo=new PurchaseGoodVO();
		PurchaseService purchaseService=null;
		PurchaseGoodService purchaseGoodService=null;
		String purchaseCode=null;
		int num=0;
		//得到PurchaseGoodVO采购的集合(为插入PurchaseGood表)
		List<PurchaseGoodVO> purchaseGoodVO=new ArrayList<>();
		//得到stuEntity集合中的商品信息
		List<StuEntity> stuEntity_2=new ArrayList<>();
		//设置StuEntity信息（在jsp中显现）
		StuEntity se=new StuEntity();
		
		//采购总量
		int purchaseNumber=0;
		//采购总额
		int purchaseSum=0;
		//采购量集合
		List<Integer> purchaseNums=new ArrayList<>();
		//采购单价集合
		List<Integer> purchaseSums=new ArrayList<>();
		//得到插入puchase表后的purchaseId
		int purchaseId=0;
	
			List<StuEntity> stuEntity=ps.getAllByExcel(filePath);
			for(int i=0;i<stuEntity.size();i++){
				if(i==0){
					//得到供应商Id，仓库id
					supplierId=stuEntity.get(i).getSupplierId();
					SupplierPO supplierPo=new SupplierPO();
					supplierPo.setUserId(bossId);
					supplierPo.setSupplierId(supplierId);
					
					wareHouseId=stuEntity.get(i).getWareHouseId();
					WarehousePO warehousePo=new WarehousePO();
					
					warehousePo.setWareHouseId(wareHouseId);
					SupplierService supplierService=new SupplierServiceImpl();
					WarehouseService warehouseService=new WarehouseServiceImpl();
					List<SupplierVO> supplierVO=supplierService.querySupplier(supplierPo);
					for (SupplierVO supplierVO2 : supplierVO) {
						supplierName=supplierVO2.getSupplierCName();
					}
					wareHouseName=warehouseService.queryNameById(wareHouseId);
					
				}else if(i==1){
					purchaseService=new PurchaseServiceImpl();
					purchasePo.setUserId(bossId);
					purchaseCode=purchaseService.MaxPurchaseCode(purchasePo);
					num=Integer.parseInt(purchaseCode.substring(10))+1;
					purchaseCode=purchaseCode.substring(0,10)+String.format("%04d", num);
					beizu=stuEntity.get(i).getRemark_1();
					
				}
				else{
					SPService sps=new SPServiceImpl();
					purchaseGoodVo=new PurchaseGoodVO();
					List<GoodsPO> listGoodsPO=sps.getAllGoods(bossId);
					purchaseService=new PurchaseServiceImpl();
					for(int j=0;j<listGoodsPO.size();j++){
//						System.out.println("sku:"+stuEntity.get(i).getSku());
//						System.out.println(listGoodsPO.get(j).getSku());
						if(stuEntity.get(i).getSku()!=null&&stuEntity.get(i).getSku().equals(listGoodsPO.get(j).getSku())){
							se.setSku(stuEntity.get(i).getSku());
							se.setPurchaseNumber(stuEntity.get(i).getPurchaseNumber());
							se.setPurchasePrice(stuEntity.get(i).getPurchasePrice());
							se.setRemark_2(stuEntity.get(i).getRemark_2());
							stuEntity_2.add(se);
							purchaseGoodVo.setGoodId(listGoodsPO.get(i).getGoodId());
							purchaseGoodVo.setPurchaseNum(String.valueOf(stuEntity.get(i).getPurchaseNumber()));
							purchaseGoodVo.setPurchasePrice(stuEntity.get(i).getPurchasePrice());
							purchaseGoodVo.setRemark_1(stuEntity.get(i).getRemark_2());
							purchaseGoodVO.add(purchaseGoodVo);
							purchaseSums.add((int)stuEntity.get(i).getPurchasePrice());
							purchaseNums.add(stuEntity.get(i).getPurchaseNumber());
							break;
						}
						
					}
					
					
				}
			}
			if(addSuccess==null){
				request.setAttribute("supplierName", supplierName);
				request.setAttribute("wareHouseName", wareHouseName);
				request.setAttribute("beizu", beizu);
				request.setAttribute("stuEntity_2", stuEntity_2);
				
				request.getRequestDispatcher("/CaiGou/jsp/cgd/dcg_dr.jsp").forward(request, response);
			}
			
	
		
		
		
		if(addSuccess!=null&&addSuccess.equals("add")){
			purchaseService=new PurchaseServiceImpl();
			PurchaseVO purchaseVo=new PurchaseVO();
			purchaseVo.setUserId(bossId);
			purchaseVo.setPurchaseCode(purchaseCode);
			purchaseVo.setSupplierId(String.valueOf(supplierId));
			purchaseVo.setWareHouseId(wareHouseId);
			for(int i=0;i<purchaseNums.size();i++){
				purchaseNumber=purchaseNumber+purchaseNums.get(i);
			}
			purchaseVo.setPurchaseNumber(purchaseNumber);
			for(int i=0;i<purchaseSums.size();i++){
//				purchaseSums=purchaseSums+Integer.parseInt(String.valueOf(purchaseSums.get(i)));
				purchaseSum=purchaseSum+purchaseSums.get(i)*purchaseNums.get(i);
			}
			purchaseVo.setPurchaseSum(purchaseSum);
			purchaseVo.setRemark(beizu);
			Date date=new Date();
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String time=sdf.format(date);
			purchaseVo.setCreatTime(Timestamp.valueOf(time));
			purchaseService.insert(purchaseVo);
			
			purchaseGoodVo=new PurchaseGoodVO();
			purchaseGoodService=new PurchaseGoodServiceImpl();
			for(PurchaseGoodVO purchaseGoodVO1:purchaseGoodVO){
				//通话bossId，purchaseCode查到purchaseId
				purchaseService=new PurchaseServiceImpl();
				PurchasePO purchase=new PurchasePO();
				purchase.setUserId(bossId);
				purchase.setPurchaseCode(purchaseCode);
				List<PurchaseVO> purchaseVoList=new ArrayList<>();
				purchaseVoList=purchaseService.listBy1(purchase);
				for (PurchaseVO purchaseVO2 : purchaseVoList) {
					purchaseId=purchaseVO2.getPurchaseId();
				}
				//设置purchaseGoodVo
				
				purchaseGoodVo.setGoodId(purchaseGoodVO1.getGoodId());
				purchaseGoodVo.setPurchaseId(purchaseId);
				purchaseGoodVo.setPurchaseNum("0");
				purchaseGoodVo.setPurchasePrice(purchaseGoodVO1.getPurchasePrice());
				purchaseGoodVo.setRemark_1(purchaseGoodVO1.getRemark_1());
				purchaseGoodService.insert1(purchaseGoodVo);
			}
			response.sendRedirect("/MaiJiaYun/caigou/servlet/DcgServlet");
//			request.getRequestDispatcher("/CaiGou/jsp/cgd/DcgServlet").forward(request, response);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
