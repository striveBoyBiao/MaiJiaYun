package mjy.kuguan.chukudan.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mjy.kuguan.chukudan.dao.IChuKuDanDao;
import mjy.kuguan.chukudan.dao.impl.ChuKuDanImpl;
import mjy.kuguan.chukudan.po.ChuKuDanPO;
import mjy.kuguan.chukudan.po.Pager;
import mjy.kuguan.chukudan.service.IChuKuDanService;
import mjy.kuguan.chukudan.service.impl.ChuKuDanServiceImpl;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * Servlet implementation class GetNum
 */
@WebServlet("/getNum")
public class GetNum extends HttpServlet {
	private static final long serialVersionUID = 1L;
		private IChuKuDanService chukudan = new ChuKuDanServiceImpl();
		/**
		 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
		 */
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			response.setContentType("application/json;charset=utf-8");
			
			int pageNum = 1;//默认页码
			try {
				pageNum = Integer.parseInt(request.getParameter("pageNum"));
			} catch (Exception e) {}
			
			int pageSize = 10;//默认的页面大小
			try {
				pageSize = Integer.parseInt(request.getParameter("pageSize"));
			} catch (Exception e) {}
			
			String cangku  = null;//获得仓库
			try {
				cangku = request.getParameter("cangku");
			} catch (Exception e) {}
			
			String chukunum = null;//获得搜索框查询条件
			try {
				chukunum = request.getParameter("sousuo");
			} catch (Exception e) {}
			String op = request.getParameter("op");
			
			if(op.equals("caigou")){
				caigou(pageNum,pageSize,chukunum, cangku,request, response);
			}
			if(op.equals("diaobo")){
				diaobo(cangku,pageNum,pageSize,chukunum, request, response);
			}
			if(op.equals("yiwancheng")){
				yiwancheng(cangku,pageNum,pageSize,chukunum, request, response);
			}
			
			
		}
		/**
		 * 已完成页面
		 * @param op2 
		 * @param request
		 * @param response
		 */
		private void yiwancheng(String cangku,int pageNum,int pageSize,String chukunum, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
			Pager<ChuKuDanPO> pager = chukudan.getAllywc(pageNum, pageSize, chukunum, cangku);
			if(pager == null){
				response.getWriter().write("{\"isempty\":\"b\"}");
			}else{
				List<ChuKuDanPO> list = pager.getData();
				List<ChuKuDanPO> cangkus = pager.getCangkus();
				response.getWriter().write(jobjs(list,cangkus,pager));
			}
		}
		/**
		 * 调拨页面
		 * @param op2 
		 * @param request
		 * @param response
		 */
		private void diaobo(String cangku,int pageNum,int pageSize,String chukunum, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
			Pager<ChuKuDanPO> pager = chukudan.getAlltb(pageNum, pageSize, chukunum, cangku);
			if(pager == null){
				response.getWriter().write("{\"isempty\":\"b\"}");
			}else{
				List<ChuKuDanPO> list = pager.getData();
				List<ChuKuDanPO> cangkus = pager.getCangkus();
				response.getWriter().write(jobjs(list,cangkus,pager));
			}
			
		}
		/**
		 * 采购页面
		 * @param op2 
		 * @param request
		 * @param response
		 */
		private void caigou(int pageNum,int pageSize,String chukunum,String cangku, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
			
			Pager<ChuKuDanPO> pager = chukudan.getAllcgu(pageNum, pageSize, chukunum,cangku);
			if(pager == null){
				response.getWriter().write("{\"isempty\":\"b\"}");
			}else{
				List<ChuKuDanPO> list = pager.getData();
				List<ChuKuDanPO> cangkus = pager.getCangkus();
				response.getWriter().write(jobjs(list,cangkus,pager));
			}
		}

		public String jobjs(List<ChuKuDanPO> list,List<ChuKuDanPO> cangkus,Pager p){
			JSONObject jobjs = new JSONObject(); //创建一个JSON对象
			JSONArray jarr = new JSONArray();	//创建一个JSON数组
			for (int i = 0; i < list.size(); i++) {
				JSONObject jobj = new JSONObject();
				jobj.put("chukudanId", list.get(i).getChukudanId());
				jobj.put("chukudanCode", list.get(i).getChukudanCode());
				jobj.put("chukuxiangguandanCode",list.get(i).getChukuxiangguandanCode());
				jobj.put("chukuType", list.get(i).getChukuType());
				jobj.put("chukuCangku", list.get(i).getChukuCangku());
				jobj.put("chukuNum", list.get(i).getChukuNum());
				jobj.put("chukuPeople", list.get(i).getChukuPeople());
				jobj.put("chukudanTime", list.get(i).getChukudanTime());
				jarr.add(i, jobj);
			}
			jobjs.put("pageNum", p.getPageNum());//第几页
			jobjs.put("pageSize", p.getPageSize());//页面大小
			jobjs.put("maxPageNum", p.getMaxPageNum());//最大页码
			jobjs.put("maxNum", p.getMaxNum());//最大查询数量
			jobjs.put("pageData", jarr);//查询集合
			jobjs.put("isempty", "a");
			jobjs.put("cangkus", cangkus);//查询仓库
			return jobjs.toString();
			
		}
		
		
		/**
		 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
		 */
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			doGet(request, response);
		}

	}

