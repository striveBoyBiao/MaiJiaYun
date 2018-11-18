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
 * Servlet implementation class EditServlet
 */
@WebServlet("/EditServlet")
public class EditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditServlet() {
        super();
      
        
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    /**
     * ±à¼­³ö¿âÊ±ÏÔÊ¾±à¼­ÄÚÈÝ
     */
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	//	System.out.println("aaaa");
		resp.setContentType("text/xml;charset=utf-8");
		String chukudanId=req.getParameter("id");
		
		IDetailService deservice =new DetailServiceImpl();
	//	System.out.println("as");
		List<BianJiPO> bians=deservice.queryDetail(Integer.parseInt(chukudanId));
	//	System.out.println(bians.get(0).getBjgoodName());
	//	System.out.println(bians.get(0).getBjgoodName());
		PrintWriter out= resp.getWriter();
    	
		out.println("<bianjis>");

		int a=0;
		int b=0;
		int c=0;
		String d="";
		String cang="";
		for(BianJiPO bianji:bians){
			out.println("<bianji>");
			out.println("<sku>"+bianji.getBjskuCode() +"</sku>");
			out.println("<name>"+bianji.getBjgoodName()+"</name>");
			out.println("<pro>"+bianji.getBjgoodProperty()+"</pro>");
			out.println("<xu>"+bianji.getBjxuchukuNum() +"</xu>");
			out.println("<yi>"+bianji.getBjyichukuNum()+"</yi>");
			out.println("<bei>"+bianji.getBjbeizhu()+"</bei>");
			out.println("</bianji>");
			a+=bianji.getBjxuchukuNum();
			b+=bianji.getBjyichukuNum();
			d+=bianji.getBjchukuBeizhu();
			cang=bianji.getBjcangku();
		}
		out.println("<xuto>"+a+"</xuto>");
		out.println("<yito>"+b+"</yito>");
		out.println("<daito>"+(a-b)+"</daito>");
		out.println("<chukubei>"+d+"</chukubei>");
		out.println("</bianjis>");
	//	System.out.println("aaaa");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
