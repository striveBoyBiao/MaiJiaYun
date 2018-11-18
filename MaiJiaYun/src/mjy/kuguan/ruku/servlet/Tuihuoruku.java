package mjy.kuguan.ruku.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mjy.kuguan.ruku.po.TuihuorukuPO;
import mjy.kuguan.ruku.service.TuihuoServiceImpl;
import mjy.kuguan.ruku.util.PageInfoBean;
import mjy.login.beans.vo.UserInfoVO;




/**
 * Servlet implementation class ReturnSales
 */
@WebServlet("/servlet/ReturnSales")
public class Tuihuoruku extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Tuihuoruku() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		TuihuoServiceImpl tsi = new TuihuoServiceImpl();
		
		UserInfoVO ui =(UserInfoVO) request.getSession().getAttribute("userInfoVO");
		int id = ui.getBossPO().getUserID();
		
		
		PageInfoBean<TuihuorukuPO> pb = new PageInfoBean<>();
		String pageNo = "1";
		pb.setPageNo(pageNo);
		PageInfoBean <TuihuorukuPO>pageInfoBean =  tsi.getAllPageInfo(id,pb);
//		System.out.println(pageInfoBean.getRowCount());
		int CaigouNum = tsi.getCaigouNo(id);
		int diaoboNum = tsi.getDiaoboNo(id);
		request.setAttribute("caigouNum", CaigouNum);
		request.setAttribute("diaoboNum", diaoboNum);
		
		request.setAttribute("PageInfoBean", pageInfoBean);
		 
		
		request.getRequestDispatcher("/KuGuan/RuKu/TuiHuoRuKu/index.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
