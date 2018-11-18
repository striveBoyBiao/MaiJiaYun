package mjy.caigou.servlet.cgd;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.Integer;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mjy.caigou.dao.impl.PurchaseGoodDaoImpl;
import mjy.caigou.po.PurchasePO;
import mjy.caigou.po.SupplierPO;
import mjy.caigou.service.PurchaseGoodService;
import mjy.caigou.service.PurchaseService;
import mjy.caigou.service.SPService;
import mjy.caigou.service.SupplierService;
import mjy.caigou.service.impl.PurchaseGoodServiceImpl;
import mjy.caigou.service.impl.PurchaseServiceImpl;
import mjy.caigou.service.impl.SPServiceImpl;
import mjy.caigou.service.impl.SupplierServiceImpl;
import mjy.caigou.vo.PurchaseGoodVO;
import mjy.caigou.vo.PurchaseVO;
import mjy.caigou.vo.SupplierVO;
import mjy.login.beans.vo.UserInfoVO;

/**
 * Servlet implementation class XzcgAjax
 */
@WebServlet("/caigou/servlet/XzcgAjax")
public class XzcgAjax extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/xml;charset=utf-8");
		
		//得到采购数量和采购单价
		String uname=request.getParameter("uname");
		String priceId=request.getParameter("priceId");
		//得到添加商品 的参数
//		String goodPicture =request.getParameter("goodPicture");
//		String goodSku =request.getParameter("goodSku");
//		String goodName=request.getParameter("goodName");
//		String goodNum=request.getParameter("goodNum");
//		String goodRepertory=request.getParameter("goodRepertory");
//		String goodPrice=request.getParameter("goodPrice");
//		String priceSum=request.getParameter("priceSum");
//		String beizu=request.getParameter("beizu");
//		String skuTotalQuantity=request.getParameter("skuTotalQuantity");
//		String skuTotalFee=request.getParameter("skuTotalFee");
//		String supplierId=request.getParameter("supplierId");
//		String wareHouseId=request.getParameter("wareHouseId");
////		String remake_1=request.getParameter("remake_1");
//		String remake_2=request.getParameter("remake_2");
//		System.out.println(uname);
//		System.out.println("wareHouseId:"+wareHouseId);
//		System.out.println("supplierId:"+supplierId);
//		System.out.println(skuTotalQuantity);
		PrintWriter out=response.getWriter();
		if(uname!=null&&priceId!=null){
			Double un=Double.parseDouble(uname);
			Double pr=Double.parseDouble(priceId);
			
			out.println("<message>"+(un*pr)+"</message>");
		}
//		PurchaseGoodService pgs=null;
//		PurchaseService ps=new PurchaseServiceImpl();
//		
//		PurchaseGoodVO purchaseGoodVo=null;
//		PurchaseVO purchaseVo=null;
//		PurchasePO purchasePo=null;
//		SPService sps=new SPServiceImpl();
//		
//		int purchaseId=0;
//		UserInfoVO userInfoVo=(UserInfoVO)request.getSession().getAttribute("userInfoVO");
//		int userId=userInfoVo.getBossPO().getUserID();
//		PurchasePO purPo=new PurchasePO();
//		purPo.setUserId(userId);
//		String maxPurchaseCode=ps.MaxPurchaseCode(purPo);
////		System.out.println(maxPurchaseCode);
//		int num=Integer.parseInt(maxPurchaseCode.substring(12))+1;
////		Timestamp ts=new Timestamp(time);
//		Date date=new Date();
//		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//		String time=null;
//		String purchaseCode=null;
//		String a[]=new String[3];
//		
//		
//		int addNum=0;
//		
//		if(goodSku!=null||skuTotalQuantity!=null){
//			
//		
//			time=sdf.format(date);
////			String passTime=pwoEditForm.
////			tt=time;
//			a=time.split(" ")[0].split("-");
//			purchaseCode="CG"+a[0]+a[1]+a[2];
////			for(int i=0;i<3-String.valueOf(addNum).length();i++){
////				purchaseCode=purchaseCode+"0";
////			}
////			int num=1;
////			String numberString = String.format("%04d", num);
////			purchaseCode=purchaseCode+numberString;
//			
//			
//			
//			if(goodSku==null&&skuTotalQuantity!=null){
//				String numberString = String.format("%04d", num);
//				purchaseCode=purchaseCode+numberString;
//				purchaseVo=new PurchaseVO();
//				addNum++;
////				String Time=null;
//				//设置purchaseCode的得到方法
//				
//				
//				purchaseVo.setPurchaseCode(purchaseCode);
////				SupplierPO supplierPO=new SupplierPO();
////				supplierPO.setUserId(userId);
////				SupplierService ss=new SupplierServiceImpl();
////				List<SupplierVO> supplierVo=ss.querySupplier(supplierPO);
//				
//				purchaseVo.setSupplierId(supplierId);
////				System.out.println("wareHouseId::"+Integer.parseInt(wareHouseId));
//				purchaseVo.setWareHouseId(Integer.parseInt(wareHouseId));
//				purchaseVo.setPurchaseSum(Integer.parseInt(skuTotalFee));
//				purchaseVo.setPurchaseNumber(Integer.parseInt(skuTotalQuantity));
//				purchaseVo.setCreatTime(Timestamp.valueOf(time));
////				 Timestamp timestabp=new Timestamp(date.getTime());new Timestamp(System.currentTimeMillis())
//				
//				
//				purchaseVo.setRemark(remake_2);
//				purchaseVo.setUserId(userId);
////				purchaseVo.setSupplierId(supplierId);
////				purchaseVo.setStorageQuantity();
////				purchaseVo.setStorageState();
////				purchaseVo.setPaymentState();
////				purchaseVo.setGoodId();
//				PurchaseService purchaseService=new PurchaseServiceImpl();
//				purchaseService.insert(purchaseVo);
//			}
//			else if(goodSku!=null){
//				String numberString = String.format("%04d", num);
//				purchaseCode=purchaseCode+numberString;
//				purchasePo=new PurchasePO();
//				purchasePo.setUserId(userId);
//				purchasePo.setPurchaseCode(purchaseCode);
//				List<PurchaseVO> list=ps.listBy(purchasePo) ;
//				for(PurchaseVO pv:list){
//					purchaseId=pv.getPurchaseId();
//				}
//				purchaseGoodVo=new PurchaseGoodVO();
//				
//				purchaseGoodVo.setPurchaseId(purchaseId);
//				
//				
//				int goodId=sps.queryBySku(goodSku);
//				purchaseGoodVo.setGoodId(goodId);
//				purchaseGoodVo.setPurchaseNum(goodNum);
//				purchaseGoodVo.setQuantity(0);
//				purchaseGoodVo.setPurchasePrice(Double.parseDouble(goodPrice));
//				purchaseGoodVo.setPurchaseSum(Double.parseDouble(priceSum));
//				purchaseGoodVo.setRemark_1(beizu);
//				purchaseGoodVo.setRemark_2(remake_2);
//				pgs=new PurchaseGoodServiceImpl();
////				pgs.insert(purchaseGoodVo);
////				purchaseGoodVo.setQuantity(quantity);
//				
//			}
//			
//		}
	}
	
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
