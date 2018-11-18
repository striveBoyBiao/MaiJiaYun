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
 * Servlet implementation class SelectListServlet
 */
@WebServlet("/SelectListServlet")
public class SelectListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SelectListServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		UserInfoVO uvo = (UserInfoVO) request.getSession().getAttribute("userInfoVO");
		int id = uvo.getBossPO().getUserID();
		String Info = request.getParameter("Info");
		String pageNo = request.getParameter("pageNo");
		int pageSize = Integer.parseInt(request.getParameter("pageSize"));
		response.setContentType("text/xml;charset=utf-8");
		PageInfo pi = new PageInfo();
		/*System.out.println(Info);
		System.out.println(pageNo);*/
		PurchaseService ps = new PurchaseService();
		// System.out.println(Info);
		
		if(Info==null){
			Info = "";
		}
		if (Info.equals("This is a null,Do not select")) {
			Info = "";
		}
		if(pageNo==null||pageNo.equals("")){
			pageNo="1";
		}
		pi.pageSize = pageSize;
		pi.setPageNo(pageNo);
		pi.setQueryParm("Info=" + Info);
	
		PageInfo pageInfo ;
		if(Info.equals("")){
			pageInfo = ps.getAllPageInfo(id, pi);
		}else{
			pageInfo = ps.getSelectPruchase(id,pi, Info);
		}
		
		List<CaigourukuPO> list = pageInfo.getList();
		PrintWriter out = response.getWriter();
		// System.out.println("aaaaaaa");
	//	System.out.println(pageInfo.getQueryParm());
	//	System.out.println(pageInfo.getPageCount());
		out.println("<messages>");
		if (pageInfo != null) {
			out.println("<pageNo>" + pageInfo.getPageNo() + "</pageNo>");
			out.println("<pageCount>" + pageInfo.getPageCount() + "</pageCount>");
			out.println("<queryParm>" + pageInfo.getQueryParm() + "</queryParm>");
			out.println("<rowCount>" + pageInfo.getRowCount() + "</rowCount>");
			
		//	System.out.println(pageInfo.getPageNo());
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
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
