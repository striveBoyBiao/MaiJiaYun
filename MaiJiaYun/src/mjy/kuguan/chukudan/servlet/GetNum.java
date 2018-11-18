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
			
			int pageNum = 1;//Ĭ��ҳ��
			try {
				pageNum = Integer.parseInt(request.getParameter("pageNum"));
			} catch (Exception e) {}
			
			int pageSize = 10;//Ĭ�ϵ�ҳ���С
			try {
				pageSize = Integer.parseInt(request.getParameter("pageSize"));
			} catch (Exception e) {}
			
			String cangku  = null;//��òֿ�
			try {
				cangku = request.getParameter("cangku");
			} catch (Exception e) {}
			
			String chukunum = null;//����������ѯ����
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
		 * �����ҳ��
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
		 * ����ҳ��
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
		 * �ɹ�ҳ��
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
			JSONObject jobjs = new JSONObject(); //����һ��JSON����
			JSONArray jarr = new JSONArray();	//����һ��JSON����
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
			jobjs.put("pageNum", p.getPageNum());//�ڼ�ҳ
			jobjs.put("pageSize", p.getPageSize());//ҳ���С
			jobjs.put("maxPageNum", p.getMaxPageNum());//���ҳ��
			jobjs.put("maxNum", p.getMaxNum());//����ѯ����
			jobjs.put("pageData", jarr);//��ѯ����
			jobjs.put("isempty", "a");
			jobjs.put("cangkus", cangkus);//��ѯ�ֿ�
			return jobjs.toString();
			
		}
		
		
		/**
		 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
		 */
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			doGet(request, response);
		}

	}

