package mjy.kuguan.chukudan.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mjy.kuguan.chukudan.po.BianJiPO;
import mjy.kuguan.chukudan.service.IDetailService;
import mjy.kuguan.chukudan.service.impl.DetailServiceImpl;



/**
 * Servlet implementation class DetailServlet
 */
@WebServlet("/DetailServlet")
public class DetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DetailServlet() {
        super();
       
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    /**
     * 点击详情时显示详情内容
     */
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		
		resp.setContentType("text/xml;charset=utf-8");
		String chukudanId=req.getParameter("id");
		IDetailService deservice =new DetailServiceImpl();
		String type= deservice.getType(Integer.parseInt(chukudanId));
		List<BianJiPO> bianjis=deservice.queryDetail(Integer.parseInt(chukudanId));
//		System.out.println(bianjis.get(0).getBjgoodName());
		PrintWriter out= resp.getWriter();
    	
		out.println("<bianjis>");

		int a=0;
		int b=0;
		int c=0;
		String d="";
		for(BianJiPO bianji:bianjis){
			out.println("<bianji>");
			out.println("<sku>"+bianji.getBjskuCode() +"</sku>");
			out.println("<name>"+bianji.getBjgoodName()+"</name>");
			out.println("<pro>"+bianji.getBjgoodProperty()+"</pro>");
			out.println("<xu>"+bianji.getBjxuchukuNum() +"</xu>");
			out.println("<yi>"+bianji.getBjyichukuNum()+"</yi>");
			out.println("<cang>"+bianji.getBjcangku()+"</cang>");
			out.println("<bei>"+bianji.getBjbeizhu()+"</bei>");
			out.println("</bianji>");
			a+=bianji.getBjxuchukuNum();
			b+=bianji.getBjyichukuNum();
			d+=bianji.getBjchukuBeizhu();
			
		}
		out.println("<xuto>"+a+"</xuto>");
		out.println("<yito>"+b+"</yito>");
		out.println("<daito>"+(a-b)+"</daito>");
		out.println("<chukubei>"+d+"</chukubei>");
		out.println("<type>"+type+"</type>");
		out.println("</bianjis>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
