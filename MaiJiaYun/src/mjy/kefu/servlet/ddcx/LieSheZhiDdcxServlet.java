package mjy.kefu.servlet.ddcx;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mjy.kefu.beans.LieshezhiddcxVO;
import mjy.kefu.dao.LieSheZhiDdcxQuery;
import mjy.login.beans.vo.UserInfoVO;
import net.sf.json.JSONArray;


/**
 * Servlet implementation class LieSheZhiDdcxServlet
 */
@WebServlet("/LieSheZhiDdcxServlet")
public class LieSheZhiDdcxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private LieSheZhiDdcxQuery lieshezhiddcx = new LieSheZhiDdcxQuery();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LieSheZhiDdcxServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    //查询数据库每列的显示不显示顺序以及字段名
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json;charset=utf-8");
		PrintWriter out = response.getWriter();
		ArrayList<LieshezhiddcxVO> result = null;
		UserInfoVO userInfoVO = (UserInfoVO) request.getSession().getAttribute("userInfoVO");
		int userId = userInfoVO.getUserPO().getUserId();
		result= (ArrayList<LieshezhiddcxVO>) lieshezhiddcx.LieshezhiddcxQuery(userId);
		JSONArray array = JSONArray.fromObject(result);
	    String jsonStr = array.toString();
	    out.println(jsonStr);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
