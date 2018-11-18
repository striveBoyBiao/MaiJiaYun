package mjy.kuguan.ruku.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.plaf.synth.SynthSpinnerUI;

import mjy.kuguan.ruku.po.CaigourukuPO;
import mjy.kuguan.ruku.service.PurchaseService;
import mjy.kuguan.ruku.util.PageInfo;
import mjy.login.beans.vo.UserInfoVO;

/**
 * Servlet implementation class GetWoreHouseServlet
 */
@WebServlet("/GetWoreHouseServlet")
public class GetWoreHouseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetWoreHouseServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/xml;charset=utf-8");
		UserInfoVO uvo = (UserInfoVO) request.getSession().getAttribute("userInfoVO");
		int id = uvo.getBossPO().getUserID();
		String warehouse =	request.getParameter("warehouse");
		int pageSize = Integer.parseInt(request.getParameter("pageSize"));
		 if(warehouse==null){
			 warehouse = "";
		 }
		if(warehouse.equals("È«²¿²Ö¿â")){
			warehouse="";
		}
		
	//	request.setAttribute("warehouse", warehouse);
	//	request.getSession().setAttribute("warehouse", warehouse);
	//	request.getRequestDispatcher("/Purchase").forward(request, response);
	//	response.sendRedirect("/Mai/Purchase");
		
		
		
		
		String pageNo = request.getParameter("pageNo");
		if(pageNo==null||pageNo.equals("")){
			pageNo="1";
		}
		
//		System.out.println(warehouse);
//		System.out.println(pageNo);
		
		PageInfo pi = new PageInfo();
		PurchaseService ps = new PurchaseService();
		pi.pageSize = pageSize;
		pi.setPageNo(pageNo);
		pi.setQueryParm(warehouse);
		
		
		PageInfo pageInfo;
		if(warehouse==null||warehouse.equals("")){
			pageInfo = ps.getAllPageInfo(id, pi);
		}else{
			pageInfo = ps.getPruchaseBywarehouseAndPage(id,pi, warehouse);
		}
		
		List<CaigourukuPO> list = pageInfo.getList();
		PrintWriter out = response.getWriter();
//		System.out.println(pageInfo.getRowCount());
		out.println("<messages>");
		if (pageInfo != null) {
			out.println("<pageNo>" + pageInfo.getPageNo() + "</pageNo>");
			out.println("<pageCount>" + pageInfo.getPageCount() + "</pageCount>");
			out.println("<queryParm>" + pageInfo.getQueryParm() + "</queryParm>");
			out.println("<rowCount>" + pageInfo.getRowCount() + "</rowCount>");
			if (list != null) {
				if (list.size() != 0) {
					// System.out.println(list.size());
					for (CaigourukuPO caigourukuPO : list) {
						// System.out.println(caigourukuPO.getCaigouCode());
						out.println("<CaigourukuPO>");
						out.println("<caigouCode>" + caigourukuPO.getCaigouCode() + "</caigouCode>");
						out.println("<caigouCaigoudanCode>" + caigourukuPO.getCaigouCaigoudanCode()
								+ "</caigouCaigoudanCode>");
						out.println("<caigouWarehouse>" + caigourukuPO.getCaigouWarehouse() + "</caigouWarehouse>");
						out.println("<caigouInCount>" + caigourukuPO.getCaigouInCount() + "</caigouInCount>");
						out.println("<caigouInFinish>" + caigourukuPO.getCaigouInFinish() + "</caigouInFinish>");
						out.println("<caigouSetTime>" + caigourukuPO.getCaigouSetTime() + "</caigouSetTime>");
						out.println("<caigouAuthor>" + caigourukuPO.getCaigouAuthor() + "</caigouAuthor>");
						out.println("</CaigourukuPO>");
					}
				}
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
