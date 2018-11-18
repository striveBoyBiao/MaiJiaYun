package mjy.login.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import mjy.common.servlet.BaseServlet;
import mjy.login.beans.po.BossPO;
import mjy.login.beans.po.PostPO;
import mjy.login.beans.po.RepPO;
import mjy.login.beans.po.UserPO;
import mjy.login.beans.vo.UserInfoVO;
import mjy.login.service.RepService;
import mjy.login.service.UserInfoService;
import mjy.login.service.Impl.PostLimitServiceImpl;
import mjy.login.service.Impl.RelationshipServiceImpl;
import mjy.login.service.Impl.RepServiceImpl;
import mjy.login.service.Impl.UserInfoServiceImpl;
import net.sf.json.JSONArray;

/**
 * Servlet implementation class LoginAction
 */
@WebServlet("/servlet/LoginActionServlet")
public class LoginActionServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	/**
	 * 退出
	 * @param request
	 * @param response
	 */
	public String logout(HttpServletRequest request, HttpServletResponse response){
		request.getSession().removeAttribute("userInfoVO");
		
		return "f:/ErrorRedirectServlet";
		
	}
	
	/**
	 *  保存用户信息
	 * @param request
	 * @param response
	 */
	public void saveUserInfo(HttpServletRequest request, HttpServletResponse response) {
		
		UserInfoService userInfoService = new UserInfoServiceImpl();
		//锟侥硷拷锟斤拷诺锟侥柯悸凤拷锟�
		String userImgPath = "/Login/files/userImg/";
		//锟斤拷时目录
		String fileTempPath = request.getContextPath() + "/Login/files/temp/";
		//锟侥硷拷锟斤拷锟轿�5M
		int sizeThreshold = 1024 * 1024 * 5;
		try {
			UserInfoVO userInfoVO = (UserInfoVO) (request.getSession().getAttribute("userInfoVO"));
			UserPO userPO = userInfoVO.getUserPO();
			
			DiskFileItemFactory diskFileItemFactory = new DiskFileItemFactory(sizeThreshold, new File(fileTempPath));
			ServletFileUpload fileUpload = new ServletFileUpload(diskFileItemFactory);
			//锟斤拷锟斤拷锟斤拷锟捷斤拷锟斤拷锟斤拷FileItem锟侥硷拷锟斤拷
			List<FileItem> items = fileUpload.parseRequest(request);
			
			//锟斤拷锟斤拷锟斤拷锟斤拷锟捷诧拷锟斤拷锟斤拷
			for (FileItem fileItem : items) {
				if (fileItem.isFormField()) {//锟斤拷锟斤拷锟斤拷锟酵拷锟斤拷锟斤拷荩锟斤拷锟斤拷锟斤拷锟斤拷平锟斤拷锟斤拷装锟斤拷userPO锟斤拷锟斤拷
					String value = fileItem.getString();
					if (fileItem.getFieldName().equals("nickName")) {
						userPO.setUserNickname(value);
					} else if (fileItem.getFieldName().equals("email")) {
						userPO.setUserEmail(value);
					}
				} else {//锟斤拷锟斤拷锟斤拷募锟斤拷锟斤拷锟斤拷冉锟斤拷浔ｏ拷娴斤拷锟斤拷锟斤拷锟斤拷锟饺伙拷锟斤拷锟侥硷拷路锟斤拷锟斤拷装锟斤拷userPO锟斤拷锟斤拷
					long fileSize = fileItem.getSize();
					if (fileSize == 0)
						continue;
					//通锟斤拷锟斤拷前时锟斤拷锟斤拷没锟絠d锟斤拷锟斤拷锟侥硷拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷
					String filename = System.currentTimeMillis() + "_" + userPO.getUserId();
					//锟斤拷取图片锟斤拷锟斤拷
					String oldFileName = fileItem.getName();
					int index = oldFileName.lastIndexOf(".");
					String fileType = oldFileName.substring(index, oldFileName.length());
					//锟节凤拷锟斤拷锟斤拷目锟斤拷目录锟斤拷写锟斤拷锟侥硷拷
					filename = filename + fileType;
					File uploadFile = new File(getServletContext().getRealPath(userImgPath + filename));
					fileItem.write(uploadFile);
					//锟斤拷锟侥硷拷锟斤拷锟斤拷锟侥匡拷锟斤拷锟侥柯硷拷锟铰凤拷锟斤拷锟阶帮拷锟絬serPO锟斤拷锟斤拷锟斤拷
					userImgPath = request.getContextPath() + userImgPath + filename;
					userPO.setUserImgPath(userImgPath);
					fileItem.delete();
				}
			}
			//锟斤拷userPO锟斤拷锟斤拷锟斤拷锟捷匡拷
			userInfoService.saveUserPO(userPO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	//获同事
		public void ts(HttpServletRequest req, HttpServletResponse resp){
			UserInfoVO uiv = (UserInfoVO)req.getSession().getAttribute("userInfoVO");
			List<UserPO> us = new RelationshipServiceImpl().getTs(uiv);
			if(uiv.getUserPO().getUserType().equals("emp")&&us!=null&&us.size()>0){
				for (int i = 0; i < us.size(); i++) {
					if(us.get(i).getUserId().equals(uiv.getUserPO().getUserId())){
						us.remove(us.get(i));
						i--;
					}
				}
				
			}
			try {
				//((UserInfoVO)(request.getSession().getAttribute("userInfoVO"))).getUserType();
				PrintWriter out=resp.getWriter();
				if(us==null||us.size()==0){//判断有无同事
					out.print("{\"nu\":\"nu\"}");
				}else{//返回
					JSONArray jsonArray = JSONArray.fromObject(us);
					out.print(jsonArray.toString());
				}
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		//获取同事职位
		public void getpost(HttpServletRequest req, HttpServletResponse resp){
			//获取传入的id
			int userid = Integer.parseInt(req.getParameter("userid"));
			try {
				PrintWriter out = resp.getWriter();
				//根据id获取同事的职位
				List<PostPO> ps = new UserInfoServiceImpl().getEmplPost(userid);
				out.print(JSONArray.fromObject(ps));
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		//获取所有职位
		public void loadpost(HttpServletRequest req, HttpServletResponse resp){
			try {
				PrintWriter out = resp.getWriter();
				List<PostPO> ps = new PostLimitServiceImpl().getAllPost();
				out.print(JSONArray.fromObject(ps));
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		//存储修改后的员工权限
		public void savepost(HttpServletRequest req, HttpServletResponse resp){
			//先获取传过来的userid和post信息
			int userid = Integer.parseInt(req.getParameter("userid"));
			String postids = req.getParameter("post");
			List<RepPO> reps = new ArrayList<>();
			//按照指定的格式分解出数据
			String pt[] = postids.trim().split("  ");
			for (String p : pt) {
				reps.add(new RepPO(userid,Integer.parseInt(p.trim())));
			}
			//存储rep
			RepService repService = new RepServiceImpl();
			repService.saveRep(reps);
		}
}
