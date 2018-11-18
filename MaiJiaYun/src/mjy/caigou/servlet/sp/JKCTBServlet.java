package mjy.caigou.servlet.sp;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mjy.caigou.po.GoodsPO;
import mjy.caigou.service.KuCunTongBuService;
import mjy.caigou.service.impl.KuCunTongBuServiceImpl;
import mjy.caigou.vo.GoodsVO;
import net.sf.json.JSONArray;

/**
 * 接受json数据
 */
@WebServlet("/servlet/cg/JKCTBServlet")
public class JKCTBServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private KuCunTongBuService goodservice = new KuCunTongBuServiceImpl();

	public JKCTBServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("application/json;charset=utf-8");
		List<GoodsVO> goodsvos=null;
		// 模糊查询参数(jsp传过来的参数)
		String params = request.getParameter("index");
	//	System.out.println("params:" + params);
		// 将查询条件封装到对象中
		GoodsPO gpo = new GoodsPO();
		gpo.setSku(params);
		gpo.setGoodName(params);
		//得到所有的商品列表
		
		if(params!=null){
			goodsvos = goodservice.listBy(gpo);
			request.setAttribute("goodsvos", goodsvos);
			//System.out.println("模糊查询的个数"+goodsvos.size());
			if(goodsvos.size()>0){
				JSONArray js=JSONArray.fromObject(goodsvos);
				PrintWriter out=response.getWriter();
				out.println(js.toString());				
			}
		}
		
		/**
		 * 更新虚拟库存
		 */
		String value=request.getParameter("wbkdz");
//		System.out.println("jsp传值input为:"+value);
		String goodid=request.getParameter("goodid");
//		System.out.println("goodid的值为"+goodid);
		if(value!=null && goodid!=null){
			goodservice.updateStore(Integer.parseInt(goodid),Integer.parseInt(value));
		}
		

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
