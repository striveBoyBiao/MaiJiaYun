package mjy.caiwu.kucunchengben.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mjy.caiwu.kucunchengben.po.KucuncbPo;
import mjy.caiwu.kucunchengben.po.PageInfo;
import mjy.caiwu.kucunchengben.service.KucuncbService;
import mjy.caiwu.kucunchengben.service.KucunmxService;
import mjy.caiwu.kucunchengben.service.impl.KucuncbServiceImpl;
import mjy.caiwu.kucunchengben.service.impl.KucunmxServiceImpl;
import mjy.caiwu.kucunchengben.vo.Caiwu_kucunmx;
import mjy.common.servlet.BaseServlet;
import net.sf.json.JSONArray;

/**
 * 库存成本主页面
 */
@WebServlet("/KucunCostServlet")
public class KucunCostServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
	private KucuncbService kccb = new KucuncbServiceImpl();
	private KucunmxService kcmx = new KucunmxServiceImpl();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public KucunCostServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String methodName = request.getParameter("method");
		if (methodName == null) {
			this.doGet(request, response);
		} else {
			super.service(request, response);
		}
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		Object searchCondition = request.getParameter("searchCondition");
		PageInfo<?> pageInfo = new PageInfo();
		boolean flag = kccb.fenyeMethod(pageInfo, searchCondition, request, response);
		if (flag == false) {
			return;
		}
		List<KucuncbPo> list = kccb.query(KucuncbPo.class, pageInfo.getPageNum(), pageInfo.getPageSize(),
				searchCondition);
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("list", list);
		request.getRequestDispatcher("caiwu/kucunchengben/jsp/kucunchengben.jsp").forward(request, response);
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

	// 修改成本
	public void changeCost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		int goodId = Integer
				.parseInt(request.getParameter("goodId").substring(0, request.getParameter("goodId").indexOf("z")));
		String wareHouseName = request.getParameter("wareHouseName");
		// 页面传来的成本
		double kucunCost = Double.parseDouble(request.getParameter("kucunCost"));
		double lastCost = 0d;
		List<Caiwu_kucunmx> list = kccb.show(Caiwu_kucunmx.class, goodId, kcmx.getWareHouseId(wareHouseName));// 从明细表中获取最新cost
		for (Caiwu_kucunmx caiwu_kucunmx : list) {
			lastCost = caiwu_kucunmx.getLastCost();// 数据库中的最新成本
		}
		if (kucunCost == lastCost) {
			out.println(kucunCost);
		} else {
			kccb.operate(kucunCost, goodId, wareHouseName);
			// 从明细表中获取最新cost
			list = kccb.show(Caiwu_kucunmx.class, goodId, kcmx.getWareHouseId(wareHouseName));
			for (Caiwu_kucunmx caiwu_kucunmx : list) {
				lastCost = caiwu_kucunmx.getLastCost();
			}
			out.println(lastCost);
		}
	}

	// 查看库存明细
	public void kucunMx(HttpServletRequest request, HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		int goodId = Integer
				.parseInt(request.getParameter("goodId").substring(0, request.getParameter("goodId").indexOf("z")));
		String wareHouseName = request.getParameter("wareHouseName");
		List<Caiwu_kucunmx> mxlist = kcmx.query(Caiwu_kucunmx.class, goodId, wareHouseName);
		JSONArray ja = JSONArray.fromObject(mxlist);
		out.println(ja);
	}

	// 查看最新库存成本
	public void showLastCost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		int goodId = Integer
				.parseInt(request.getParameter("goodId").substring(0, request.getParameter("goodId").indexOf("z")));
		String wareHouseName = request.getParameter("wareHouseName");
		double lastCost = 0d;
		List<Caiwu_kucunmx> list = kccb.show(Caiwu_kucunmx.class, goodId, kcmx.getWareHouseId(wareHouseName));// 从明细表中获取最新cost
		for (Caiwu_kucunmx caiwu_kucunmx : list) {
			lastCost = caiwu_kucunmx.getLastCost();
		}
		out.println(lastCost);
	}
}
