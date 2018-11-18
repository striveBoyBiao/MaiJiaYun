package mjy.kuguan.ruku.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mjy.kuguan.ruku.po.CaigouxiangqingPO;
import mjy.kuguan.ruku.service.PurchaseInfocompileService;
import mjy.login.beans.vo.UserInfoVO;




/**
 * Servlet implementation class PurchaseInfocompileServlet
 */
@WebServlet("/PurchaseInfocompileServlet")
public class PurchaseInfocompileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PurchaseInfocompileServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String PurchaseNote =  request.getParameter("PurchaseNote");
		UserInfoVO uvo = (UserInfoVO) request.getSession().getAttribute("userInfoVO");
		int id = uvo.getBossPO().getUserID();
		PurchaseInfocompileService pis = new PurchaseInfocompileService();
		List<CaigouxiangqingPO>list =  pis.getPurchaseInfocompile(id,PurchaseNote);
		
		response.setContentType("text/xml;charset=utf-8");
		
		PrintWriter out =  response.getWriter();
		out.println("<messages>");
		
			out.println("<worehouse>默认仓库</worehouse>");
		
		if(list!=null){
			for (CaigouxiangqingPO caigouxiangqingPO : list) {
				out.println("<purchaseInfocompilePO>");
				out.println("<PurchaseSKU>"+caigouxiangqingPO.getCaigouxiangqingSku()+"</PurchaseSKU>");
				out.println("<PurchaseName>"+caigouxiangqingPO.getCaigouxiangqingName()+"</PurchaseName>");
				out.println("<PurchaseProperty>"+caigouxiangqingPO.getCaigouxiangqingAttribute()+"</PurchaseProperty>");
				out.println("<PurchaseQuantity>"+caigouxiangqingPO.getCaigouxiangqingInNeed()+"</PurchaseQuantity>");
				out.println("<AchieveQuantity>"+caigouxiangqingPO.getCaigouxiangqingInFinish()+"</AchieveQuantity>");
				//添加一条备注属性
				out.println("<memo>"+caigouxiangqingPO.getCaigouxiangqingNote()+"</memo>");
				out.println("</purchaseInfocompilePO>");
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
