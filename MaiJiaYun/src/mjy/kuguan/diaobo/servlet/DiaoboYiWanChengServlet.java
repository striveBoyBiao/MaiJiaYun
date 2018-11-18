package mjy.kuguan.diaobo.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mjy.kuguan.diaobo.po.DiaobodanstatePO;
import mjy.kuguan.diaobo.po.PageInfo;
import mjy.kuguan.diaobo.service.DiaobodanService;
import mjy.kuguan.diaobo.service.impl.DiaobodanServiceImpl;
import mjy.kuguan.diaobo.vo.DiaobodanstateVO;

/**
 * Servlet implementation class DiaoboServlet
 */
@WebServlet("/servlet/kg/DiaoboYiWanChengServlet")
public class DiaoboYiWanChengServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DiaoboYiWanChengServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		// 获取参数
		String pageSize = request.getParameter("pageSize");
		if (pageSize == null) {
			pageSize = "10";
		}
		String pageNo = request.getParameter("pageNo") == null ? "1" : request.getParameter("pageNo");
		String sousou = request.getParameter("sousou");
		
		DiaobodanstatePO diaobodanstatePO = new DiaobodanstatePO();
		diaobodanstatePO.setDiaobodanCode(sousou);
		diaobodanstatePO.setDiaobodanInStore(sousou);
		diaobodanstatePO.setDiaobodanOutStore(sousou);
		diaobodanstatePO.setDiaoboState("0");
		
		PageInfo<DiaobodanstateVO> page = new PageInfo<DiaobodanstateVO>(pageNo);
		page.setPageSize(Integer.parseInt(pageSize));
		
		DiaobodanService diaobodanService = new DiaobodanServiceImpl();
		PageInfo<DiaobodanstateVO> pageInfo=diaobodanService.listByPage(diaobodanstatePO,page);

		request.setAttribute("pageInfo", pageInfo);
		
		request.getRequestDispatcher("/KuGuan/diaoBo/jsp/diaoBo-YiWanCheng.jsp").forward(request, response);
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
