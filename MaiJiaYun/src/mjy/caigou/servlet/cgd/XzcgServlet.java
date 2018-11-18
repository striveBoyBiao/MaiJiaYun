package mjy.caigou.servlet.cgd;

import java.io.IOException;
import java.io.PrintWriter;
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
import mjy.caigou.service.SPService;
import mjy.caigou.service.SupplierService;
import mjy.caigou.service.WarehouseService;
import mjy.caigou.service.impl.SPServiceImpl;
import mjy.caigou.service.impl.SupplierServiceImpl;
import mjy.caigou.service.impl.WarehouseServiceImpl;
import mjy.caigou.vo.GoodsVO;
import mjy.caigou.vo.SupplierVO;
import mjy.caigou.vo.WarehouseVO;
import mjy.login.beans.vo.UserInfoVO;

/**
 * Servlet implementation class XzcgServlet
 */
@WebServlet("/caigou/servlet/XzcgServlet")
public class XzcgServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		
		UserInfoVO userInfoVo=(UserInfoVO)request.getSession().getAttribute("userInfoVO");
		
//		PurchasePO purchasePo=new PurchasePO();
		
		SupplierPO supplierPO=new SupplierPO();
		SupplierService ss=new SupplierServiceImpl();
		UserInfoVO userInfoVO=(UserInfoVO)request.getSession().getAttribute("userInfoVO");
		supplierPO.setUserId(userInfoVO.getBossPO().getUserID());
		List<SupplierVO> listSuplierVo =ss.querySupplier(supplierPO);
		request.setAttribute("listSuplierVo", listSuplierVo);
		
		WarehousePO warehousePO=new WarehousePO();
		WarehouseService ws=new WarehouseServiceImpl();
		
		List<WarehouseVO> listWarehouseVO =ws.getWarehouseByUserId(userInfoVo.getBossPO().getUserID());
		
		GoodsPO goodPo=new GoodsPO();
		SPService sps=new SPServiceImpl();
		List<GoodsPO> listGoodsPO=sps.getAllGoods(userInfoVo.getBossPO().getUserID());
		
		
		
		request.setAttribute("listGoodsPO", listGoodsPO);
		request.setAttribute("listSuplierVo", listSuplierVo);
		request.setAttribute("listWarehouseVO", listWarehouseVO);
		request.getRequestDispatcher("/CaiGou/jsp/cgd/xzcg.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
