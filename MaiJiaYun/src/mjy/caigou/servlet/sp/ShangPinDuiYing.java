package mjy.caigou.servlet.sp;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mjy.caigou.po.ShopGoodsPO;
import mjy.caigou.service.ImportGoodsService;
import mjy.caigou.service.SPDuiYingService;
import mjy.caigou.service.ShopService;
import mjy.caigou.service.impl.ImportGoodsServiceImpl;
import mjy.caigou.service.impl.SPDuiYingServiceImpl;
import mjy.caigou.service.impl.ShopServiceImpl;
import mjy.caigou.vo.ShopGoodsVO;
import mjy.common.servlet.BaseServlet;
import mjy.login.beans.vo.UserInfoVO;
import net.sf.json.JSONArray;


/**
 * ��Ʒ��Ӧservlet
 * Servlet implementation class ImportGoodsServlet
 */
@WebServlet("/servlet/cg/spduiying")
public class ShangPinDuiYing extends BaseServlet {
	/**
	 * ��ѯ���еĵ�������
	 */
	private String getindex=null;//������¼���̵�idֵ
	public void getShopNames(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		UserInfoVO userinfovo=  (UserInfoVO) request.getSession().getAttribute("userInfoVO");
		int userId=userinfovo.getUserPO().getUserId();
		ShopService shopService=new ShopServiceImpl();
		List<String> shopNames=shopService.getShopNames(userId);
		session.setAttribute("shopNames", shopNames);
		request.getRequestDispatcher("/CaiGou/jsp/sp/shangpinduiying.jsp").forward(request, response);	
	}
	/**
	 * ���ݵ���id���Ƿ���  ��ѯ���е���Ʒ
	 *
	 */

