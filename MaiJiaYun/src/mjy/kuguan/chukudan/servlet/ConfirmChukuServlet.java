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
import mjy.kuguan.chukudan.po.BianJiPO;
import mjy.kuguan.chukudan.po.ChuKuDanPO;
import mjy.kuguan.ruku.dao.DiaoborukuDao;
import mjy.kuguan.ruku.dao.DiaoboxiangqingDao;
import mjy.kuguan.ruku.dao.impl.DiaoborukuDaoImpl;
import mjy.kuguan.ruku.dao.impl.DiaoboxiangqingDaoImpl;
import mjy.kuguan.ruku.po.DiaoborukuPO;
import mjy.kuguan.ruku.po.DiaoboxiangqingPO;
import mjy.login.beans.vo.UserInfoVO;



/**
 * Servlet implementation class ConfirmChukuServlet
 */
@WebServlet("/ConfirmChukuServlet")
public class ConfirmChukuServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ConfirmChukuServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    /**
     * 点击确认出库时改变出库状态
     */
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		resp.setContentType("text/html;utf-8");
		String ben = req.getParameter("ben");
		String xu = req.getParameter("xu");
		String yi = req.getParameter("yi");
		String chuid = req.getParameter("chuid");
		String beizhu = req.getParameter("beizhu");
		String type = req.getParameter("type");
		
//		System.out.println(ben+"  "+xu+"  "+yi+"  "+type);
		
		IBianJiDao bianji=new BianJiDaoImpl();
		BianJiPO bianjipo = new BianJiPO();
		bianjipo.setChukudanId(Integer.parseInt(chuid));
		bianjipo.setBjbencichukuNum(Integer.parseInt(ben));
		bianjipo.setBjyichukuNum(Integer.parseInt(yi)+Integer.parseInt(ben));
		bianjipo.setBjbeizhu(beizhu);
		bianji.update(bianjipo);
	
		if((Integer.parseInt(yi)+Integer.parseInt(ben))==Integer.parseInt(xu)){
			ChuKuDanPO chukupo = new ChuKuDanPO();
			chukupo.setChukudanId(Integer.parseInt(chuid));
			chukupo.setChukuState(2);
			IChuKuDanDao chuku = new ChuKuDanImpl();
			chuku.update(chukupo);
		}
		
		if(type.equals("diaobo")){
			IChuKuDanDao chukudandao =new ChuKuDanImpl();
			ChuKuDanPO chukudanpo = chukudandao.querybyId(Integer.parseInt(chuid));
			IBianJiDao bianjidao = new BianJiDaoImpl();
			BianJiPO bianjipoo = bianjidao.listBy(Integer.parseInt(chuid)).get(0);
			
			DiaoborukuPO  diaoborukupo = new DiaoborukuPO();
			
			diaoborukupo.setDiaoboAuthor("管理员");
			diaoborukupo.setDiaoboCode("RK"+chukudanpo.getChukuxiangguandanCode());
			diaoborukupo.setDiaoboDiaobodanCode(chukudanpo.getChukuxiangguandanCode());
			diaoborukupo.setDiaoboWarehouse(chukudanpo.getChukuCangku());
			diaoborukupo.setDiaoboInCount(Integer.parseInt(xu));
			diaoborukupo.setDiaoboInFinish(Integer.parseInt(yi));
			diaoborukupo.setDiaoboNote(bianjipoo.getBjbeizhu());
			diaoborukupo.setDiaoboSetTime(chukudanpo.getChukudanTime());
			
			
			
			DiaoboxiangqingPO diaoboxiangqingpo = new DiaoboxiangqingPO();
			
			diaoboxiangqingpo.setDiaoboxiangqingCode("RK"+chukudanpo.getChukuxiangguandanCode());
			diaoboxiangqingpo.setDiaoboxiangqingSku(bianjipoo.getBjskuCode());
			diaoboxiangqingpo.setDiaoboxiangqingName(bianjipoo.getBjgoodName());
			diaoboxiangqingpo.setDiaoboxiangqingAttribute(bianjipoo.getBjgoodProperty());
			diaoboxiangqingpo.setDiaoboxiangqingWarehouse(bianjipoo.getBjcangku());
			diaoboxiangqingpo.setDiaoboxiangqingInNeed(Integer.parseInt(xu));
			diaoboxiangqingpo.setDiaoboxiangqingInFinish(Integer.parseInt(yi));
			diaoboxiangqingpo.setDiaoboxiangqingNote(bianjipoo.getBjbeizhu());
			
			UserInfoVO userInfovo = (UserInfoVO) req.getSession().getAttribute("userInfoVO");
			int bossid=userInfovo.getBossPO().getUserID();
			DiaoborukuDao diaoborukudao = new DiaoborukuDaoImpl();
			diaoborukudao.getInsert(bossid, diaoborukupo);
			
			DiaoboxiangqingDao diaoboxiangqingdao = new DiaoboxiangqingDaoImpl();
			diaoboxiangqingdao.getInsert(bossid, diaoboxiangqingpo);
			
			
			
			req.getRequestDispatcher("/servlet/kuguan/chukudan/one?op=diaobo").forward(req, resp);
		}else{
			req.getRequestDispatcher("/servlet/kuguan/chukudan/one?op=caigou").forward(req, resp);
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
