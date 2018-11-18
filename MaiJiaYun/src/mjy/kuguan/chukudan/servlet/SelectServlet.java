package mjy.kuguan.chukudan.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mjy.kuguan.chukudan.po.ChuKuDanPO;
import mjy.kuguan.chukudan.po.Pager;
import mjy.kuguan.chukudan.service.IChuKuDanService;
import mjy.kuguan.chukudan.service.impl.ChuKuDanServiceImpl;

/**
 * Servlet implementation class OneServlet
 */
@WebServlet("/servlet/kuguan/chukudan/one")
public class SelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private IChuKuDanService chukudanservice = new ChuKuDanServiceImpl();
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;utf-8");
		String op=request.getParameter("op");
		//页码默认1，下面接收数据，如果没有就是1，有就是接收的页码
		int pageNum = 1;
		int pageSize = 10;
		
		try {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		} catch (Exception e) {}
		try {
			pageSize = Integer.parseInt(request.getParameter("pageSize"));
		} catch (Exception e) {	}
		
		if(op.equals("caigou")){
			caigou(pageNum,pageSize,request,response);
		}
		if(op.equals("diaobo")){
			diaobo(pageNum,pageSize,request,response);
		}
		if(op.equals("yiwancheng")){
			yiwancheng(pageNum,pageSize,request,response);
		}
		
		
	}

	
	/**
	 * 采购页面数据查询
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void caigou(int pageNum,int pageSize,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		Pager<ChuKuDanPO> cgall = chukudanservice.getAllcgu(pageNum, pageSize, null,null);
		request.setAttribute("cgall", cgall);
		request.getRequestDispatcher("/KuGuan/chukudan/jsp/caigoutuihuochuku.jsp").forward(request, response);
	}
	
	/**
	 * 调拨页面数据查询
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void diaobo(int pageNum,int pageSize,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		Pager<ChuKuDanPO> tball = chukudanservice.getAlltb(pageNum, pageSize, null,null);
		request.setAttribute("tball", tball);
		request.getRequestDispatcher("/KuGuan/chukudan/jsp/diaobochuku.jsp").forward(request, response);
	}
	
	/**
	 * 已完成页面数据查询
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void	yiwancheng(int pageNum,int pageSize,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		Pager<ChuKuDanPO> ywcall = chukudanservice.getAllywc(pageNum, pageSize, null,null);
		request.setAttribute("ywcall", ywcall);
		request.getRequestDispatcher("/KuGuan/chukudan/jsp/yiwanchengchuku.jsp").forward(request, response);
	}
	
	
	
	
	
	
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
