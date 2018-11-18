package mjy.caigou.servlet.cgd;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mjy.caigou.po.PageInfo;
import mjy.caigou.po.PurchasePO;
import mjy.caigou.service.PurchaseGoodService;
import mjy.caigou.service.PurchaseService;
import mjy.caigou.service.impl.PurchaseGoodServiceImpl;
import mjy.caigou.service.impl.PurchaseServiceImpl;
import mjy.caigou.vo.PurchaseVO;
import mjy.caiwu.fukuan.beans.FuKuanVo;
import mjy.caiwu.fukuan.beans.Spring;
import mjy.caiwu.fukuan.service.Wait_checkService;
import mjy.caiwu.fukuan.service.impl.Wait_checkServiceImpl;
import mjy.login.beans.po.BossPO;
import mjy.login.beans.vo.UserInfoVO;

/**
 * Servlet implementation class DcgServlet
 */
@WebServlet("/caigou/servlet/DcgServlet")
public class DcgServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PurchaseVO purchaseVo=null;
		
		UserInfoVO userInfoVo=(UserInfoVO)request.getSession().getAttribute("userInfoVO");
		
		String state= request.getParameter("state");
		PurchasePO purchasePo=new PurchasePO();
		PurchaseVO purchasVo=new PurchaseVO();
		//ȡ��ѯ�����ݲ�ѯ
		purchasePo.setPurchaseCode(request.getParameter("q"));
		//ȡ����ԱID
//		System.out.println("aaa"+userInfoVo.getBossPO().getUserID());
		purchasePo.setUserId(userInfoVo.getBossPO().getUserID());
		//��������ʱȡ����purchaseCode��state������purchaseVo
		String purchaseCode=request.getParameter("purchaseCode");
		if(purchaseCode!=null){
			Spring sping=new Spring();
			Wait_checkService wc=(Wait_checkService)sping.getBeans("wcService");
			
			int bossId=0;
			if(userInfoVo!=null){
				BossPO boss = userInfoVo.getBossPO();
				bossId = boss.getUserID();
			}
			
				// 获取银行id
				List<Integer> fkzhDafaultId = wc.queryfkzhBankId(bossId);
				// 查询采购数据
				List<FuKuanVo> cg = wc.queryCg(purchaseCode);
				
				//如果有默认银行卡
				if (fkzhDafaultId.size() > 0) {
					for (int i = 0; i < cg.size(); i++) {
						cg.get(i).setFkzhDafaultId(fkzhDafaultId.get(0)+"");
					}
				}
				
				if (cg.size() > 0) {
					wc.insert(cg);
					
				}
			
		}
		
		
//		purchasePo.setPurchaseCode(request.getParameter("q"));
		//��������ʱ��ȡ����state
		
		
		PurchaseService ps=null;
		purchaseVo=new PurchaseVO();
		ps=new PurchaseServiceImpl();
		if(state!=null&&purchaseCode!=null){
			
			
			purchaseVo.setUserId(userInfoVo.getBossPO().getUserID());
			purchaseVo.setPurchaseCode(purchaseCode);
			purchaseVo.setState(state);
			ps.update(purchaseVo);
		}
		PurchaseGoodService pgs=new PurchaseGoodServiceImpl();
		if(state==null&&purchaseCode!=null){
//			purchaseVo.setPurchaseCode(purchaseCode);
//			purchaseVo.setState(state);
			int purchaseId=0;
			purchaseVo=new PurchaseVO();
			purchasePo.setPurchaseCode(purchaseCode);
			
//			ps=new PurchaseServiceImpl();
			purchaseVo.setUserId(userInfoVo.getBossPO().getUserID());
			List<PurchaseVO> list=ps.listBy(purchasePo);
			//����list��ȡpurchaseId
			for (PurchaseVO purchase : list) {
				purchaseId=purchase.getPurchaseId();
			}
			//����purchaseIdɾ�����У�ִ��ɾ����ʱ��
			pgs.delete(purchaseId);
			ps.deleteByPurchaseCode(purchaseCode);
			purchasePo.setPurchaseCode(null);
		}
		
		purchasePo.setState("1");
		
		//��ҳ��Ϣ
		String pageNum=request.getParameter("pageNo")==null?"1":request.getParameter("pageNo");
				System.out.println("pageNum:"+pageNum);
				
				String pSize = request.getParameter("pSize")==null? "10":request.getParameter("pSize");//10
				Integer pageSize = Integer.parseInt(pSize);
				System.out.println("pSize:"+pSize);
				PageInfo<PurchaseVO> page = new PageInfo<>(pageNum) ;
				page.setPageSize(pageSize);
				System.out.println("pSize:"+page.getPageSize());
				purchasePo.setRowStart(page.getPageBegin());
				System.out.println( "rowStart:"+purchasePo.getRowStart());
				//2ִ��ҵ��ģ��
				PurchaseService purchaseService = new PurchaseServiceImpl();
				PageInfo<PurchaseVO> pageInfo=purchaseService.listByPage(purchasePo, page);	
				
				request.setAttribute("pageInfo", pageInfo);
				
		
//		List<PurchaseVO> list1=ps.listBy(purchasePo);
//		
		List<PurchaseVO> list=ps.listBy1(purchasePo);
		
		request.setAttribute("list", list);

		
		
		
		request.getRequestDispatcher("/CaiGou/jsp/cgd/dcg.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
