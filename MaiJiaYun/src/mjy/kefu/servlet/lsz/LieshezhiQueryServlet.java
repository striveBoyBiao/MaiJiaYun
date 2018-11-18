package mjy.kefu.servlet.lsz;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mjy.kefu.beans.LieshezhiBeanPO;
import mjy.kefu.beans.LieshezhiBeanVO;
import mjy.kefu.dao.LieshezhiInsert;
import mjy.kefu.dao.LieshezhiQuery;
import mjy.kefu.dao.LieshezhiUpdate;
import mjy.login.beans.vo.UserInfoVO;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * Servlet implementation class LieshezhiQueryServlet
 */
@WebServlet("/LieshezhiQueryServlet")
public class LieshezhiQueryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private LieshezhiQuery lieshezhi = new LieshezhiQuery();//列设置查询数据库实例化
	LieshezhiUpdate lieshezhiUpdate = new LieshezhiUpdate();//列设置更新数据库实例化
	private LieshezhiInsert lieshezhiInsert = new LieshezhiInsert();
   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LieshezhiQueryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("application/json;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String page = request.getParameter("page");
		String state1 = request.getParameter("state1");
		String defaultStr = "";
		String lieshezhiStr = request.getParameter("lieshezhiArr");
		//获取用户信息
		UserInfoVO userInfoVO = (UserInfoVO) request.getSession().getAttribute("userInfoVO");
		int userId = userInfoVO.getUserPO().getUserId();
		if(state1.equals("1")){//查询数据库
			ArrayList<LieshezhiBeanPO> result = null;
			result = (ArrayList<LieshezhiBeanPO>) lieshezhi.lieshezhiQuery(page,userId,defaultStr);
			if(result.size()==0){
				boolean sss = lieshezhiInsert.lieshezhiInit(userId);
				result = (ArrayList<LieshezhiBeanPO>) lieshezhi.lieshezhiQuery(page,userId,defaultStr);
			}
			JSONArray array = JSONArray.fromObject(result);
		    String jsonStr = array.toString();
		    out.println(jsonStr);
		}else if(state1.equals("2")){
			ArrayList<LieshezhiBeanPO> result = null;
			defaultStr = "Default";//恢复默认设置操作要传入的字符串
			result = (ArrayList<LieshezhiBeanPO>) lieshezhi.lieshezhiQuery(page,userId,defaultStr);
			JSONArray array = JSONArray.fromObject(result);
		    String jsonStr = array.toString();
		    out.println(jsonStr);
		}else{//更新数据库
			JSONArray lieshezhiJsonObject = JSONArray.fromObject(lieshezhiStr);
			boolean result = true;
			
			for(int i = 0; i<lieshezhiJsonObject.size();i++){
				LieshezhiBeanVO lieshezhi = new LieshezhiBeanVO();
				lieshezhi.setLieTitle(((JSONObject) lieshezhiJsonObject.get(i)).getString("lieTitle"));
				lieshezhi.setShowName(((JSONObject)lieshezhiJsonObject.get(i)).get("showName")+"");
				lieshezhi.setState(((JSONObject)lieshezhiJsonObject.get(i)).getBoolean("state"));
				lieshezhi.setSequence(((JSONObject)lieshezhiJsonObject.get(i)).getInt("sequence"));
				result = result&&lieshezhiUpdate.lieshezhiUpdate(lieshezhi,page,userId);
			}
			JSONArray array = JSONArray.fromObject(result);
		    String jsonStr = array.toString();
		    out.println(jsonStr);
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
