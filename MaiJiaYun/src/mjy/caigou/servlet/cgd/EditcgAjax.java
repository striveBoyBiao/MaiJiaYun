package mjy.caigou.servlet.cgd;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.Integer;
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
import mjy.kefu.beans.OrderDetailBeanVO;
import mjy.login.beans.vo.UserInfoVO;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * Servlet implementation class XzcgAjax
 */
@WebServlet("/caigou/servlet/EditcgAjax")
public class EditcgAjax extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json;charset=utf-8");
		
		//得到采购数量和采购单价
		
//		
		PrintWriter out=response.getWriter();
		String purchaseInfo = request.getParameter("purchaseInfo");
		String goodInfo = request.getParameter("goodInfo");
		String trs=request.getParameter("trs");
		
		JSONObject purchaseInfoJsonObject = JSONObject.fromObject(purchaseInfo);
		JSONArray goodInfoJsonObject = JSONArray.fromObject(goodInfo);
		JSONObject trsJsonObject=JSONObject.fromObject(trs);
		
		PurchaseGoodService pgs=null;
		PurchaseService ps=new PurchaseServiceImpl();
		
		PurchaseGoodVO purchaseGoodVo=null;
		PurchaseVO purchaseVo=null;
		PurchasePO purchasePo=null;
		SPService sps=new SPServiceImpl();
		
		int purchaseId=0;
		UserInfoVO userInfoVo=(UserInfoVO)request.getSession().getAttribute("userInfoVO");
		int userId=userInfoVo.getBossPO().getUserID();
		PurchasePO purPo=new PurchasePO();
		purPo.setUserId(userId);
		String maxPurchaseCode=ps.MaxPurchaseCode(purPo);
//		System.out.println(maxPurchaseCode);
		
		//点击保存时把数据库中该条采购删除
		purchaseVo=new PurchaseVO();
		purchasePo=new PurchasePO();
		pgs=new PurchaseGoodServiceImpl();
		ps=new PurchaseServiceImpl();
		purchasePo.setPurchaseCode(maxPurchaseCode);
		
//		ps=new PurchaseServiceImpl();
		purchaseVo.setUserId(userId);
		List<PurchaseVO> list1=ps.listBy(purchasePo);
		//遍历list获取purchaseId
		for (PurchaseVO purchase : list1) {
			purchaseId=purchase.getPurchaseId();
		}
		//根据purchaseId删除该行（执行删除键时）
		pgs.delete(purchaseId);
		ps.deleteByPurchaseCode(maxPurchaseCode);
		//purchasePo.setPurchaseCode(null);
		
		
		
		Date date=new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		
		
			if(!(trsJsonObject.get("trs")+"").equals("0")){
				String time=sdf.format(date);
//				
				
//				
//					
//					purchaseVo=new PurchaseVO();
//					
//					purchasePo=new PurchasePO();
////					String Time=null;
//					
//					//获取数据库中当前最大的purchaseId
//					List<PurchaseVO> list=ps.listBy(purchasePo) ;
//					
//					for (PurchaseVO pVo : list) {
//						
//						purchaseId= pVo.getPurchaseId();
//					}
					
					purchaseVo.setPurchaseCode(maxPurchaseCode);
//					SupplierPO supplierPO=new SupplierPO();
//					supplierPO.setUserId(userId);
//					SupplierService ss=new SupplierServiceImpl();
//					List<SupplierVO> supplierVo=ss.querySupplier(supplierPO);
					purchaseVo.setPurchaseId(purchaseId);;
					purchaseVo.setSupplierId(purchaseInfoJsonObject.get("supplierId")+"");
//					System.out.println("wareHouseId::"+Integer.parseInt(wareHouseId));
					purchaseVo.setWareHouseId(Integer.parseInt((purchaseInfoJsonObject.get("wareHouseId")+"")));
					String aa=purchaseInfoJsonObject.get("supplierId")+"";
					purchaseVo.setPurchaseSum(Integer.parseInt((purchaseInfoJsonObject.get("skuTotalFee")+"")));
					purchaseVo.setPurchaseNumber(Integer.parseInt((purchaseInfoJsonObject.get("skuTotalQuantity")+"")));
					purchaseVo.setCreatTime(Timestamp.valueOf(time));
//					 Timestamp timestabp=new Timestamp(date.getTime());new Timestamp(System.currentTimeMillis())
					
					
					purchaseVo.setRemark(purchaseInfoJsonObject.get("remake_2")+"");
					purchaseVo.setUserId(userId);
//					
//				}
					List<PurchaseGoodVO> array = new ArrayList<PurchaseGoodVO>();
//						
//					String numberString1 = String.format("%04d", num);
//					purchaseCode=purchaseCode+numberString1;
					purchasePo=new PurchasePO();
					purchasePo.setUserId(userId);
					
//					
					for (int index = 0; index < goodInfoJsonObject.size(); index++) {
					purchaseGoodVo=new PurchaseGoodVO();
					
					purchaseGoodVo.setPurchaseId(purchaseId);
					
					
					int goodId=sps.queryBySku(((JSONObject)goodInfoJsonObject.get(index)).get("goodSku") + "");
					String vv=((JSONObject)goodInfoJsonObject.get(index)).get("goodSku") + "";
					purchaseGoodVo.setGoodId(goodId);
					purchaseGoodVo.setPurchaseNum(((JSONObject)goodInfoJsonObject.get(index)).get("goodNum") + "");
					purchaseGoodVo.setQuantity(0);
					purchaseGoodVo.setPurchasePrice(Double.parseDouble(((JSONObject)goodInfoJsonObject.get(index)).get("goodPrice") + ""));
					purchaseGoodVo.setPurchaseSum(Double.parseDouble(((JSONObject)goodInfoJsonObject.get(index)).get("priceSum") + ""));
					purchaseGoodVo.setRemark_1(((JSONObject)goodInfoJsonObject.get(index)).get("beizu") + "");
//					
					
					array.add(purchaseGoodVo);
				
			}
					
					try {
						boolean result = ps.purchaseInsert(purchaseVo, array);

						JSONArray jsonArray = JSONArray.fromObject(result);
						String jsonStr = jsonArray.toString();

						out.println(jsonStr);
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
			}
			
			JSONArray jsonArray = JSONArray.fromObject(true);
			String jsonStr = jsonArray.toString();

			out.println(jsonStr);
	}
	
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
