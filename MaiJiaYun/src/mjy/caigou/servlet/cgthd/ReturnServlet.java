package mjy.caigou.servlet.cgthd;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mjy.caigou.beans.PurchaseInfo;
import mjy.caigou.beans.ReturnInfo;
import mjy.caigou.dao.GoodsDao;
import mjy.caigou.dao.ReturnGoodsDao;
import mjy.caigou.dao.impl.GoodsDaoImpl;
import mjy.caigou.dao.impl.ReturnGoodsDaoImpl;
import mjy.caigou.po.PurchaseGoodPO;
import mjy.caigou.po.PurchasePO;
import mjy.caigou.po.ReturnGoodsPO;
import mjy.caigou.po.ReturnPO;
import mjy.caigou.service.PurchaseGoodService;
import mjy.caigou.service.PurchaseService;
import mjy.caigou.service.ReturnService;
import mjy.caigou.service.WarehouseService;
import mjy.caigou.service.impl.PurchaseGoodServiceImpl;
import mjy.caigou.service.impl.PurchaseServiceImpl;
import mjy.caigou.service.impl.ReturnServiceImpl;
import mjy.caigou.service.impl.WarehouseServiceImpl;
import mjy.caigou.vo.GoodsVO;
import mjy.caigou.vo.PurchaseGoodVO;
import mjy.caigou.vo.PurchaseVO;
import mjy.caigou.vo.ReturnGoodsVO;
import mjy.caigou.vo.ReturnVO;
import mjy.caigou.vo.WarehouseVO;
import mjy.caigou.beans.gys.PageInfo;
import mjy.common.util.other.CodeGenerate;
import mjy.login.beans.po.UserPO;
import mjy.login.beans.vo.UserInfoVO;
import net.sf.json.JSONArray;

/**
 * Servlet implementation class ReturnServlet
 */
