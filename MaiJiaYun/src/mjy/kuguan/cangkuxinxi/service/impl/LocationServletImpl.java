package mjy.kuguan.cangkuxinxi.service.impl;

import java.util.List;

import mjy.kuguan.cangkuxinxi.dao.ILocationDAO;
import mjy.kuguan.cangkuxinxi.dao.impl.LocationDAOImpl;
import mjy.kuguan.cangkuxinxi.service.ILocationServlet;
import mjy.kuguan.cangkuxinxi.vo.LocationInfoVO;

public class LocationServletImpl implements ILocationServlet {
	ILocationDAO location = new LocationDAOImpl();

	@Override
	public boolean saveLocationDao(LocationInfoVO locationInfoVO) {
		return location.saveLocationDao(locationInfoVO);
	}

	@Override
	public boolean removeLocationInfo(int locationId) {
		return location.removeLocationInfo(locationId);
	}

	@Override
	public boolean updateLocationInfo(int locationId, String locationName) {
		return location.updateLocationInfo(locationId, locationName);
	}

	@Override
	public List<LocationInfoVO> queryLocationInfo(int reservoirId) {
		return location.queryLocationInfo(reservoirId);
	}

}
