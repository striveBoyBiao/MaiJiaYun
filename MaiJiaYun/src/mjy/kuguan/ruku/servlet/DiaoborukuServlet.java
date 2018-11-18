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
import javax.servlet.http.HttpSession;

import mjy.kuguan.ruku.po.DiaoborukuPO;
import mjy.kuguan.ruku.service.DiaoborukuService;
import mjy.login.beans.vo.UserInfoVO;

@WebServlet("/servlet/DiaoborukudanServlet")
public class DiaoborukuServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		DiaoborukuService diaoborukuService = new DiaoborukuService();
		//获取当前BossId
		UserInfoVO userInfoVO = (UserInfoVO)req.getSession().getAttribute("userInfoVO");
		int bossId = userInfoVO.getBossPO().getUserID();
		
		if(req.getParameter("pageNumber") == null){
			req.setAttribute("caigouDataCount", diaoborukuService.getOtherPageDataCount(bossId).get(0));
			req.setAttribute("tuihuoDataCount", diaoborukuService.getOtherPageDataCount(bossId).get(1));
			req.setAttribute("diaoboDataCount", diaoborukuService.getOtherPageDataCount(bossId).get(2));
			req.getRequestDispatcher("/KuGuan/RuKu/DiaoBoRuKu/index.jsp").forward(req, resp);
			return;
		}
		
		int pageNumber = Integer.parseInt(req.getParameter("pageNumber"));
		int pageSize = Integer.parseInt(req.getParameter("pageSize"));
		String searchKey = req.getParameter("searchKey");
		String searchWarehouse = req.getParameter("searchWarehouse").trim();
		
		//设置响应数据
		resp.setContentType("text/xml;charset=utf-8");
		
		//设置写出
		PrintWriter out = resp.getWriter();
		StringBuffer sb = new StringBuffer();
		
		List<DiaoborukuPO> list = new ArrayList<DiaoborukuPO>();
		int count = 0;
		
		//判断是否存在查询条件
		if(searchKey.equals("")){
			list = diaoborukuService.selectAll(bossId, 1, diaoborukuService.allCount(bossId));
			count = diaoborukuService.allCount(bossId);

		}else{
			if(diaoborukuService.selectByCode(bossId, 1, diaoborukuService.allCount(bossId), searchKey) != null){
				list.addAll(diaoborukuService.selectByCode(bossId, 1, diaoborukuService.allCount(bossId), searchKey));
				count += diaoborukuService.countByCode(bossId, searchKey);
			}
			
			if(diaoborukuService.selectByDiaobodanCode(bossId, 1, diaoborukuService.allCount(bossId), searchKey) != null){
				list.addAll(diaoborukuService.selectByDiaobodanCode(bossId, 1, diaoborukuService.allCount(bossId), searchKey));
				count += diaoborukuService.countByDiaobodanCode(bossId, searchKey);
			}
			
			if(diaoborukuService.selectByAuthor(bossId, 1, diaoborukuService.allCount(bossId), searchKey) != null){
				list.addAll(diaoborukuService.selectByAuthor(bossId, 1, diaoborukuService.allCount(bossId), searchKey));
				count += diaoborukuService.countByAuthor(bossId, searchKey);
			}
		}
	
		//剔除重复数据
		List<String> codeList = new ArrayList<String>();
		List<DiaoborukuPO> tempList = new ArrayList<DiaoborukuPO>();
		for (DiaoborukuPO po : list) {
			if(!codeList.contains(po.getDiaoboCode())){
				codeList.add(po.getDiaoboCode());
				tempList.add(po);
			}
		}
		list = tempList;
		 
		
		//判断是否分库查询
		if(!(searchWarehouse.equals("入库仓库") || searchWarehouse.equals("所有仓库"))){
			if(list != null){
				
				List<DiaoborukuPO> filterList = new ArrayList<DiaoborukuPO>();
				int pageCount = (int)(diaoborukuService.allCount(bossId) - 1) / pageSize + 1;//获取库中总数据页数
				System.out.println(pageCount);

				for (DiaoborukuPO po : list) {
					if(po.getDiaoboWarehouse().equals(searchWarehouse)){
						filterList.add(po);
					}
				}

				count = filterList.size();//刷新搜索数据量
				//System.out.println("count:" + count + "\nsubfrom:" + (pageNumber - 1) * pageSize + "\nsubto:" + (pageNumber * pageSize > filterList.size() ? filterList.size() : pageNumber * pageSize));
				list = filterList;
			}	
		}
		
		//设置分页
		List<DiaoborukuPO> listByPage = list.subList((pageNumber - 1) * pageSize, pageNumber * pageSize > list.size() ? list.size() : pageNumber * pageSize);

		sb.append("<diaoboData>");
		for (DiaoborukuPO po : listByPage) {
			sb.append("<diaobodan>");
			
			sb.append("<diaoboCode>");
			sb.append(po.getDiaoboCode());
			sb.append("</diaoboCode>");
			
			sb.append("<diaoboDiaobodanCode>");
			sb.append(po.getDiaoboDiaobodanCode());
			sb.append("</diaoboDiaobodanCode>");
			
			sb.append("<diaoboWarehouse>");
			sb.append(po.getDiaoboWarehouse());
			sb.append("</diaoboWarehouse>");
			
			sb.append("<diaoboInCount>");
			sb.append(po.getDiaoboInCount());
			sb.append("</diaoboInCount>");
			
			sb.append("<diaoboInFinish>");
			sb.append(po.getDiaoboInFinish());
			sb.append("</diaoboInFinish>");
			
			sb.append("<diaoboSetTime>");
			sb.append(po.getDiaoboSetTime());
			sb.append("</diaoboSetTime>");
			
			sb.append("<diaoboAuthor>");
			sb.append(po.getDiaoboAuthor());
			sb.append("</diaoboAuthor>");

			//未传递diaoboNote
			
			sb.append("</diaobodan>");
		}
		
		//设置数据总数
		sb.append("<diaoboTotalNumber>");
		sb.append(diaoborukuService.allCount(bossId));
		sb.append("</diaoboTotalNumber>");
		
		//设置当前查询数据数量
		sb.append("<diaoboSelectNumber>");
		sb.append(count);
		sb.append("</diaoboSelectNumber>");
		
		//设置仓库列表
		List<String> warehouseList = diaoborukuService.allWarehouse(bossId);
		sb.append("<diaoboWarehouse>");
		for (String warehouse : warehouseList) {
			sb.append("<diaoboWarehouseName>");
			sb.append(warehouse);
			sb.append("</diaoboWarehouseName>");
		}
		sb.append("</diaoboWarehouse>");
		
		//设置采购页数据数
		sb.append("<diaoboCaigouData>");
		sb.append(diaoborukuService.getOtherPageDataCount(bossId).get(0));
		sb.append("</diaoboCaigouData>");
		
		//设置退货页数据数
		sb.append("<diaoboTuihuoData>");
		sb.append(diaoborukuService.getOtherPageDataCount(bossId).get(1));
		sb.append("</diaoboTuihuoData>");
		
		sb.append("</diaoboData>");
		
		out.println(sb.toString());
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
