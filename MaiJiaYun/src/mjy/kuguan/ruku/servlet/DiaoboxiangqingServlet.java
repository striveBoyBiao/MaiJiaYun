package mjy.kuguan.ruku.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mjy.kuguan.ruku.po.DiaoboxiangqingPO;
import mjy.kuguan.ruku.service.DiaoborukuService;
import mjy.kuguan.ruku.service.DiaoboxiangqingService;
import mjy.login.beans.vo.UserInfoVO;
import net.sf.json.JSONArray;

@WebServlet("/servlet/DiaoboxiangqingServlet")
public class DiaoboxiangqingServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String diaoboxiangqingCode = req.getParameter("diaoboxiangqingCode");
		String inCode = req.getParameter("inCode");
		String inSku = req.getParameter("inSku");
		String inNumber = req.getParameter("inNumber");
		String inGoodsNote = req.getParameter("inGoodsNote");
		String inCodeNote = req.getParameter("inCodeNote");
		String inWarehouseCode = req.getParameter("inWarehouseCode");
		
		//获取当前BossId
		UserInfoVO userInfoVO = (UserInfoVO)req.getSession().getAttribute("userInfoVO");
		int bossId = userInfoVO.getBossPO().getUserID();
		
		//判断是否完成入库
		if(inWarehouseCode != null){
			//获取入库确认人
			int checker = userInfoVO.getUserPO().getUserId();
			submitInWarehouse(bossId, inWarehouseCode, checker);
			return;
		}
		
		DiaoboxiangqingService diaoboxiangqingService = new DiaoboxiangqingService();
		DiaoborukuService diaoborukuService = new DiaoborukuService();
		
		//初始化详情页
		if(diaoboxiangqingCode != null){
	
			resp.setContentType("text/json;charset=utf-8");
			PrintWriter out = resp.getWriter();
			
			List<DiaoboxiangqingPO> list = diaoboxiangqingService.getAll(bossId, diaoboxiangqingCode);
			String diaoboNote = diaoborukuService.getNote(bossId, diaoboxiangqingCode);
			
			//使用JSONArray封装对象数组
			JSONArray jsonArray = JSONArray.fromObject(list);
			//[{"diaoboxiangqingInFinish":10,"diaoboxiangqingCode":"RKDB2016120600000","diaoboxiangqingNote":"23","diaoboxiangqingAttribute":"n","diaoboxiangqingSku":"100001-1","diaoboxiangqingId":"17225372-1481029085277","diaoboxiangqingWarehouse":"仓库2","diaoboxiangqingName":"哑铃","diaoboxiangqingInNeed":10},{"diaoboxiangqingInFinish":10,"diaoboxiangqingCode":"RKDB2016120600000","diaoboxiangqingNote":"2333","diaoboxiangqingAttribute":"n","diaoboxiangqingSku":"100002-1","diaoboxiangqingId":"17225372-1481029146101","diaoboxiangqingWarehouse":"默认仓库","diaoboxiangqingName":"连衣裙","diaoboxiangqingInNeed":10}]
			out.print("{" 
					+ "\"json\":"
					+ jsonArray.toString() 
					+ ", \"note\":"
					+ "\"" + diaoboNote + "\""
					+ "}");
		
		//数据入库
		}else{
			//设置商品入库数量
			diaoboxiangqingService.setInCount(bossId, inCode, inSku, Integer.parseInt(inNumber));
			//设置商品备注
			diaoboxiangqingService.setInGoodsNote(bossId, inCode, inSku, inGoodsNote);
			//设置入库单备注
			diaoborukuService.setNote(bossId, inCode, inCodeNote);
			//设置本单入库数量
			diaoboxiangqingService.setInCount(bossId, inCode);
		}
	}
	
	//入库完成
	private void submitInWarehouse(int bossId, String inCode, int checker) {
		// TODO Auto-generated method stub
		new DiaoboxiangqingService().inWarehouse(bossId, inCode, checker);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
