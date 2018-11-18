package mjy.caigou.servlet.sp;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import mjy.caigou.po.GoodsPO;
import mjy.caigou.service.SPService;
import mjy.caigou.service.impl.SPServiceImpl;
import mjy.caigou.vo.GoodGroupVO;
import mjy.caigou.vo.GoodUserStatusVO;
import mjy.caigou.vo.GoodsVO;
import mjy.common.servlet.BaseServlet;
import mjy.login.beans.vo.UserInfoVO;
import net.sf.json.JSONArray;


@WebServlet("/servlet/cg/xinzengsp")
public class XinZengShangPin extends BaseServlet {
	
	
	
	public void toXZSP(HttpServletRequest request,HttpServletResponse response){
		try {
			request.getRequestDispatcher("/CaiGou/jsp/sp/xinzengshangpin.jsp").forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void dropdownBox(HttpServletRequest request,HttpServletResponse response){
		
		try {
			request.setCharacterEncoding("utf-8");
			response.setContentType("application/json;charset=utf-8");
			PrintWriter out=response.getWriter();
			SPService goodgroupservice=new SPServiceImpl();
			List<GoodGroupVO> list=goodgroupservice.getGoodGroups();
			
			JSONArray json=JSONArray.fromObject(list);
			
			System.out.println(json);
			
			out.println(json.toString());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	
		
		
	}
	
	
	public void baocun(HttpServletRequest request,HttpServletResponse response){
		
		try {
			request.setCharacterEncoding("utf-8");
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out=response.getWriter();
			SPService goods=new SPServiceImpl();
			
			UserInfoVO userinfovo=(UserInfoVO) request.getSession().getAttribute("userInfoVO");
			
			int userId=userinfovo.getUserPO().getUserId();
			List<GoodsPO> goodspo=goods.getAllGoods(userId);
			
			/**
			 * ��ȡ��Ʒskucode����
			 */
			
			String sku=request.getParameter("sku");
			String goodGroupId=request.getParameter("goodGroupId");
			String goodName=request.getParameter("goodName");
			String goodPrice=request.getParameter("goodPrice");
			String goodId=request.getParameter("goodId");		
			String  goodWeight= request.getParameter("goodWeight");
			String goodPicture=request.getParameter("goodPicture");
			if(goodPicture!=null){
				
				System.out.println("111");
			}
			
			
			
			GoodsVO good=new GoodsVO();
			GoodUserStatusVO gusvo=new GoodUserStatusVO();
			gusvo.setGoodId(Integer.parseInt(goodId));
			gusvo.setUserId(userId);
			gusvo.setGoodName(goodName);
			good.setGoodId(Integer.parseInt(goodId));
			good.setSku(sku);
			good.setGoodName(goodName);
			good.setGoodPrice(Double.valueOf(goodPrice));
			good.setGoodGroupId(Integer.parseInt(goodGroupId));
			good.setGoodWeight(Double.valueOf(goodWeight));
			good.setGoodPicture(goodPicture);
			
			
			
			for(GoodsPO po:goodspo){
				if(po.getSku()!=null){
					if(po.getSku().equals(sku)){
						out.println("error");
						return ;
					}
				}
				
			}
			goods.addGood(good);
			goods.addGoodUser(gusvo);
			
			out.println("ok");
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
	
	
	public void goodedit(HttpServletRequest request,HttpServletResponse response){
		
		
		
		try {
			String goodId=request.getParameter("goodId");;
			String sku=request.getParameter("sku");;
			String goodGroupId=request.getParameter("goodGroupId");;
			String goodName=request.getParameter("goodName");;
			String goodPrice=request.getParameter("goodPrice");;
			String goodWeight=request.getParameter("goodWeight");;
			String goodPicture=request.getParameter("goodPicture");;
			
			
			
			
			GoodsPO goodpo=new GoodsPO();
			goodpo.setGoodId(Integer.parseInt(goodId));
			goodpo.setSku(sku);
			goodpo.setGoodGroupId(Integer.parseInt(goodGroupId));
			goodpo.setGoodName(goodName);
			goodpo.setGoodPicture(goodPicture);
			goodpo.setGoodPrice(Double.valueOf(goodPrice));
			goodpo.setGoodWeight(Double.valueOf(goodWeight));
			
		    request.setAttribute("goodpo", goodpo);
		
			request.getRequestDispatcher("/CaiGou/jsp/sp/goodedit.jsp").forward(request, response);
			
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void  goodedit1(HttpServletRequest request,HttpServletResponse response){
		
		try {
			request.setCharacterEncoding("utf-8");
			
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out=response.getWriter();
			SPService goods=new SPServiceImpl();
			
			UserInfoVO userinfovo=(UserInfoVO) request.getSession().getAttribute("userInfoVO");
			
			int userId=userinfovo.getUserPO().getUserId();
			List<GoodsPO> goodspo=goods.getAllGoods(userId);
			GoodsPO goodedit=null;
			int goodId=Integer.parseInt(request.getParameter("goodId"));
			//ͨ����Ʒid�ҵ�����Ʒ
			for(GoodsPO good:goodspo){
				if(good.getGoodId()==goodId){
					goodedit=good;
				}
			}
			
			 request.setAttribute("goodpo", goodedit);
				
				request.getRequestDispatcher("/CaiGou/jsp/sp/goodedit.jsp").forward(request, response);
			System.out.println(goodId);
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
		
		
	}
	
	
	
	
	
	
	public void goodpicture(HttpServletRequest request,HttpServletResponse response){

		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		response.setContentType("text/html;charset=utf-8");
		
		
		// �ж��Ƿ����ļ���������
		if (ServletFileUpload.isMultipartContent(request)) {

			

			DiskFileItemFactory factor = new DiskFileItemFactory();

			ServletFileUpload upload = new ServletFileUpload(factor);

			try {
				List<FileItem> item = upload.parseRequest(request);

				for (FileItem file : item) {

					if (file.isFormField()) {

						

					} else {

						
						String fieldName = file.getFieldName();
						String fileName = file.getName();

						if (fieldName.equals("picUrl")) {
							System.out.println(getServletContext().getContextPath());
							
						}
						long time=System.currentTimeMillis();

						String path=getServletContext().getContextPath() + "/CaiGou/img/"+time+ fileName;
						//String path ="E:/img/"+ fileName;
						String path1=getServletContext().getRealPath("/CaiGou/img/") +time+ fileName;
						File filesave = new File(path1);
						file.write(filesave);
						PrintWriter out=response.getWriter();
						out.println(path);
						System.out.println(path);

					}

				}

			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			
		}
		
		
		
	}
	
	public void goodeditbaocun(HttpServletRequest request,HttpServletResponse response){
		
		
		try {
			request.setCharacterEncoding("utf-8");
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out=response.getWriter();
			SPService goods=new SPServiceImpl();
			
			UserInfoVO userinfovo=(UserInfoVO) request.getSession().getAttribute("userInfoVO");
			
			int userId=userinfovo.getUserPO().getUserId();
			
			String sku=request.getParameter("sku");
			String goodGroupId=request.getParameter("goodGroupId");
			String goodName=request.getParameter("goodName");
			String goodPrice=request.getParameter("goodPrice");
			String goodId=request.getParameter("goodId");		
			String  goodWeight= request.getParameter("goodWeight");
			String goodPicture=request.getParameter("goodPicture");
			
			
			
			
			GoodsVO good=new GoodsVO();
			GoodUserStatusVO gusvo=new GoodUserStatusVO();
			gusvo.setGoodId(Integer.parseInt(goodId));
			gusvo.setUserId(userId);
			gusvo.setGoodName(goodName);
			good.setGoodId(Integer.parseInt(goodId));
			good.setSku(sku);
			good.setGoodName(goodName);
			good.setGoodPrice(Double.valueOf(goodPrice));
			good.setGoodGroupId(Integer.parseInt(goodGroupId));
			good.setGoodWeight(Double.valueOf(goodWeight));
			good.setGoodPicture(goodPicture);
			String oldsku=request.getParameter("oldsku");
			String oldGoodId=request.getParameter("oldgoodId");
			
			List<GoodsPO> goodspo=goods.getAllGoods(userId);
			

			for(GoodsPO po:goodspo){
				if(po.getSku()!=null){
					if(!po.getSku().equals(oldsku)){
						if(po.getSku().equals(sku)){
							out.println("error");
							return ;
						}
					}
					
				}
				
			}
			
			System.out.println("zzzbbbbb");
			System.out.println(good);
			goods.updateGoods(oldsku, good);
			goods.updateGoodUserStatus(oldGoodId, gusvo);
			out.println("ok");
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}
	
	
	
}
