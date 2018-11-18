package mjy.kuguan.ruku.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mjy.kuguan.ruku.po.TuihuorukuPO;
import mjy.kuguan.ruku.po.TuihuoxiangqingPO;
import mjy.kuguan.ruku.service.TuihuoServiceImpl;
import mjy.kuguan.ruku.service.TuihuoxiangqingServiceImpl;
import mjy.kuguan.ruku.util.PageInfoBean;
import mjy.login.beans.vo.UserInfoVO;

/**
 * Servlet implementation class RemoveTuihuoServlet
 */
@WebServlet("/RemoveTuihuoServlet")
public class RemoveTuihuoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RemoveTuihuoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserInfoVO ui =(UserInfoVO) request.getSession().getAttribute("userInfoVO");
		int id = ui.getBossPO().getUserID();
		int wanchengChecker = ui.getUserPO().getUserId();
		response.setContentType("text/xml;charset=utf-8");
		String pageSize = request.getParameter("pageSize");
		String note = request.getParameter("PruchaseNote");
		TuihuoxiangqingServiceImpl tsi = new TuihuoxiangqingServiceImpl();
	//	TuihuoServiceImpl trs = new TuihuoServiceImpl();
		 List<TuihuoxiangqingPO> Tpolist = tsi.getXiangqing(id,note);
		int i =0;
		 for (TuihuoxiangqingPO tuihuoxiangqingPO : Tpolist) {
			tuihuoxiangqingPO.setTuihuoxiangqingInOk(Integer.parseInt(request.getParameter("actualQuantities"+i)));
			tuihuoxiangqingPO.setTuihuoxiangqingInBroken(Integer.parseInt(request.getParameter("brokenQuantity"+i)));
			tuihuoxiangqingPO.setTuihuoxiangqingInLost(Integer.parseInt(request.getParameter("lostQuantity"+i)));
			tuihuoxiangqingPO.setTuihuoxiangqingNote(request.getParameter("memos"+i));
		}
		 tsi.setInOkLostBroken(id,Tpolist,request.getParameter("memo"));
		 tsi.removeByPruchaseNote(id,note,wanchengChecker);
	
		 
		 
		 
		 
		 
			String warehouse = request.getParameter("warehouse");
			String Info = request.getParameter("Info");
			String pageNo = request.getParameter("pageNo");
		//	System.out.println(pageNo);
		//	System.out.println(warehouse);
		//	System.out.println(Info);
			
			response.setContentType("text/xml;charset=utf-8");
			// PageInfo pi = new PageInfo();
			PageInfoBean<TuihuorukuPO> pb = new PageInfoBean<>();
			pb.pageSize =Integer.parseInt(pageSize);
			TuihuoServiceImpl ts = new TuihuoServiceImpl();
			// System.out.println(Info);

			if (Info == null) {
				Info = "";
			}

			if (pageNo == null || pageNo.equals("")) {
				pageNo = "1";
			}
			if(warehouse == null){
				warehouse = "";
			}
			if(warehouse.equals("ȫ���ֿ�")){
				warehouse = "";
			}
			
			if (!warehouse.equals("")) {
				
				pb.setPageNo(pageNo);
				pb.setQueryParm(warehouse);

				PageInfoBean<TuihuorukuPO> pageInfoBean = ts.getSelectTuihuoByhouse(id,pb, warehouse);
				List<TuihuorukuPO> list = pageInfoBean.getList();
				PrintWriter out = response.getWriter();
				// System.out.println("aaaaaaa");
				// System.out.println(pageInfoBean.getRowCount());
				out.println("<messages>");
				if (pageInfoBean != null) {
					out.println("<pageNo>" + pageInfoBean.getPageNo() + "</pageNo>");
					out.println("<pageCount>" + pageInfoBean.getPageCount() + "</pageCount>");
					out.println("<queryParm>" + pageInfoBean.getQueryParm() + "</queryParm>");
					out.println("<rowCount>" + pageInfoBean.getRowCount() + "</rowCount>");
					if (list != null) {
						if (list.size() != 0) {
							// System.out.println(list.size());
							for (TuihuorukuPO tuihuorukuPO : list) {
								// System.out.println(caigourukuPO.getCaigouCode());
								out.println("<CaigourukuPO>");
								out.println("<caigouCode>" + tuihuorukuPO.getTuihuoCode() + "</caigouCode>");
								out.println("<caigouCaigoudanCode>" + tuihuorukuPO.getTuihuoTuihuodanCode()
										+ "</caigouCaigoudanCode>");
								out.println("<caigouWarehouse>" + tuihuorukuPO.getTuihuoWarehouse() + "</caigouWarehouse>");
								out.println("<caigouInCount>" + tuihuorukuPO.getTuihuoInCount() + "</caigouInCount>");
								out.println("<caigouInFinish>" + tuihuorukuPO.getTuihuoInFinish() + "</caigouInFinish>");
								out.println("<caigouSetTime>" + tuihuorukuPO.getTuihuoSetTime() + "</caigouSetTime>");
								out.println("<caigouAuthor>" + tuihuorukuPO.getTuihuoAuthor() + "</caigouAuthor>");
								out.println("</CaigourukuPO>");
							}
						}
					}
				}

				out.println("</messages>");

			} else {
				
				pb.setPageNo(pageNo);
				pb.setQueryParm(Info);

				PageInfoBean<TuihuorukuPO> pageInfoBean = ts.getSelectTuihuo(id,pb, Info);
				List<TuihuorukuPO> list = pageInfoBean.getList();
				PrintWriter out = response.getWriter();
				// System.out.println("aaaaaaa");
				// System.out.println(pageInfoBean.getRowCount());
				out.println("<messages>");
				if (pageInfoBean != null) {
					out.println("<pageNo>" + pageInfoBean.getPageNo() + "</pageNo>");
					out.println("<pageCount>" + pageInfoBean.getPageCount() + "</pageCount>");
					out.println("<queryParm>" + pageInfoBean.getQueryParm() + "</queryParm>");
					out.println("<rowCount>" + pageInfoBean.getRowCount() + "</rowCount>");
					if (list != null) {
						if (list.size() != 0) {
							// System.out.println(list.size());
							for (TuihuorukuPO tuihuorukuPO : list) {
								// System.out.println(caigourukuPO.getCaigouCode());
								out.println("<CaigourukuPO>");
								out.println("<caigouCode>" + tuihuorukuPO.getTuihuoCode() + "</caigouCode>");
								out.println("<caigouCaigoudanCode>" + tuihuorukuPO.getTuihuoTuihuodanCode()
										+ "</caigouCaigoudanCode>");
								out.println("<caigouWarehouse>" + tuihuorukuPO.getTuihuoWarehouse() + "</caigouWarehouse>");
								out.println("<caigouInCount>" + tuihuorukuPO.getTuihuoInCount() + "</caigouInCount>");
								out.println("<caigouInFinish>" + tuihuorukuPO.getTuihuoInFinish() + "</caigouInFinish>");
								out.println("<caigouSetTime>" + tuihuorukuPO.getTuihuoSetTime() + "</caigouSetTime>");
								out.println("<caigouAuthor>" + tuihuorukuPO.getTuihuoAuthor() + "</caigouAuthor>");
								out.println("</CaigourukuPO>");
							}
						}
					}
				}

				out.println("</messages>");

			}

		 
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
