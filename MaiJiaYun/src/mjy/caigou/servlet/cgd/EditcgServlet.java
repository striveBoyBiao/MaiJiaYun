package mjy.caigou.servlet.cgd;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mjy.caigou.po.GoodsPO;
import mjy.caigou.po.PurchaseGoodPO;
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
import mjy.caigou.vo.GoodsVO;
import mjy.caigou.vo.PurchaseGoodVO;
import mjy.caigou.vo.PurchaseVO;
import mjy.caigou.vo.SupplierVO;
import mjy.caigou.vo.WarehouseVO;
import mjy.login.beans.vo.UserInfoVO;


/**
 * Servlet implementation class EditcgServlet
 */
@WebServlet("/caigou/servlet/EditcgServlet")
public class EditcgServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String purchase=request.getParameter("purchaseId");
		UserInfoVO userInfoVo=(UserInfoVO)request.getSession().getAttribute("userInfoVO");
		int bossId=userInfoVo.getBossPO().getUserID();
		int purchaseId=Integer.parseInt(purchase);
//		int goodId=0;
//		String supplierCName=null;
//		String supplierId=null;
//		String wareHouseName=null;
//		int wareHouseId=0;
//		List<Object> list1=new ArrayList<>();
		
//		//设置PurchasePO字段
//		PurchasePO purchasePo=new PurchasePO();
//		purchasePo.setUserId(bossId);
//		purchasePo.setPurchaseCode(purchaseCode);
//		purchasePo.setState("1");
//		//调用PurchaseService中listBy1方法查purchaseId
//		
//		PurchaseService purchaseService=new PurchaseServiceImpl();
//		List<PurchaseVO> PurchaseVo=purchaseService.listBy1(purchasePo);
//		for (PurchaseVO purchaseVO2 : PurchaseVo) {
//			purchaseId=purchaseVO2.getPurchaseId();
//			supplierCName=purchaseVO2.getSupplierCName();
//			supplierId=purchaseVO2.getSupplierId();
//			wareHouseName=purchaseVO2.getWareHouseName();
//			wareHouseId=purchaseVO2.getWareHouseId();
//			
//		}
//		
//		//调用PurchaseGoodService得到goodId
//		SPService sPService=null;
//		PurchaseGoodService purchaseGoodService=new PurchaseGoodServiceImpl();
//		PurchaseGoodPO purchaseGoodPo=new PurchaseGoodPO();
//		purchaseGoodPo.setPurchaseId(purchaseId);
//		List<PurchaseGoodVO> purchaseGoodVo=purchaseGoodService.listBy(purchaseGoodPo);
//		for (PurchaseGoodVO purchaseGoodVO2 : purchaseGoodVo) {
//			goodId=purchaseGoodVO2.getGoodId();
//			//通过goodId到good表中查找商品信息
//			sPService=new SPServiceImpl();
//			List<GoodsVO> goodsPo=sPService.listByGoodId(goodId);
//	
//			list1.add(goodsPo);
//		}
		SPService sPService=null;
		PurchaseService purchaseService=new PurchaseServiceImpl();
		PurchaseVO PurchaseVo=purchaseService.getPurchaseByPK(purchaseId);
		
		//通过bossId到good表中查找商品信息
		sPService=new SPServiceImpl();
		List<GoodsPO> goodsPo=sPService.getAllGoods(bossId);
		
		//得到该用户的所有供应商信息
		SupplierPO supplierPo=new SupplierPO();
		supplierPo.setUserId(bossId);
		SupplierService supplierService=new SupplierServiceImpl();
		List<SupplierVO> listSuplierVo=supplierService.querySupplier(supplierPo);
		
		//得到该用户的所有仓库信息
		WarehouseService warehouseService=new WarehouseServiceImpl();
		List<WarehouseVO> listWarehouseVO=warehouseService.getWarehouseByUserId(bossId);
		request.setAttribute("PurchaseVo", PurchaseVo);
		request.setAttribute("listSuplierVo", listSuplierVo);
		request.setAttribute("listWarehouseVO", listWarehouseVO);
//		
//		request.setAttribute("supplierCName", PurchaseVo.getSupplierCName());
//		request.setAttribute("supplierId", PurchaseVo.getSupplierId());
//		
//		request.setAttribute("wareHouseName", PurchaseVo.getWareHouseName());
//		request.setAttribute("wareHouseId", PurchaseVo.getWareHouseId());
		
//		request.setAttribute("purchaseGoodVo", PurchaseVo.getPurchaseGoodsVO());
		request.setAttribute("goodsPo", goodsPo);
		
		request.setAttribute("PurchaseVo", PurchaseVo);
//		request.setAttribute("list1", list1);
//		request.setAttribute("list2", list1.size());
		request.getRequestDispatcher("/CaiGou/jsp/cgd/editcg.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
