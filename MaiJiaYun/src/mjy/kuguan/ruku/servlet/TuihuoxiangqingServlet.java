package mjy.kuguan.ruku.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mjy.kuguan.ruku.po.TuihuoxiangqingPO;
import mjy.kuguan.ruku.service.TuihuoxiangqingServiceImpl;
import mjy.login.beans.vo.UserInfoVO;



/**
 * Servlet implementation class TuihuoxiangqingServlet
 */
@WebServlet("/TuihuoxiangqingServlet")
public class TuihuoxiangqingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TuihuoxiangqingServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		UserInfoVO ui =(UserInfoVO) request.getSession().getAttribute("userInfoVO");
		int id = ui.getBossPO().getUserID();
		
		response.setContentType("text/xml;charset=utf-8");
		
		PrintWriter out =  response.getWriter();
		String PurchaseNote =  request.getParameter("PruchaseNote");
		TuihuoxiangqingServiceImpl tsi = new TuihuoxiangqingServiceImpl();
		List<TuihuoxiangqingPO> list = new ArrayList<>();
		list = tsi.getXiangqing(id,PurchaseNote);
//		System.out.println(PurchaseNote);
		out.println("<messages>");
//		System.out.println(list.size());
		if(list.size()==0){
			System.out.println(list.size());
			list = null;
		}
		if(list==null){
			out.println("<worehouse>默认仓库</worehouse>");
		}
		if(list!=null){
			out.println("<worehouse>"+list.get(0).getTuihuoxiangqingWarehouse()+"</worehouse>");
		}
		
		if(list!=null){
			for (TuihuoxiangqingPO tuihuoxiangqingPO : list) {
				out.println("<tuihuoxiangqingPO>");
				out.println("<TuihuoSKU>"+tuihuoxiangqingPO.getTuihuoxiangqingSku()+"</TuihuoSKU>");
				out.println("<TuihuoName>"+tuihuoxiangqingPO.getTuihuoxiangqingName()+"</TuihuoName>");
				out.println("<TuihuoProperty>"+tuihuoxiangqingPO.getTuihuoxiangqingAttribute()+"</TuihuoProperty>");
				out.println("<TuihuoQuantity>"+tuihuoxiangqingPO.getTuihuoxiangqingInNeed()+"</TuihuoQuantity>");
				
				//添加一条备注属性
				out.println("<memo>"+tuihuoxiangqingPO.getTuihuoxiangqingNote()+"</memo>");
			//	System.out.println(tuihuoxiangqingPO.getTuihuoxiangqingNote());
				out.println("</tuihuoxiangqingPO>");
			
			}
		}
		out.println("</messages>");
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
