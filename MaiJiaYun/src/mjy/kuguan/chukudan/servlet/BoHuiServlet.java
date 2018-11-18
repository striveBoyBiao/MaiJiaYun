package mjy.kuguan.chukudan.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mjy.kuguan.chukudan.dao.IBianJiDao;
import mjy.kuguan.chukudan.dao.IChuKuDanDao;
import mjy.kuguan.chukudan.dao.impl.BianJiDaoImpl;
import mjy.kuguan.chukudan.dao.impl.ChuKuDanImpl;


/**
 * Servlet implementation class BoHuiServlet
 */
@WebServlet("/BoHuiServlet")
public class BoHuiServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoHuiServlet() {
        super();
        
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String bohuiType=req.getParameter("type");
		String id=req.getParameter("id");
		
		IBianJiDao bianji=new BianJiDaoImpl();
		bianji.deleteByID(Integer.parseInt(id));
		IChuKuDanDao chuku=new ChuKuDanImpl();
		chuku.deleteByID(Integer.parseInt(id));
		if(bohuiType.equals("diaobo")){
			//System.out.println(bohuiType+"  "+id);
			req.getRequestDispatcher("/servlet/kuguan/chukudan/one?op=diaobo").forward(req, resp);
		}else{
			req.getRequestDispatcher("/servlet/kuguan/chukudan/one?op=caigou").forward(req, resp);

		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
