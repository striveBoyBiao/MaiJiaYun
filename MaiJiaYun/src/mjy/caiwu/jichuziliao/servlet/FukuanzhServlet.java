package mjy.caiwu.jichuziliao.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mjy.caiwu.jichuziliao.beans.IsChangeId;
import mjy.caiwu.jichuziliao.beans.PageInfo;
import mjy.caiwu.jichuziliao.po.ShopPO;
import mjy.caiwu.jichuziliao.service.FindShopService;
import mjy.caiwu.jichuziliao.service.impl.FindShopServiceImp;
import mjy.caiwu.jichuziliao.vo.FukuanzhVO;
import mjy.caiwu.jichuziliao.vo.IsDefaultVO;
import mjy.caiwu.jichuziliao.vo.ShopVO;
import mjy.caiwu.jichuziliao.vo.fkzhDataVO;
import mjy.common.servlet.BaseServlet;
import net.sf.json.JSONArray;

/**
 * Servlet implementation class KucunMxServlet
 */
@WebServlet("/FukuanzhServlet")
public class FukuanzhServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;

	// �༭�޸����
	public void editSave(HttpServletRequest request, HttpServletResponse response) {
		fkzhDataVO editData = new fkzhDataVO();
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		ShopPO po = new ShopPO();
		String shopName = request.getParameter("shopName").trim();
		editData.setFkzhDafaultId(Integer.parseInt(request.getParameter("fkzhDafaultId")));
		po.setShopName(shopName);
		editData.setFkzhBankName(request.getParameter("fkzhBankName"));
		editData.setFkzhBankId(request.getParameter("fkzhBankId"));
		editData.setFkzhRemark(request.getParameter("fkzhRemark"));
		editData.setShopId(Integer.parseInt(request.getParameter("shopId")));

		FindShopService find = new FindShopServiceImp();
		// ͨ���������ҵ���id
		List<ShopVO> shopData = find.listBy(po);
//		int shopId = shopData.get(0).getShopId();
		// �޸ĸ����˻���Ϣ
		find.editData(editData);
		JSONArray json = JSONArray.fromObject(null);
		out.println(json);

	};

	// ɾ��ѡ��
	public void delete(HttpServletRequest request, HttpServletResponse response) {
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String[] choseIds = request.getParameter("choseIds").split(",");
		FindShopService find = new FindShopServiceImp();
		if (choseIds.length != 0) {
			for (String choseId : choseIds) {
				find.deleteById(Integer.parseInt(choseId));
			}
		}
		JSONArray json = JSONArray.fromObject(null);
		out.println(json);
	};

	// ��ҳ���
	// ҳ����ݸ���
	public void pageSize(HttpServletRequest request, HttpServletResponse response) {
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		PageInfo.pageSize = Integer.parseInt(request.getParameter("pageSize"));
		JSONArray json = JSONArray.fromObject(null);
		out.println(json);
	};

	// ҳ����ݳ�ʼ������,������ҳ��Ϣ
	public void init(HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("application/json,charset=utf-8");
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// ҳ��
		String pageNo = request.getParameter("pageNo");
		FindShopService find = new FindShopServiceImp();
		PageInfo<fkzhDataVO> pageInfo = new PageInfo<>(pageNo);
		String pageSize = request.getParameter("pageSize");
		pageInfo.setPageSize(Integer.parseInt(pageSize));
		pageInfo.setPageBegin(Integer.parseInt(pageNo));
		// ��ȡ���
		List<fkzhDataVO> data = find.getfkzhDada(pageInfo);
		// ���������
		int rowCount = find.getPageCount();

		// ��ҳ��
		int pageCount = (int) Math.ceil(((double) rowCount / PageInfo.pageSize));

		pageInfo.setRowCount(rowCount);
		pageInfo.setPageDate(data);
		pageInfo.setPageCount(pageCount);
		JSONArray json = JSONArray.fromObject(pageInfo);
		out.println(json);
	};

	// ��ѯshop���е�(shopId,shopName)
	public void xiala(HttpServletRequest request, HttpServletResponse response) {
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		FindShopService find = new FindShopServiceImp();
		List<ShopVO> shopList = find.listBy(null);
		JSONArray json = JSONArray.fromObject(shopList);
		out.println(json);
	};

	// �������˻���ݴ������,������ݿ�
	public void ok(HttpServletRequest request, HttpServletResponse response) {
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String fkzhBankName = request.getParameter("fkzhBankName");
		String fkzhBankId = request.getParameter("fkzhBankId");
		String fkzhRemark = request.getParameter("fkzhRemark");
		String flshopId = request.getParameter("shopId");
		FukuanzhVO fukuan = new FukuanzhVO();

		fukuan.setFkzhBankId(fkzhBankId);
		fukuan.setFkzhRemark(fkzhRemark);
		fukuan.setFlshopId(Integer.parseInt(flshopId));
		fukuan.setFkzhBankName(fkzhBankName);
		FindShopService service = new FindShopServiceImp();
		// �����˻���ݿ���ݲ���
		service.insertFK(fukuan);
		// �����˻�ҳ����ʾ��ݲ���

		JSONArray json = JSONArray.fromObject(null);
		out.println(json);
	};

	// ���Ĭ�ϡ���Ĭ�����ð�ť�����ݿ�
	public void setDefault(HttpServletRequest request, HttpServletResponse response) {
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		IsChangeId isChange = new IsChangeId();
		FindShopService find = new FindShopServiceImp();
		int fkzhDafaultId = Integer.parseInt(request.getParameter("fkzhId"));
		int isMoren = Integer.parseInt(request.getParameter("isMoren"));
		String shopName = request.getParameter("shopName");
		if (isMoren == 0) {
			find.ChangeId(0, fkzhDafaultId);
		} else {
			// �жϵ����Ƿ����ظ�Ĭ�ϸ����˻�
			find.ChangeId(1, fkzhDafaultId);
			List<IsDefaultVO> list = find.listDefault(shopName);
			for (IsDefaultVO isDefaultVO : list) {
				if (isDefaultVO.getDafaultBankId() == 1 && isDefaultVO.getFkzhDafaultId() != fkzhDafaultId) {
					int ChangeIdData = isDefaultVO.getFkzhDafaultId();
					find.ChangeId(0, ChangeIdData);
					isChange.setIsChangeId(1);
					isChange.setFkzhDafaultId(ChangeIdData);
				}
			}

		}
		JSONArray json = JSONArray.fromObject(isChange);
		out.println(json);
	};

}
