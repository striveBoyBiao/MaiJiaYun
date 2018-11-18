package mjy.caiwu.jichuziliao.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mjy.caiwu.jichuziliao.po.ShouZhiTypePO;
import mjy.caiwu.jichuziliao.service.ShouZhiTypeService;
import mjy.caiwu.jichuziliao.service.impl.ShouZhiTypeServiceImpl;
import mjy.caiwu.jichuziliao.vo.ShouZhiTypeVO;
import mjy.common.bean.PageInfo;
import mjy.common.servlet.BaseServlet;
import net.sf.json.JSONArray;

/**
 * Servlet implementation class ShouZhiTypeServlet
 */
@WebServlet("/ShouZhiTypeServlet")
public class ShouZhiTypeServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
       
    public void addShouZhiTypeMethod(HttpServletRequest request,HttpServletResponse response){
    	ShouZhiTypeService sService = new ShouZhiTypeServiceImpl();
		String shouZhiType = request.getParameter("shouZhiType");
		String showStatus = request.getParameter("showStatus");
		String comment = request.getParameter("comment");
		if (showStatus != null && !showStatus.equals("")) {
			sService.addShouZhiType(new ShouZhiTypeVO(shouZhiType, showStatus, comment));
		}
		ShouZhiTypeServlet.pageCountMethod(request, response);
    }
    
    public void updateShouZhiTypeMethod(HttpServletRequest request,HttpServletResponse response){
    	ShouZhiTypeService sService = new ShouZhiTypeServiceImpl();
		String updateIndex = request.getParameter("updateIndex");
		String updateShouZhiType = request.getParameter("updateShouZhiType");
		String updateShowStatus = request.getParameter("updateShowStatus");
		String updateComment = request.getParameter("updateComment");
		if (updateShouZhiType != null && !updateIndex.equals("") && updateShowStatus != null
				&& !updateShowStatus.equals("")) {
			sService.updateShouZhiType(new ShouZhiTypeVO(Integer.parseInt(updateIndex), updateShouZhiType, updateShowStatus,
					updateComment));
		}
		ShouZhiTypeServlet.pageCountMethod(request, response);
    }
    
    public static void pageCountMethod(HttpServletRequest request,HttpServletResponse response){
    	ShouZhiTypeService sService = new ShouZhiTypeServiceImpl();
		String rowCount = request.getParameter("rowCount");
		String pageValue = request.getParameter("pageValue");
		if (rowCount == null) {
			rowCount = "10";
		}
		if (pageValue == null) {
			pageValue = "1";
		}
		PageInfo<Object> pageInfo = new PageInfo<>(pageValue);
		PageInfo.pageSize = Integer.parseInt(rowCount);
		ShouZhiTypePO sPO = new ShouZhiTypePO();
		HttpSession session = request.getSession();
		pageInfo.setRowCount(sService.listBy(null).size());
		if((pageInfo.getRowCount() % PageInfo.pageSize)==0){
			pageInfo.setPageCount((pageInfo.getRowCount() / PageInfo.pageSize));
		}else{
			pageInfo.setPageCount((pageInfo.getRowCount() / PageInfo.pageSize) + 1);
		}
		session.setAttribute("rowCount", pageInfo.getRowCount());
		session.setAttribute("pageCount", pageInfo.getPageCount());
		sPO.setPageBegin((Integer.parseInt(pageInfo.getPageNo())-1)*PageInfo.pageSize);
		List<ShouZhiTypeVO> list = sService.listByPage(sPO);
		JSONArray jArray = JSONArray.fromObject(list);
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
		out.println(jArray);
    }
    
    public String requestDisToShouZhitype(HttpServletRequest request,HttpServletResponse response){
		return "/caiwu/jichuziliao/jsp/shouzhilx.jsp";
    }
    
    public String requestDisToFuKuanAccount(HttpServletRequest request,HttpServletResponse response){
		return "/caiwu/jichuziliao/jsp/fukuanzh.jsp";
    }
}
