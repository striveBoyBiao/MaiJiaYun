package mjy.kuguan.ruku.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mjy.kuguan.ruku.dao.CaigourukuDao;
import mjy.kuguan.ruku.dao.CaigouxiangqingDao;
import mjy.kuguan.ruku.dao.DiaoboxiangqingDao;
import mjy.kuguan.ruku.dao.TuihuoxiangqingDao;
import mjy.kuguan.ruku.dao.WanchengDao;
import mjy.kuguan.ruku.dao.impl.WanchengDaoImpl;
import mjy.kuguan.ruku.factory.DaoImplFactory;
import mjy.kuguan.ruku.po.CaigouxiangqingPO;
import mjy.kuguan.ruku.po.DiaoboxiangqingPO;
import mjy.kuguan.ruku.po.TuihuoxiangqingPO;
import mjy.kuguan.ruku.vo.XiangqingVO;
import mjy.login.beans.vo.UserInfoVO;
import net.sf.json.JSONArray;

@WebServlet("/servlet/RuKuXiangqingServlet")
public class RuKuXiangqingServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String code = req.getParameter("code");
		String type = req.getParameter("type");
		//设置响应数据
		resp.setContentType("text/json;charset=utf-8");
		PrintWriter out = resp.getWriter();
		//获取当前BossId
		UserInfoVO userInfoVO = (UserInfoVO)req.getSession().getAttribute("userInfoVO");
		int bossId = userInfoVO.getBossPO().getUserID();

		
		String note=null;
		List<XiangqingVO> resultList = new ArrayList<XiangqingVO>();
		WanchengDao wcDao = new WanchengDaoImpl();
		XiangqingVO vo =null;
		switch (type) {
		case "采购入库":
			CaigouxiangqingDao cDao = DaoImplFactory.getCaigouxiangqingDaoImpl();
			List<CaigouxiangqingPO> list=cDao.getSelectByCode(bossId, code);
			
			note=wcDao.listByRkd(bossId, code, 1, 1).get(0).getWanchengNote();
			
			for (CaigouxiangqingPO po : list) {
				vo = new XiangqingVO();
				vo.setXiangqingSku(po.getCaigouxiangqingSku());
				vo.setXiangqingName(po.getCaigouxiangqingName());
				vo.setXiangqingAttribute(po.getCaigouxiangqingAttribute());
				vo.setXiangqingWarehouse(po.getCaigouxiangqingWarehouse());
				vo.setXiangqingInNeed(po.getCaigouxiangqingInNeed());
				vo.setXiangqingInFinish(po.getCaigouxiangqingInFinish());
				vo.setXiangqingNote(po.getCaigouxiangqingNote());
				resultList.add(vo);
				
				
			}
			break;
		case "调拨入库":
			DiaoboxiangqingDao dDao = DaoImplFactory.getDiaoboxiangqingDaoImpl();
			List<DiaoboxiangqingPO> diaoboList = dDao.getSelectByCode(bossId, code);
			note=wcDao.listByRkd(bossId, code, 1, 1).get(0).getWanchengNote();
			
			for (DiaoboxiangqingPO dbPo : diaoboList) {
				vo = new XiangqingVO();
				vo.setXiangqingSku(dbPo.getDiaoboxiangqingSku());
				vo.setXiangqingName(dbPo.getDiaoboxiangqingName());
				vo.setXiangqingAttribute(dbPo.getDiaoboxiangqingAttribute());
				vo.setXiangqingWarehouse(dbPo.getDiaoboxiangqingWarehouse());
				vo.setXiangqingInNeed(dbPo.getDiaoboxiangqingInNeed());
				vo.setXiangqingInFinish(dbPo.getDiaoboxiangqingInFinish());
				vo.setXiangqingNote(dbPo.getDiaoboxiangqingNote());
				resultList.add(vo);
			}
			
			break;
		case "销售退货入库":
			TuihuoxiangqingDao tDao = DaoImplFactory.getTuihuoxiangqingDaoImpl();
			List<TuihuoxiangqingPO> tuihuoList = tDao.getSelectByCode(bossId, code);
			note=wcDao.listByRkd(bossId, code, 1, 1).get(0).getWanchengNote();
			
			for (TuihuoxiangqingPO thPo : tuihuoList) {
				vo = new XiangqingVO();
				vo.setXiangqingSku(thPo.getTuihuoxiangqingSku());
				vo.setXiangqingName(thPo.getTuihuoxiangqingName());
				vo.setXiangqingAttribute(thPo.getTuihuoxiangqingAttribute());
				vo.setXiangqingWarehouse(thPo.getTuihuoxiangqingWarehouse());
				vo.setXiangqingInNeed(thPo.getTuihuoxiangqingInNeed());
				vo.setXiangqingInFinish(thPo.getTuihuoxiangqingInOk());
				vo.setXiangqingNote(thPo.getTuihuoxiangqingNote());
				resultList.add(vo);
			}
			
			break;
		}
		JSONArray jsonArray = JSONArray.fromObject(resultList);
		out.print("{" 
				+ "\"json\":"
				+ jsonArray.toString() 
				+ ", \"note\":"
				+ "\"" + note + "\""
				+ "}");
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
