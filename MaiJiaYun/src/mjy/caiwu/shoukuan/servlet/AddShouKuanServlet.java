package mjy.caiwu.shoukuan.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mjy.caiwu.jichuziliao.po.ShouZhiTypePO;
import mjy.caiwu.jichuziliao.service.FuKuanAccountService;
import mjy.caiwu.jichuziliao.service.ShouZhiTypeService;
import mjy.caiwu.jichuziliao.service.impl.FuKuanAccountServiceImpl;
import mjy.caiwu.jichuziliao.service.impl.ShouZhiTypeServiceImpl;
import mjy.caiwu.jichuziliao.vo.FuKuanAccountVO;
import mjy.caiwu.jichuziliao.vo.ShouZhiTypeVO;

/**
 * Servlet implementation class AddShouKuanServlet
 */
@WebServlet("/servlet/cw/addShouKuan")
public class AddShouKuanServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddShouKuanServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		FuKuanAccountService fkAccountService = new FuKuanAccountServiceImpl();
		FuKuanAccountVO fkAccount = new FuKuanAccountVO();
		List<FuKuanAccountVO> listFK = fkAccountService.listBy();
		request.setAttribute("fkAccount", listFK);
		
		
		ShouZhiTypeService SZT = new ShouZhiTypeServiceImpl();
		ShouZhiTypePO shouzhiTypePO = new ShouZhiTypePO();
		shouzhiTypePO.setStatus("启用");

		List<ShouZhiTypeVO> list = SZT.listBy(shouzhiTypePO);
		request.setAttribute("shouzhilxs", list);
		request.getRequestDispatcher("/caiwu/shoukuan/addShouKuan.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
