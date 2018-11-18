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
 * ����json����
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
		// ģ����ѯ����(jsp�������Ĳ���)
		String params = request.getParameter("index");
	//	System.out.println("params:" + params);
		// ����ѯ������װ��������
		GoodsPO gpo = new GoodsPO();
		gpo.setSku(params);
		gpo.setGoodName(params);
		//�õ����е���Ʒ�б�
		
		if(params!=null){
			goodsvos = goodservice.listBy(gpo);
			request.setAttribute("goodsvos", goodsvos);
			//System.out.println("ģ����ѯ�ĸ���"+goodsvos.size());
			if(goodsvos.size()>0){
				JSONArray js=JSONArray.fromObject(goodsvos);
				PrintWriter out=response.getWriter();
				out.println(js.toString());				
			}
		}
		
		/**
		 * ����������
		 */
		String value=request.getParameter("wbkdz");
//		System.out.println("jsp��ֵinputΪ:"+value);
		String goodid=request.getParameter("goodid");
//		System.out.println("goodid��ֵΪ"+goodid);
		if(value!=null && goodid!=null){
			goodservice.updateStore(Integer.parseInt(goodid),Integer.parseInt(value));
		}
		

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
