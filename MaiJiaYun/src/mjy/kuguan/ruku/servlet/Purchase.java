package mjy.kuguan.ruku.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mjy.kuguan.ruku.po.CaigourukuPO;
import mjy.kuguan.ruku.service.PurchaseService;
import mjy.kuguan.ruku.util.PageInfo;
import mjy.login.beans.vo.UserInfoVO;


/**
 * Servlet implementation class Purchase
 */
@WebServlet("/servlet/Purchase")
public class Purchase extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Purchase() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PurchaseService ps = new PurchaseService();
		UserInfoVO uvo = (UserInfoVO) request.getSession().getAttribute("userInfoVO");
		int id = uvo.getBossPO().getUserID();
		List<CaigourukuPO> list = ps.getPruchaseInfoVO(id);
//		System.out.println("xxx");
		PageInfo pageInfo = new PageInfo();
		
		
		
		
	//	System.out.println(request.getAttribute("PurchaseNote"));
	//	System.out.println(a);
		String pageNo = "1";
		/*if(request.getSession().getAttribute("PageNo")!=null){
			
			if(!request.getSession().getAttribute("PageNo").equals("")){
				//list根据仓库编号获取
				pageNo = request.getSession().getAttribute("PageNo").toString();
			}
			
		}*/
		pageInfo.setPageNo(pageNo);
		
		PageInfo pi = ps.getAllPageInfo(id,pageInfo);
	/*	if(request.getSession().getAttribute("warehouse")!=null){
			
			if(!request.getSession().getAttribute("warehouse").equals("")){
				//list根据仓库编号获取
				list=ps.getPruchaseBywarehouse(request.getSession().getAttribute("warehouse").toString());
				pi = ps.getPageInfoBywarehouse(pageInfo, request.getSession().getAttribute("warehouse").toString());
			//	request.getSession().removeAttribute("warehouse");
			}
			
		}*/
	/*	if(request.getSession().getAttribute("remove")!=null){
	//		System.out.println(request.getSession().getAttribute("remove"));
			
	//		pi = ps.getAllPageInfo(pageInfo);
		}
		*/
		int TuihuoNum = ps.getTuihuoNo(id);
		int diaoboNum = ps.getDiaoboNo(id);
		request.setAttribute("TuihuoNum", TuihuoNum);
		request.setAttribute("diaoboNum", diaoboNum);
		request.setAttribute("pageInfo", pi);
//		request.setAttribute("CaigourukuPO", list);
		request.getRequestDispatcher("/KuGuan/RuKu/CaiGouRuKu/index.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
