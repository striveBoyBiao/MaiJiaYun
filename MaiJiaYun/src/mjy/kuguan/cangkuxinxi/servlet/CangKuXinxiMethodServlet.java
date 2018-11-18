package mjy.kuguan.cangkuxinxi.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mjy.caigou.service.WarehouseService;
import mjy.caigou.service.impl.WarehouseServiceImpl;
import mjy.caigou.vo.WarehouseVO;
import mjy.common.servlet.BaseServlet;
import mjy.kuguan.cangkuxinxi.dao.CangkufubiaoDao;
import mjy.kuguan.cangkuxinxi.dao.GoodKuCunDao;
import mjy.kuguan.cangkuxinxi.dao.ReservoirAndLocationVO;
import mjy.kuguan.cangkuxinxi.dao.ReservoirInfoByWareHouseIdDao;
import mjy.kuguan.cangkuxinxi.dao.impl.CangkufubiaoDaoImpl;
import mjy.kuguan.cangkuxinxi.dao.impl.GoodKuCunDaoImpl;
import mjy.kuguan.cangkuxinxi.dao.impl.ReservoirInfoByWareHouseIdDaoImpl;
import mjy.kuguan.cangkuxinxi.po.GoodKuCunPO;
import mjy.kuguan.cangkuxinxi.po.LocationInfoPO;
import mjy.kuguan.cangkuxinxi.po.ReservoirAndLocationPO;
import mjy.kuguan.cangkuxinxi.po.ReservoirInfoPO;
import mjy.kuguan.cangkuxinxi.service.ILocationServlet;
import mjy.kuguan.cangkuxinxi.service.IReservoirServlet;
import mjy.kuguan.cangkuxinxi.service.IWarehouseServlet;
import mjy.kuguan.cangkuxinxi.service.impl.LocationServletImpl;
import mjy.kuguan.cangkuxinxi.service.impl.ReservoirServletImpl;
import mjy.kuguan.cangkuxinxi.service.impl.WarehouseServletImpl;
import mjy.kuguan.cangkuxinxi.vo.GoodKuCunVO;
import mjy.kuguan.cangkuxinxi.vo.LocationInfoVO;
import mjy.kuguan.cangkuxinxi.vo.ReservoirInfoByWareHouseIdVO;
import mjy.kuguan.cangkuxinxi.vo.ReservoirInfoVO;
import mjy.kuguan.cangkuxinxi.vo.WarehouseInfoVO;
import net.sf.json.JSONArray;

/*
 * 仓库管理界面
 */
@WebServlet("/CangKuXinxiMethodServlet")
public class CangKuXinxiMethodServlet extends BaseServlet {

