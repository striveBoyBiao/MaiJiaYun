package mjy.caiwu.shoukuan.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mjy.caiwu.jichuziliao.service.FuKuanAccountService;
import mjy.caiwu.jichuziliao.service.impl.FuKuanAccountServiceImpl;
import mjy.caiwu.jichuziliao.vo.FuKuanAccountVO;
import mjy.caiwu.shoukuan.beans.CwShouKuanVO;
import mjy.caiwu.shoukuan.service.CwShouKuanService;
import mjy.caiwu.shoukuan.service.impl.CwShouKuanServiceImpl;
import mjy.login.beans.vo.UserInfoVO;

/**
 * 获取收款详情
 * @author student
 *
 */
@WebServlet("/servlet/cw/shouKuanXiangQing")
public class ShouKuanXiangQingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int skId=request.getParameter("skId")==null?1:Integer.parseInt(request.getParameter("skId"));
		CwShouKuanService cwShouKuanService  = new CwShouKuanServiceImpl();
		CwShouKuanVO cwShouKuanVO = cwShouKuanService.queryCwShouKuanById(skId);	
		FuKuanAccountService fuKuanAccountService = new FuKuanAccountServiceImpl();
		List<FuKuanAccountVO> fuKuanAccounts = fuKuanAccountService.listBy();
		for (FuKuanAccountVO fuKuanAccountVO : fuKuanAccounts) {
			//判断银行id是否为空，如果不为空,查出对应的银行卡号及开户银行
			if(cwShouKuanVO.getFkzhBankId()!=null&&cwShouKuanVO.getFkzhBankId().equals(fuKuanAccountVO.getFkzhDafaultId()+"")){
				cwShouKuanVO.setFkzhBankCode(fuKuanAccountVO.getFkzhBankId());
				cwShouKuanVO.setFkzhBankName(fuKuanAccountVO.getFkzhBankName());
				break;
			}
		}
		if(cwShouKuanVO.getFkzhBankId()==null){
			cwShouKuanVO.setFkzhBankId("0");
		}
		request.setAttribute("cwShouKuanVO", cwShouKuanVO);
		request.setAttribute("fuKuanAccounts", fuKuanAccounts);
		
		request.getRequestDispatcher("/caiwu/shoukuan/shoukuanxiangqing.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
