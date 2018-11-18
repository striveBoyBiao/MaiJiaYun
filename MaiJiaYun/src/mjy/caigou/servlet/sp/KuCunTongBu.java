package mjy.caigou.servlet.sp;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mjy.caigou.dao.CommodityDao;
import mjy.caigou.dao.impl.CommodityDaoImpl;
import mjy.caigou.po.GoodsPO;
import mjy.caigou.service.KuCunTongBuService;
import mjy.caigou.service.impl.KuCunTongBuServiceImpl;
import mjy.caigou.vo.GoodsVO;
import mjy.login.beans.vo.UserInfoVO;

/**
 * Servlet implementation class ImportGoodsServlet
 */
@WebServlet("/servlet/cg/kucuntongbu")
public class KuCunTongBu extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private KuCunTongBuService goodservice=new KuCunTongBuServiceImpl();
       
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//从session获取用户Id getBossPO()老板信息
		UserInfoVO userInfoVO=(UserInfoVO)request.getSession().getAttribute("userInfoVO");
		int userId=userInfoVO.getBossPO().getUserID();
		
		List<GoodsVO> goods=goodservice.queryAllGoods(userId);
		request.setAttribute("goods", goods);
		
		
	
		
		if(true){
			request.getRequestDispatcher("/CaiGou/jsp/sp/kucuntongbu.jsp").forward(request, response);
		}
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
