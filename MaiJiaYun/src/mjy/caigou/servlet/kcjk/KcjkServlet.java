package mjy.caigou.servlet.kcjk;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mjy.caigou.dao.GoodsDao;
import mjy.caigou.dao.PurchaseGoodDao;
import mjy.caigou.dao.WarehouseDao;
import mjy.caigou.dao.impl.GoodsDaoImpl;
import mjy.caigou.dao.impl.PurchaseGoodDaoImpl;
import mjy.caigou.dao.impl.WarehouseDaoImpl;
import mjy.caigou.po.PageInfo;
import mjy.caigou.po.PurchaseGoodPO;
import mjy.caigou.po.PurchasePO;
import mjy.caigou.service.PurchaseGoodService;
import mjy.caigou.service.PurchaseService;
import mjy.caigou.service.impl.PurchaseGoodServiceImpl;
import mjy.caigou.service.impl.PurchaseServiceImpl;
import mjy.caigou.vo.GoodsVO;
import mjy.caigou.vo.PurchaseGoodVO;
import mjy.caigou.vo.PurchaseVO;
import mjy.caiwu.kucunchengben.util.DbUtil;
import mjy.caiwu.kucunchengben.vo.kuguan_goodlog;

import mjy.login.beans.vo.UserInfoVO;

/**
 * Servlet implementation class KcjkServlet
 */
@WebServlet("/caigou/servlet/KcjkServlet")
public class KcjkServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		UserInfoVO userInfoVo = (UserInfoVO) request.getSession().getAttribute("userInfoVO");
		PurchasePO purchasePo = new PurchasePO();
		PurchaseVO purchasVo = new PurchaseVO();
		PurchaseService purchaseService = new PurchaseServiceImpl();
		PurchaseGoodService purchaseGooodService = new PurchaseGoodServiceImpl();
		PurchaseGoodDao purchaseGoodDao = new PurchaseGoodDaoImpl();
		GoodsDao goodsDao = new GoodsDaoImpl();
		PurchaseGoodPO purchaseGoodPo = new PurchaseGoodPO();
		List<GoodsVO> list3 = new ArrayList<GoodsVO>();
		PurchaseGoodVO purchaseGoodVo = null;
		GoodsVO goodsVo = null;
		Integer purchaseId = 0;
		Integer goodId = 0;
		Integer warehouseId=0;
		// ��ȡuserID
		Integer userID = userInfoVo.getBossPO().getUserID();
		purchasePo.setUserId(userID);
		purchasePo.setState("3");
		purchasePo.setStorageState("已入库");
		
		String pageNum = request.getParameter("pageNo") == null ? "1" : request.getParameter("pageNo");

		String pSize = request.getParameter("pSize") == null ? "10" : request.getParameter("pSize");// 10
		Integer pageSize = Integer.parseInt(pSize);

		PageInfo<PurchaseVO> page = new PageInfo<>(pageNum);
		page.setPageSize(pageSize);
		purchasePo.setRowStart(page.getPageBegin());
		PageInfo<PurchaseVO> pageInfo = purchaseService.listByPage(purchasePo, page);
		// 2ִ��ҵ��ģ��
		WarehouseDao warehouseDao = new WarehouseDaoImpl();
		String warehouseName=null;
		List list4 =new ArrayList<>();
		List list5 = new ArrayList<>();
		List<PurchaseVO> list1 = purchaseService.listBy3(purchasePo);
		for (PurchaseVO purchaseVO : list1) {
			System.out.println("purchaseVO"+purchaseVO);
		}
		
		
		for (PurchaseVO purchaseVO : list1) {
			purchaseId = purchaseVO.getPurchaseId();
			warehouseId =purchaseVO.getWareHouseId();
			//System.out.println("warehouseId"+warehouseId);
			
			warehouseName=warehouseDao.queryNameById(warehouseId);
			//System.out.println("warehouseName"+warehouseName);
			list4.add(warehouseName);
			System.out.println("list4"+list4.get(0));
			purchaseGoodPo.setPurchaseId(purchaseId);
			Integer p = purchaseGoodPo.getPurchaseId();

			List<PurchaseGoodVO> purchaseGoods = purchaseGoodDao.listBy(purchaseGoodPo);
			for (PurchaseGoodVO purchaseGoodVO : purchaseGoods) {
				goodId = purchaseGoodVO.getGoodId();
				purchaseGoodPo.setGoodId(goodId);
				goodsVo = goodsDao.queryGoodInfoById(goodId);
				
				list3.add(goodsVo);
				//System.out.println("list3"+list3.size());
			
			}
			list5.add(list3);
			System.out.println("list5"+list5.size());
		}
		 
		

		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("list5", list5);
		request.setAttribute("list4", list4);
		request.setAttribute("list3",list3);
		request.getRequestDispatcher("/CaiGou/jsp/kcjk/kcjk.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