	public void getShopGoodss(HttpServletRequest request, HttpServletResponse response) throws IOException{
		response.setContentType("application/json;charset=utf-8");
		ImportGoodsService goodsService=new ImportGoodsServiceImpl();
		List<ShopGoodsVO> shopGoodss=null;
		String index=request.getParameter("index");
		getindex=index;
		if(index!=null){
			int shopId=Integer.parseInt(index);
			shopGoodss=goodsService.getShopGoodss(shopId,1);
			request.setAttribute("shopGoodss",shopGoodss);
			
			if(shopGoodss.size()>0){
				JSONArray js=JSONArray.fromObject(shopGoodss);
				PrintWriter out=response.getWriter();
				out.println(js.toString());				
			}	
		}
	}
	/**
	 * ��������ѯ ���ݵ���id���Ƿ��ϼܲ�ѯ(ǰ���Ǹ���Ʒ�ѵ���)
	 *
	 */
	public void queryShopGoods(HttpServletRequest request, HttpServletResponse response) throws IOException,ServletException{
		response.setContentType("application/json;charset=utf-8");
		SPDuiYingService duiyingService=new SPDuiYingServiceImpl();
		ImportGoodsService goodsService=new ImportGoodsServiceImpl();
		
		List<ShopGoodsVO> shopGoodsvo=null;
		int shopId=Integer.parseInt(getindex);
		String onSelf=request.getParameter("isOnSelf");
		
		if(onSelf!=null){
			int isOnSelf=Integer.parseInt(onSelf);
			if(isOnSelf==2){
				//2ȫ����Ʒ 0�¼���Ʒ 1�ϼ���Ʒ
				//��ѯȫ����Ʒ
				shopGoodsvo=goodsService.getShopGoodss(shopId,1);
			}else{
				//��ѯ�ϼܺ��¼ܵ���Ʒ
				shopGoodsvo=duiyingService.queryShopGoods(shopId, isOnSelf);
			}
			
			if(shopGoodsvo.size()>0){
				JSONArray js=JSONArray.fromObject(shopGoodsvo);
				PrintWriter out=response.getWriter();
				out.println(js.toString());				
			}
		}
		request.setAttribute("shopGoodsvo",shopGoodsvo);
	}
	/**
	 * �������ģ����ѯ
	 *
	 */
	public void searchGoods(HttpServletRequest request, HttpServletResponse response) throws IOException,ServletException{
		SPDuiYingService duiyingService=new SPDuiYingServiceImpl();
		response.setContentType("application/json;charset=utf-8");
		String index=request.getParameter("shopGoodsIdParam");
	//	System.out.println("index:"+index);
		int shopId=Integer.parseInt(index);//����Id
		
		String goodParams=request.getParameter("goodParams");//��ƷId
		String onShelf=request.getParameter("isOnShelf");
		
		if(goodParams!=null && onShelf!=null){
			int isOnShelf=Integer.parseInt(onShelf);
			
			//����ѯ������װ��������
			ShopGoodsPO shopGoodsPo=new ShopGoodsPO();
			shopGoodsPo.setGoodName(goodParams);//��ƷId
			shopGoodsPo.setShopId(shopId);//����Id
			shopGoodsPo.setIsOnShelf(isOnShelf);//�Ƿ��ϼ�
			
			//����service������ѯ
			List<ShopGoodsVO> goodsvos=duiyingService.query(shopGoodsPo);
			request.setAttribute("goodsvos", goodsvos);
			if(goodsvos.size()>0){
				JSONArray js=JSONArray.fromObject(goodsvos);
				PrintWriter out=response.getWriter();
				out.println(js.toString());	
			}	
		}
	}
	/**
	 * �Ѷ�Ӧ(ǰ������:��Ʒ�����ϼ�)
	 * 
	 */
	public void duiYing(HttpServletRequest request, HttpServletResponse response) throws IOException,ServletException{
		SPDuiYingService duiyingService=new SPDuiYingServiceImpl();
		response.setContentType("application/json;charset=utf-8");
		String isFlag=request.getParameter("isFlag");//1
		//System.out.println("��ֵ1String "+isFlag);
		String shop=request.getParameter("shopId");//shopId isOnShelf=1 iscorrespond=0δ��Ӧ
		//System.out.println("String shopId "+shop);
		List<ShopGoodsVO> goodsvos=null;
		if(isFlag!=null && shop!=null){	
			int iscorrespond=Integer.parseInt(isFlag);
			//System.out.println("�Ƿ��Ӧint "+iscorrespond);
			int shopId=Integer.parseInt(shop);
			//System.out.println("int shopId "+shopId);
			goodsvos=duiyingService.getAllDuiYingGoods(shopId, iscorrespond);
			
			if(goodsvos.size()>0){
				JSONArray js=JSONArray.fromObject(goodsvos);
				PrintWriter out=response.getWriter();
				out.println(js.toString());				
			}
		}
		request.setAttribute("goodsvos", goodsvos);	
	}
	//��Ʒδ��Ӧ(��Ʒ�����ϼ�)
	public void unDuiYing(HttpServletRequest request, HttpServletResponse response) throws IOException,ServletException{
		SPDuiYingService duiyingService=new SPDuiYingServiceImpl();
		response.setContentType("application/json;charset=utf-8");
		List<ShopGoodsVO> goodsvos=null;
		String isFalse=request.getParameter("isFalse");
		String params=request.getParameter("params");
		
		if(isFalse!=null && params!=null){
			int iscorrespond=Integer.parseInt(isFalse);
			int shopId=Integer.parseInt(params);
			goodsvos=duiyingService.getAllDuiYingGoods(shopId, iscorrespond);
			
			if(goodsvos.size()>0){
				JSONArray js=JSONArray.fromObject(goodsvos);
				PrintWriter out=response.getWriter();
				out.println(js.toString());				
			}
		}
		request.setAttribute("goodsvos", goodsvos);	
	}
	//��Ӧ��Ʒ�浽goods����
	public void updateGoods(HttpServletRequest request, HttpServletResponse response) throws IOException,ServletException{
	
		SPDuiYingService duiyingService=new SPDuiYingServiceImpl();
		UserInfoVO userinfovo=  (UserInfoVO) request.getSession().getAttribute("userInfoVO");
		int userId=userinfovo.getUserPO().getUserId();
		
		String goodParams=request.getParameter("goodId");
		System.out.println("goodParams:"+goodParams);
	//	System.out.println("jsp��������shopid�� "+goodParams);
		if(goodParams!=null){
			int goodId=Integer.parseInt(goodParams);
			duiyingService.insertToGoods(goodId,userId);
			duiyingService.updateShopTable(goodId);
			duiyingService.insertToUserStatus(goodId, userId);
		}
	}
	
}
