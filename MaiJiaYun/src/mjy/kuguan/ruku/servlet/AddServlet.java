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

import mjy.kuguan.ruku.caigou.vo.CaigouXiangQingVO;
import mjy.kuguan.ruku.po.CaigourukuPO;
import mjy.kuguan.ruku.service.PurchaseInfocompileService;
import mjy.kuguan.ruku.service.PurchaseService;
import mjy.kuguan.ruku.util.PageInfo;
import mjy.login.beans.vo.UserInfoVO;

/**
 * Servlet implementation class AddServlet
 */
@WebServlet("/AddServlet")
public class AddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddServlet() {
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
		int wanchengChecker = uvo.getUserPO().getUserId();
		String a = request.getParameter("PurchaseNote");
		// System.out.println(a);
		int pageSize = Integer.parseInt(request.getParameter("pageSize"));
		String Info = request.getParameter("Info");
		if (Info == null) {
			Info = "";
		}
		if (Info.equals("This is a null,Do not select")) {
			Info = "";
		}
		
		if (a != null) {
			// ���ݶ�����֪�������м�����Ʒ ����û������· Ĭ��Ϊ2
			// System.out.println(a);
			PurchaseInfocompileService pi = new PurchaseInfocompileService();

			int len = pi.getCountInfo(id, a);
			List<CaigouXiangQingVO> list = new ArrayList<>();
			CaigouXiangQingVO cx = null;
			for (int i = 0; i < len; i++) {
				// ���η�����е�����
				String actualQuantities = request.getParameter("actualQuantities" + i);
				// ��ע
				// System.out.println(actualQuantities);
				// System.out.println(actualQuantities);
				String memos = request.getParameter("memos" + i);
				// System.out.println(actualQuantities +" " + memos );
				if (actualQuantities == null || actualQuantities.equals("")) {
					actualQuantities = "0";
				}
				if (actualQuantities != null) {
					if (actualQuantities.equals("0")) {
						// ��������
					} else {
						// �ɹ������Ϊ a �ĵ�i�����ݸ���
						int num = Integer.parseInt(actualQuantities);
						cx = new CaigouXiangQingVO();
						cx.setNum(num);
						cx.setMemo(memos);
						cx.setNumber(i);
						list.add(cx);

						// System.out.println(num);
						// System.out.println(memos);
					}
				}

			}
			PurchaseInfocompileService pifs = new PurchaseInfocompileService();

			pifs.addInfoCompile(id, a, list,wanchengChecker);

			String memo = request.getParameter("memo");
			// System.out.println(memo);
			PurchaseService piv = new PurchaseService();
			piv.addMemo(id, a, memo);
		}

		// response.sendRedirect("/Mai/Purchase");
		String warehouse = request.getParameter("warehouse");
		if (warehouse == null) {
			warehouse = "";
		}
		if (warehouse.equals("ȫ���ֿ�")) {
			warehouse = "";
		}
		// System.out.println(warehouse);
		if (!warehouse.equals("")) {
			response.setContentType("text/xml;charset=utf-8");
			String pageNo = request.getParameter("pageNo");
			if (pageNo == null || pageNo.equals("")) {
				pageNo = "1";
			}

			// System.out.println(warehouse);
			// System.out.println(pageNo);

			PageInfo pi = new PageInfo();
			PurchaseService ps = new PurchaseService();
			pi.pageSize = pageSize;
			pi.setPageNo(pageNo);
			pi.setQueryParm(warehouse);
			

			PageInfo pageInfo = ps.getPruchaseBywarehouseAndPage(id, pi, warehouse);
			List<CaigourukuPO> list = pageInfo.getList();
			PrintWriter out = response.getWriter();
			// System.out.println(pageInfo.getRowCount());
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

		} else if (warehouse.equals("")) {
			response.setContentType("text/xml;charset=utf-8");
			
			String pageNo = request.getParameter("pageNo");

			PageInfo pi = new PageInfo();
			// System.out.println(Info);
			// System.out.println(pageNo);
			PurchaseService ps = new PurchaseService();
			// System.out.println(Info);
			if (pageNo == null || pageNo.equals("")) {
				pageNo = "1";
			}
			pi.pageSize = pageSize;
			pi.setPageNo(pageNo);
			pi.setQueryParm("Info=" + Info);
			
			PageInfo pageInfo ;
			if(Info.equals("")){
				pageInfo = ps.getAllPageInfo(id, pi);
			}else{
				pageInfo = ps.getSelectPruchase(id, pi, Info);
			}
			
			List<CaigourukuPO> list = pageInfo.getList();
			PrintWriter out = response.getWriter();
			// System.out.println("aaaaaaa");
			// System.out.println(pageInfo.getQueryParm());
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
