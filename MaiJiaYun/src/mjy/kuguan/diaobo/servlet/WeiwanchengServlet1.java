package mjy.kuguan.diaobo.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mjy.kuguan.diaobo.po.DiaobodanPO;
import mjy.kuguan.diaobo.po.PageInfo;
import mjy.kuguan.diaobo.service.DiaobodanService;
import mjy.kuguan.diaobo.service.impl.DiaobodanServiceImpl;
import mjy.kuguan.diaobo.vo.DiaobodanstateVO;
import net.sf.json.JSONArray;

@WebServlet("/servlet/kg/WeiwanchengServlet1")
public class WeiwanchengServlet1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DiaobodanService diaobodanService=new DiaobodanServiceImpl();
		
		response.setContentType("application/json,charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		//1获取请求
		String pageSize=request.getParameter("pageSize");
		if(pageSize==null){
			pageSize="10";
		}
		String pageNo=request.getParameter("pageNo")==null?"1":request.getParameter("pageNo");
		
		//String initParam=request.getParameter("url");
		String queryParam=request.getParameter("queryParam");
		
		//System.out.println("queryParam"+queryParam);
		//封装请求参数
		DiaobodanPO diaobodanPO=new DiaobodanPO();
		diaobodanPO.setDiaobodanCode(queryParam);
		diaobodanPO.setDiaobodanOutStore(queryParam);
		diaobodanPO.setDiaobodanInStore(queryParam);
//		System.out.println(queryParam);
		PageInfo<DiaobodanstateVO> page=new PageInfo<DiaobodanstateVO>(pageNo);
		
		page.setPageSize(Integer.parseInt(pageSize));
		
		//执行业务模型
		
		PageInfo<DiaobodanstateVO> pageInfo=diaobodanService.listByPage(diaobodanPO, page);
//		System.out.println("pageInfo"+pageInfo.getPageData());
		request.removeAttribute("pageInfo");
		request.setAttribute("pageInfo", pageInfo);
		request.getRequestDispatcher("/KuGuan/diaoBo/jsp/diaoBo-WeiWanCheng.jsp").forward(request, response);
		
	
		
		
		/*JSONArray array=JSONArray.fromObject(pageInfo);
		String jsonStr=array.toString();
		
		response.getWriter().println(jsonStr);*/
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