@WebServlet("/servlet/caigou/ReturnServlet")
public class ReturnServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ReturnServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 根据action来判断是进行什么操作
		String action = request.getParameter("action");
		// 获取采购退货单Id
		Integer returnId = request.getParameter("returnId") == null || request.getParameter("returnId").equals("")
				? null : Integer.parseInt(request.getParameter("returnId"));
		ReturnService returnService = new ReturnServiceImpl();

		// 获取登陆信息
		UserInfoVO userInfoVO = (UserInfoVO) request.getSession().getAttribute("userInfoVO");
		UserPO userPO = userInfoVO.getUserPO();
		int userId = userPO.getUserId();

		if (action.equals("0")) {// action未0是进行查询操作
			response.setContentType("application/json;charset=utf-8");
			PrintWriter out = response.getWriter();

			// 获取采购退货单状态
			Integer returnState = request.getParameter("returnState") == null
					|| request.getParameter("returnState").equals("") ? null
							: Integer.parseInt(request.getParameter("returnState"));
			// 获取当前页面
			Integer pageNum = request.getParameter("pageNum") == null || request.getParameter("pageNum").equals("") ? 1
					: Integer.parseInt(request.getParameter("pageNum"));
			// 获取页面大小
			PageInfo.pageSize = request.getParameter("pageSize") == null || request.getParameter("pageSize").equals("")
					? 10 : Integer.parseInt(request.getParameter("pageSize"));

			// 获取是否已入库
			String storageState = request.getParameter("storageState") == null
					|| request.getParameter("storageState").equals("") ? null : request.getParameter("storageState");
			// 获取采购单编号
			String purchaseCode = request.getParameter("purchaseCode") == null
					|| request.getParameter("purchaseCode").equals("") ? null : request.getParameter("purchaseCode");
			// 获取是否查询仓库
			String warehouse = request.getParameter("warehouse") == null || request.getParameter("warehouse").equals("")
					? null : request.getParameter("warehouse");
			// 获取采购单Id
			Integer purchaseId = request.getParameter("purchaseId") == null
					|| request.getParameter("purchaseId").equals("") ? null
							: Integer.parseInt(request.getParameter("purchaseId"));

			if (storageState != null) {// 如果已入库 查询采购单
				List<PurchaseVO> purchaseVOs = getPurchase(storageState, purchaseCode);

				JSONArray jsonAraay = JSONArray.fromObject(purchaseVOs);
				out.println(jsonAraay.toString());
			} else if (warehouse != null) {// 查询仓库
				WarehouseService warehouseService = new WarehouseServiceImpl();
				List<WarehouseVO> warehouseVOs = warehouseService.getWarehouseByUserId(userId);

				JSONArray jsonArray = JSONArray.fromObject(warehouseVOs);
				out.println(jsonArray.toString());
			} else if (purchaseId != null) {// 查询页面信息
				List<PurchaseInfo> purchaseInfos = getPurchaseInfo(purchaseId);

				JSONArray jsonArray = JSONArray.fromObject(purchaseInfos);
				out.println(jsonArray.toString());
			} else {// 查询采购退货单

				ReturnPO returnPO = new ReturnPO();
				returnPO.setReturnState(returnState);
				returnPO.setUserId(userId);
				if (returnId != null) {// 查询选中的采购退货单
					returnPO.setReturnId(returnId);
					ReturnVO returnVO = returnService.queryReturn(returnPO).get(0);

					ReturnGoodsDao returnGoodsDao = new ReturnGoodsDaoImpl();
					ReturnGoodsPO returnGoodsPO = new ReturnGoodsPO();
					returnGoodsPO.setReturnId(returnId);
					List<ReturnGoodsVO> returnGoodsVOs = returnGoodsDao.queryReturnGoods(returnGoodsPO);

					List<PurchaseInfo> purchaseInfos = getPurchaseInfo(returnVO.getPurchaseId());

					ReturnInfo returnInfo = new ReturnInfo();
					returnInfo.setPurchaseCode(returnVO.getPurchaseCode());
					returnInfo.setSupplierCName(returnVO.getSupplierCName());
					returnInfo.setPurchaseWarehouseName(returnVO.getPurchaseWarehouseName());
					returnInfo.setReturnNumber(returnVO.getReturnNumber());
					returnInfo.setReturnMoney(returnVO.getReturnMoney());
					returnInfo.setReturnWarehouseName(returnVO.getReturnWarehouseName());
					returnInfo.setReturnRemark(returnVO.getReturnRemark());

					for (int i = 0; i < returnGoodsVOs.size(); i++) {
						purchaseInfos.get(i).setQuantity(returnGoodsVOs.get(i).getQuantity());
						purchaseInfos.get(i).setPrice(returnGoodsVOs.get(i).getPrice());
					}

					JSONArray jsonArray1 = JSONArray.fromObject(purchaseInfos);
					JSONArray jsonArray2 = JSONArray.fromObject(returnInfo);
					out.println("{\"purchaseInfos\":" + jsonArray1.toString() + ",\"returnInfo\":"
							+ jsonArray2.toString() + "}");
				} else {

					PageInfo<ReturnVO> pageInfo = new PageInfo<ReturnVO>(pageNum);

					pageInfo = returnService.getPageInfo(returnPO, pageInfo);

					List<ReturnVO> returnVOs = pageInfo.getPageData();

					JSONArray jsonArray = JSONArray.fromObject(returnVOs);
					out.println("{\"datas\":" + jsonArray.toString() + ",\"totalRecords\":\""
							+ pageInfo.getTotalRecords() + "\",\"pageNum\":\"" + pageInfo.getPageNum() + "\"}");
				}
			}
		} else {// action未1表示进行修改操作
			// 获取删除的采购退货单的Id
			Integer deleteReturnId = request.getParameter("deleteReturnId") == null
					|| request.getParameter("deleteReturnId").equals("") ? null
							: Integer.parseInt(request.getParameter("deleteReturnId"));
			// 获取是否审核通过
			String audit = request.getParameter("audit") == null || request.getParameter("audit").equals("") ? null
					: request.getParameter("audit");
			// 获取采购单Id
			Integer purchaseId = request.getParameter("purchaseId") == null
					|| request.getParameter("purchaseId").equals("") ? null
							: Integer.parseInt(request.getParameter("purchaseId"));
			// 获取采购退货仓库Id
			Integer warehouseId = request.getParameter("warehouseId") == null
					|| request.getParameter("warehouseId").equals("") ? null
							: Integer.parseInt(request.getParameter("warehouseId"));
			// 获取退货总数
			Integer returnNumber = request.getParameter("returnNumber") == null
					|| request.getParameter("returnNumber").equals("") ? null
							: Integer.parseInt(request.getParameter("returnNumber"));
			// 获取退货总金额
			Double returnMoney = request.getParameter("returnMoney") == null
					|| request.getParameter("returnMoney").equals("") ? null
							: Double.parseDouble(request.getParameter("returnMoney"));
			// 获取采购退货备注
			String returnRemark = request.getParameter("returnRemark") == null
					|| request.getParameter("returnRemark").equals("") ? null : request.getParameter("returnRemark");

			// 获取采购退货单每个商品的退货数量
			String quantitys = request.getParameter("quantitys");
			// 获取采购退货单每个商品的退货金额
			String prices = request.getParameter("prices");
			// 获取采购退货单每个商品的商品Id
			String goodIds = request.getParameter("goodIds");

			List<ReturnGoodsVO> returnGoodsVOs = new ArrayList<>();
			ReturnGoodsVO returnGoodsVO = null;
			if (quantitys != null && prices != null) {
				String[] StrQuantitys = quantitys.split("[q]");
				String[] StrPrices = prices.split("[p]");
				String[] StrGoodIds = goodIds.split("[g]");
				for (int i = 0; i < StrQuantitys.length; i++) {
					returnGoodsVO = new ReturnGoodsVO();
					returnGoodsVO.setGoodId(Integer.parseInt(StrGoodIds[i]));
					returnGoodsVO.setQuantity(Integer.parseInt(StrQuantitys[i]));
					returnGoodsVO.setPrice(Double.parseDouble(StrPrices[i]));

					returnGoodsVOs.add(returnGoodsVO);
				}
			}

			ReturnVO returnVO = new ReturnVO();
			returnVO.setReturnCode(CodeGenerate.getCode(userId, CodeGenerate.RETURN_CODE));
			returnVO.setPurchaseId(purchaseId);
			returnVO.setReturnWarehouseId(warehouseId);
			returnVO.setReturnNumber(returnNumber);
			returnVO.setReturnOutNum(0);
			returnVO.setReturnMoney(returnMoney);
			returnVO.setReturnMaker(userId);
			returnVO.setReturnChecker(userId);
			returnVO.setReturnRemark(returnRemark);
			returnVO.setReturnState(0);
			returnVO.setUserId(userId);

			if (audit != null) {// 如果审核通过
				returnVO.setReturnId(returnId);
				returnService.changeReturnStatu(returnVO);
			} else if (deleteReturnId != null) {// 根据deleteReturnId删除采购退货单
				returnService.deleteReturn(deleteReturnId);
			} else if (returnId != null) {// 根据returnId修改采购退货单
				returnVO.setReturnId(returnId);
				returnService.updateReturn(returnVO, returnGoodsVOs);
			} else {// 新增采购退货单
				returnService.addReturn(returnVO, returnGoodsVOs);
			}
		}

	}

	// 获取已入库的采购单
	private List<PurchaseVO> getPurchase(String storageState, String purchaseCode) {
		PurchasePO purchasePO = new PurchasePO();
		purchasePO.setStorageState(storageState);
		purchasePO.setPurchaseCode(purchaseCode);

		PurchaseService purchaseService = new PurchaseServiceImpl();

		return purchaseService.listBy3(purchasePO);
	}

	// 根据采购单Id获取页面所需信息
	private List<PurchaseInfo> getPurchaseInfo(int purchaseId) {
		PurchaseGoodPO purchaseGoodPO = new PurchaseGoodPO();
		purchaseGoodPO.setPurchaseId(purchaseId);

		PurchaseGoodService purchaseGoodService = new PurchaseGoodServiceImpl();
		List<PurchaseGoodVO> purchaseGoodVOs = purchaseGoodService.listBy(purchaseGoodPO);

		List<PurchaseInfo> purchaseInfos = new ArrayList<>();
		// 获取商品信息
		GoodsDao goodsDao = new GoodsDaoImpl();
		PurchaseInfo purchaseInfo = null;
		GoodsVO goodVO = null;
		for (PurchaseGoodVO purchaseGoodVO : purchaseGoodVOs) {
			purchaseInfo = new PurchaseInfo();
			int goodId = purchaseGoodVO.getGoodId();
			goodVO = goodsDao.queryGoodInfoById(goodId);

			purchaseInfo.setGoodId(goodId);
			purchaseInfo.setGoodPicture(goodVO.getGoodPicture());
			purchaseInfo.setSku(goodVO.getSku());
			purchaseInfo.setGoodName(goodVO.getGoodName());
			purchaseInfo.setPurchaseNumber(purchaseGoodVO.getPurchaseNum());
			purchaseInfo.setPurchaseSum(purchaseGoodVO.getPurchaseSum());
			purchaseInfo.setProperties("属性");

			purchaseInfos.add(purchaseInfo);
		}
		return purchaseInfos;
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
