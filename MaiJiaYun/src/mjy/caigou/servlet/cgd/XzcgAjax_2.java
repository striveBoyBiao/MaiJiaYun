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
@WebServlet("/caigou/servlet/XzcgAjax_2")
public class XzcgAjax_2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json;charset=utf-8");
		
		//�õ��ɹ������Ͳɹ�����
		
//		
		PrintWriter out=response.getWriter();
		String purchaseInfo = request.getParameter("purchaseInfo");
		String goodInfo = request.getParameter("goodInfo");
		
		JSONObject purchaseInfoJsonObject = JSONObject.fromObject(purchaseInfo);
		JSONArray goodInfoJsonObject = JSONArray.fromObject(goodInfo);

		
		PurchaseGoodService pgs=null;
		PurchaseService ps=new PurchaseServiceImpl();
		
		PurchaseGoodVO purchaseGoodVo=null;
		PurchaseVO purchaseVo=null;
		PurchasePO purchasePo=null;
		SPService sps=new SPServiceImpl();
		
		int purchaseId=0;
		UserInfoVO userInfoVo=(UserInfoVO)request.getSession().getAttribute("userInfoVO");
		int userId=userInfoVo.getBossPO().getUserID();
		int empId=userInfoVo.getUserPO().getUserId();
		PurchasePO purPo=new PurchasePO();
		purPo.setUserId(userId);
		String maxPurchaseCode=ps.MaxPurchaseCode(purPo);
//		System.out.println(maxPurchaseCode);
		int num=Integer.parseInt(maxPurchaseCode.substring(12))+1;
//		Timestamp ts=new Timestamp(time);
		Date date=new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time=null;
		String purchaseCode=null;
		String a[]=new String[3];
		
		
		int addNum=0;
		
		
			
		//��ȡ��ǰʱ��
			time=sdf.format(date);
//			
			a=time.split(" ")[0].split("-");
			//����purchaseCode�������
			purchaseCode="CG"+a[0]+a[1]+a[2];
//			
				String numberString = String.format("%04d", num);
				purchaseCode=purchaseCode+numberString;
				purchaseVo=new PurchaseVO();
				addNum++;
//				String Time=null;
				
				//��ȡ���ݿ��е�ǰ����purchaseId
				List<PurchaseVO> list=ps.listBy(purchasePo) ;
				
				for (PurchaseVO pVo : list) {
					
					purchaseId= pVo.getPurchaseId()+1;
				}
				
				purchaseVo.setPurchaseCode(purchaseCode);
//				SupplierPO supplierPO=new SupplierPO();
//				supplierPO.setUserId(userId);
//				SupplierService ss=new SupplierServiceImpl();
//				List<SupplierVO> supplierVo=ss.querySupplier(supplierPO);
				purchaseVo.setPurchaseId(purchaseId);;
				purchaseVo.setSupplierId(purchaseInfoJsonObject.get("supplierId")+"");
//				System.out.println("wareHouseId::"+Integer.parseInt(wareHouseId));
				purchaseVo.setWareHouseId(Integer.parseInt((purchaseInfoJsonObject.get("wareHouseId")+"")));
				String aa=purchaseInfoJsonObject.get("supplierId")+"";
				purchaseVo.setPurchaseSum(Integer.parseInt((purchaseInfoJsonObject.get("skuTotalFee")+"")));
				purchaseVo.setPurchaseNumber(Integer.parseInt((purchaseInfoJsonObject.get("skuTotalQuantity")+"")));
				purchaseVo.setCreatTime(Timestamp.valueOf(time));
//				 Timestamp timestabp=new Timestamp(date.getTime());new Timestamp(System.currentTimeMillis())
				
//				System.out.println("remake_2:"+purchaseInfoJsonObject.get("remake_2")+"");
				purchaseVo.setRemark(purchaseInfoJsonObject.get("remake_2")+"");
				purchaseVo.setUserId(userId);
//				
//			}
				List<PurchaseGoodVO> array = new ArrayList<PurchaseGoodVO>();
//					
//				String numberString1 = String.format("%04d", num);
//				purchaseCode=purchaseCode+numberString1;
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
	
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
