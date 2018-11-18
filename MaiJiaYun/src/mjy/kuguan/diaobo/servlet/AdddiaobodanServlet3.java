package mjy.kuguan.diaobo.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mjy.common.util.other.CodeGenerate;
import mjy.kuguan.diaobo.po.DiaobodanstatePO;
import mjy.kuguan.diaobo.po.GoodsPO;
import mjy.kuguan.diaobo.service.DiaobodanService;
import mjy.kuguan.diaobo.service.WarehouseService;
import mjy.kuguan.diaobo.service.impl.DiaobodanServiceImpl;
import mjy.kuguan.diaobo.service.impl.WarehouseServiceImpl;
import mjy.kuguan.diaobo.vo.DiaobodanVO;
import mjy.login.beans.vo.UserInfoVO;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;


@WebServlet("/AdddiaobodanServlet3")
public class AdddiaobodanServlet3 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 DiaobodanService diaobodanService=new DiaobodanServiceImpl();

		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			response.setContentType("application/json,charset=utf-8");
			
			UserInfoVO userInfoVO=(UserInfoVO) request.getSession().getAttribute("userInfoVO");
			String diaobodanCreater=userInfoVO.getUserPO().getUserNickname();
			int bossUserId=userInfoVO.getUserPO().getUserId();
			String diaobodanCode=CodeGenerate.getCode(bossUserId, CodeGenerate.DIAOBODAN_CODE, 3);
			//System.out.println(diaobodanCode);
			//获取参数
			String diaochuCangku=request.getParameter("diaochuCangku");
			String diaoruCangku=request.getParameter("diaoruCangku");
			String beizhu=request.getParameter("beizhu");
			String diaoboInfo=request.getParameter("diaoboInfo");
			
			JSONArray diaoboInfoArray=JSONArray.fromObject(diaoboInfo);
			
			
			List<DiaobodanVO> diaobodanVOs=new ArrayList<>();
			List<DiaobodanstatePO> diaobodanstatePOs=new ArrayList<>();
			for (int index = 0; index < diaoboInfoArray.size(); index++){
				DiaobodanstatePO diaobodanstatePO=new DiaobodanstatePO();
				diaobodanstatePO.setDiaobodanCode(diaobodanCode);
				diaobodanstatePO.setDiaobodanCreater(diaobodanCreater);
				diaobodanstatePO.setDiaobodanOutStore(diaochuCangku);
				diaobodanstatePO.setDiaobodanInStore(diaoruCangku);
				diaobodanstatePO.setDiaoboState("1");
				diaobodanstatePO.setDiaoboBeizhu(beizhu);
				diaobodanstatePOs.add(diaobodanstatePO);
				
				DiaobodanVO diaobodanVO=new DiaobodanVO();
				diaobodanVO.setDiaobodanCode(diaobodanCode);
				diaobodanVO.setSku(((JSONObject)diaoboInfoArray.get(index)).get("sku")+"");
				diaobodanVO.setGoodName(((JSONObject)diaoboInfoArray.get(index)).get("goodName")+"");
				diaobodanVO.setGoodProperty(((JSONObject)diaoboInfoArray.get(index)).get("goodProperty")+"");
				diaobodanVO.setGoodRepertory(Integer.parseInt(((JSONObject)diaoboInfoArray.get(index)).get("goodRepertory")+""));
				diaobodanVO.setOutNumber(Integer.parseInt(((JSONObject)diaoboInfoArray.get(index)).get("outNumber")+""));
				diaobodanVO.setBeizhu(((JSONObject)diaoboInfoArray.get(index)).get(beizhu)+"");
				diaobodanVOs.add(diaobodanVO);
				
				
			}
					
			boolean result2=diaobodanService.insertDiaobodanstate(diaobodanstatePOs);
			boolean result1=diaobodanService.insertDiaobodan(diaobodanVOs);
			
			boolean result=false;
			if(result1&&result2){
				result=true;
			}
			
			JSONArray array=JSONArray.fromObject(result);
			String jsonstr=array.toString();
			response.getWriter().println(jsonstr);
			
		}


	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
