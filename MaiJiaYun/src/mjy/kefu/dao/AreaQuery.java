package mjy.kefu.dao;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import mjy.common.util.jdbc.BaseDao;
import mjy.kefu.beans.AreaBeanPO;

public class AreaQuery extends BaseDao<AreaBeanPO> {
	// ʡ��ѯ
	public List<AreaBeanPO> proviceQuery(Integer parent_id) {
		String sql = "select provincesCode as id, provincesName as name from kefu_provinces;";
		ArrayList<Object> params = new ArrayList<Object>();
		return queryForList(sql, params);
	}

	// �в�ѯ
	public List<AreaBeanPO> cityQuery(Integer parent_id) {
		String sql = "select cityCode as id,cityName as name from kefu_cities where provinceCode=?;";
		ArrayList<Object> params = new ArrayList<Object>();
		params.add(parent_id);
		return queryForList(sql, params);
	}

	// ����ѯ
	public List<AreaBeanPO> areaQuery(Integer parent_id) {
		String sql = "select areaCode as id, areaName as name from kefu_areas where cityCode=?;";
		ArrayList<Object> params = new ArrayList<Object>();
		params.add(parent_id);
		return queryForList(sql, params);
	}

	// ʡcodeת����name
	public List<AreaBeanPO> customerProvincesCodeToName(String code) {
		String sql = "select provincesCode as id,provincesName as name from kefu_provinces where provincesCode=?";
		List<Object> params = new ArrayList<Object>();
		params.add(code);
		return queryForList(sql, params);
	}

	// ��codeת����name
	public List<AreaBeanPO> customerCityCodeToName(String code) {
		String sql = "select cityCode as id,cityName as name from kefu_cities where cityCode=?";
		List<Object> params = new ArrayList<Object>();
		params.add(code);
		return queryForList(sql, params);
	}

	// ��codeת����name
	public List<AreaBeanPO> customerAreaCodeToName(String code) {
		String sql = "select areaCode as id,areaName as name from kefu_areas where areaCode=?";
		List<Object> params = new ArrayList<Object>();
		params.add(code);
		return queryForList(sql, params);
	}

	@Override
	public List<AreaBeanPO> mapRow(ResultSet rs) throws Exception {
		List<AreaBeanPO> list = new ArrayList<AreaBeanPO>();
		AreaBeanPO area = null;
		while (rs.next()) {
			area = new AreaBeanPO();
			area.setId(rs.getInt("id"));
			area.setName(rs.getString("name"));
			list.add(area);
		}
		return list;
	}
}