	private static final long serialVersionUID = 1L;
	//添加仓库
	public void addWarehouseMethod(HttpServletRequest request, HttpServletResponse response) {
		WarehouseInfoVO warehouse = new WarehouseInfoVO();
		IWarehouseServlet addWarehouse = new WarehouseServletImpl();
		response.setContentType("application/json;charset=utf-8");
		String warehouseName = request.getParameter("warehouseName");
		if (warehouseName != "") {
			warehouse.setWarehouseName(warehouseName);
		}
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();

		}
		boolean results = addWarehouse.saveWarehouseInfo(warehouse);
		JSONArray array = JSONArray.fromObject(results);
		String jsonStr = array.toString();
		out.println(jsonStr);
	}

	//添加库区
	public void addReservoirMethod(HttpServletRequest request, HttpServletResponse response) {
		IReservoirServlet addReservoir = new ReservoirServletImpl();
		ReservoirInfoVO reservoir = new ReservoirInfoVO();
		response.setContentType("application/json;charset=utf-8");
		String warehouseId = request.getParameter("warehouseId");
		String reservoirName = request.getParameter("reservoirName");
		reservoir.setReservoirName(reservoirName);
		reservoir.setWarehouseId(Integer.parseInt(warehouseId));
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
		boolean results = addReservoir.saveReservoirInfo(reservoir);
		JSONArray array = JSONArray.fromObject(results);
		String jsonStr = array.toString();
		out.println(jsonStr);
	}

	//添加库位
	public void addLocationMethod(HttpServletRequest request, HttpServletResponse response) {
		ILocationServlet addlocation = new LocationServletImpl();
		LocationInfoVO location = new LocationInfoVO();
		boolean results = true;
		response.setContentType("application/json;charset=utf-8");
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
		String reservoirId = request.getParameter("reservoirId");
		String locationArr = request.getParameter("locationArr");
		JSONArray locationArrJsonObject = JSONArray.fromObject(locationArr);
		for (int index = 0; index < locationArrJsonObject.size(); index++) {
			location.setLocationName(locationArrJsonObject.get(index) + "");
			location.setReservoirId(Integer.parseInt(reservoirId));
			results = results & addlocation.saveLocationDao(location);
		}
		JSONArray array = JSONArray.fromObject(results);
		String jsonStr = array.toString();
		out.println(jsonStr);
		out.close();
	}

	//删除仓库
	public void removeWarehouseMethod(HttpServletRequest request, HttpServletResponse response) {
		IWarehouseServlet removeWarehouse = new WarehouseServletImpl();
		response.setContentType("application/json;charset=utf-8");
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
		String warehouseId = request.getParameter("warehouseId");
		boolean results = removeWarehouse.removeWarehouseInfo(Integer.parseInt(warehouseId));
		JSONArray array = JSONArray.fromObject(results);
		String jsonStr = array.toString();
		out.println(jsonStr);
		out.close();
	}

	//删除库区
	public void removeReservoirMethod(HttpServletRequest request, HttpServletResponse response) {
		IReservoirServlet removeReservoir = new ReservoirServletImpl();
		response.setContentType("application/json;charset=utf-8");
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
		String reservoirId = request.getParameter("reservoirId");
		boolean results = removeReservoir.removeReservoirInfo(Integer.parseInt(reservoirId));
		JSONArray array = JSONArray.fromObject(results);
		String jsonStr = array.toString();
		out.println(jsonStr);
		out.close();
	}

	//删除库位
	public void removeLocationMethod(HttpServletRequest request, HttpServletResponse response) {
		ILocationServlet removeLocation = new LocationServletImpl();
		response.setContentType("application/json;charset=utf-8");
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
		String locationId = request.getParameter("locationId");
		boolean results = removeLocation.removeLocationInfo(Integer.parseInt(locationId));
		JSONArray array = JSONArray.fromObject(results);
		String jsonStr = array.toString();
		out.println(jsonStr);
		out.close();
	}

	//修改仓库
	public void updateWarehouseMethod(HttpServletRequest request, HttpServletResponse response) {
		IWarehouseServlet queryWarehouse = new WarehouseServletImpl();
		response.setContentType("application/json;charset=utf-8");
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
		String warehouseName = request.getParameter("warehouseName");
		int warehouseId = Integer.parseInt(request.getParameter("warehouseId"));
		boolean results = queryWarehouse.updateWarehouseInfo(warehouseId, warehouseName);
		JSONArray array = JSONArray.fromObject(results);
		String jsonStr = array.toString();
		out.println(jsonStr);
		out.close();
	}

	//修改库区
	public void updateReservoirMethod(HttpServletRequest request, HttpServletResponse response) {
		IReservoirServlet updateReservoir = new ReservoirServletImpl();
		response.setContentType("application/json;charset=utf-8");
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
		String reservoirName = request.getParameter("reservoirName");
		int reservoirId = Integer.parseInt(request.getParameter("reservoirId"));
		boolean results = updateReservoir.updateReservoirInfo(reservoirId, reservoirName);
		JSONArray array = JSONArray.fromObject(results);
		String jsonStr = array.toString();
		out.println(jsonStr);
		out.close();
	}

	//修改库位
	public void updateLocationMethod(HttpServletRequest request, HttpServletResponse response) {
		ILocationServlet updateLocation = new LocationServletImpl();
		response.setContentType("application/json;charset=utf-8");
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
		String locationName = request.getParameter("locationName");
		int locationId = Integer.parseInt(request.getParameter("locationId"));
		boolean results = updateLocation.updateLocationInfo(locationId, locationName);
		JSONArray array = JSONArray.fromObject(results);
		String jsonStr = array.toString();
		out.println(jsonStr);
		out.close();
	}

	//查询仓库
	public void queryWarehouseMethod(HttpServletRequest request, HttpServletResponse response) {
		IWarehouseServlet queryWarehouse = new WarehouseServletImpl();
		response.setContentType("application/json;charset=utf-8");
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
		List<WarehouseInfoVO> results = queryWarehouse.queryWarehouseInfo();
		JSONArray arrays = JSONArray.fromObject(results);
		String jsonStr = arrays.toString();
		out.println(jsonStr);
		out.close();
		/*try {
			request.getRequestDispatcher("/KuGuan/cangkuxinxi/jsp/cangkuxinxi.jsp").forward(request, response);
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		
		}*/
	}

	// 查询库区
	public void queryReservoirMethod(HttpServletRequest request, HttpServletResponse response) {
		IReservoirServlet queryReservoir = new ReservoirServletImpl();
		response.setContentType("application/json;charset=utf-8");
		int warehouseId = Integer.parseInt(request.getParameter("warehouseId"));
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
		List<ReservoirInfoVO> results = queryReservoir.queryReservoirInfo(warehouseId);
		JSONArray arrays = JSONArray.fromObject(results);
		String jsonStr = arrays.toString();
		out.println(jsonStr);
		out.close();
	}

	//查询库位
	public void queryLocationMethod(HttpServletRequest request, HttpServletResponse response) {
		ILocationServlet queryLocation = new LocationServletImpl();
		response.setContentType("application/json;charset=utf-8");
		int reservoirId = Integer.parseInt(request.getParameter("reservoirId"));
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
		List<LocationInfoVO> results = queryLocation.queryLocationInfo(reservoirId);
		JSONArray arrays = JSONArray.fromObject(results);
		String jsonStr = arrays.toString();
		out.println(jsonStr);
		out.close();
	}

	//初始化仓库管理
	public void initGoodKuGuan(HttpServletRequest request, HttpServletResponse response) {
		GoodKuCunDao goodDao = new GoodKuCunDaoImpl();
		String selectText = request.getParameter("selectText");
		List<GoodKuCunVO> list = null;
		if (selectText != null && !selectText.equals("")) {
			boolean flag = selectText.matches("[0-9]+");
			if (flag) {
				list = goodDao.listBy(new GoodKuCunPO(Integer.parseInt(selectText), selectText, selectText));
			} else {
				list = goodDao.listBy(new GoodKuCunPO(selectText, selectText));
			}
		} else {
			list = goodDao.listGood(new GoodKuCunPO());
		}
		JSONArray jArray = JSONArray.fromObject(list);
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
		out.println(jArray);
		out.close();
	}

	//库区名称遍历
	public void locationNameList(HttpServletRequest request, HttpServletResponse response) {
		String wareHouseId = request.getParameter("wareHouseId");
		String reservoirId = request.getParameter("reservoirId");
		ReservoirInfoByWareHouseIdDao reservoirDao = new ReservoirInfoByWareHouseIdDaoImpl();
		List<ReservoirInfoByWareHouseIdVO> list = null;
		if (wareHouseId != null && reservoirId != null) {
			list = reservoirDao.listByReservoirId(
					new ReservoirInfoPO(Integer.parseInt(wareHouseId), Integer.parseInt(reservoirId)));
		}
		JSONArray jArray = JSONArray.fromObject(list);
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();

		}
		out.println(jArray);
		out.close();
	}

	//库区和库位信息
	public void reservoirAndLocation(HttpServletRequest request, HttpServletResponse response) {
		CangkufubiaoDao fuBiaoDao = new CangkufubiaoDaoImpl();
		String wareHouseId = request.getParameter("wareHouseId");
		String locationId = request.getParameter("locationId");
		String locationName = request.getParameter("locationName");
		String reservoirId = request.getParameter("reservoirId");
		String reservoirName = request.getParameter("reservoirName");
		String flag = request.getParameter("flag");
		List<ReservoirAndLocationVO> list = null;
		if (flag != null) {
			if (flag.equals("0")) {
				fuBiaoDao.insertInfo(new ReservoirAndLocationVO(Integer.parseInt(wareHouseId),
						Integer.parseInt(reservoirId), reservoirName, locationName, Integer.parseInt(locationId)));
			} else if (flag.equals("1")) {
				fuBiaoDao.deleteInfo(new ReservoirAndLocationPO(Integer.parseInt(wareHouseId),
						Integer.parseInt(reservoirId), Integer.parseInt(locationId)));
			}
		}
		list = fuBiaoDao.listBy(new ReservoirAndLocationPO(Integer.parseInt(wareHouseId)));
		JSONArray jArray = JSONArray.fromObject(list);
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();

		}
		out.println(jArray);
		out.close();
	}

	//库区信息
	public void reservoirInfo(HttpServletRequest request, HttpServletResponse response) {
		ReservoirInfoByWareHouseIdDao reservoirInfo = new ReservoirInfoByWareHouseIdDaoImpl();
		String wareHouseId = request.getParameter("wareHouseId");
		String locationId = request.getParameter("locationId");
		List<ReservoirInfoByWareHouseIdVO> list = null;
		if (locationId != null) {
			LocationInfoPO locationPO = new LocationInfoPO();
			locationPO.setLocationId(Integer.parseInt(locationId));
			reservoirInfo.deleteReservoirInfo(locationPO);
		}
		if (wareHouseId != null && locationId == null) {
			list = reservoirInfo.listByWareHouseId(new ReservoirInfoPO(Integer.parseInt(wareHouseId)));
		}
		JSONArray jArray = JSONArray.fromObject(list);
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();

		}
		out.println(jArray);
		out.close();
	}

	//通过ID，仓库信息遍历
	public void wareHouseListById(HttpServletRequest request, HttpServletResponse response) {
		GoodKuCunDao goodDao = new GoodKuCunDaoImpl();
		String wareHouseId = request.getParameter("wareHouseId");
		GoodKuCunPO gPO = new GoodKuCunPO();
		gPO.setWareHouseId(Integer.parseInt(wareHouseId));
		List<GoodKuCunVO> list = goodDao.listGood(gPO);
		JSONArray jArray = JSONArray.fromObject(list);
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();

		}
		out.println(jArray);
		out.close();
	}

	//仓库信息遍历
	public void wareHouseList(HttpServletRequest request, HttpServletResponse response) {
		WarehouseService wService = new WarehouseServiceImpl();
		String userId = request.getParameter("userId");
		List<WarehouseVO> wareHouseNames = wService.getWarehouseByUserId(Integer.parseInt(userId));
		JSONArray jArray = JSONArray.fromObject(wareHouseNames);
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();

		}
		out.println(jArray);
		out.close();
	}

	//转发
	public String requestDisp(HttpServletRequest request, HttpServletResponse response) {
		return "f:/KuGuan/cangkuxinxi/jsp/cangkuxinxi.jsp";
	}
	public String requestDis(HttpServletRequest request, HttpServletResponse response) {
		return "f:/KuGuan/shangpinkucun/jsp/shangpinkucun.jsp";
	}
}
