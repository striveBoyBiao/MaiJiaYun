package mjy.login.dao.impl;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import mjy.common.util.jdbc.BaseDao;
import mjy.login.beans.po.PostPO;
import mjy.login.dao.PostDao;

public class PostDaoImpl extends BaseDao<PostPO> implements PostDao {

	@Override
	public List<PostPO> getAllErpPost() {
		String sql = "select * from common_post WHERE postType='ERP'";
		return queryForList(sql, new ArrayList<Object>());
	}

	@Override
	public List<PostPO> mapRow(ResultSet rs) throws Exception {
		List<PostPO> list = new ArrayList<>();
		PostPO postPO;
		while (rs.next()) {
			postPO = new PostPO();
			postPO.setPostId(rs.getInt(1));
			postPO.setPostName(rs.getString(2));
			list.add(postPO);
		}
		return list;
	}

	public static void main(String[] args) {
		System.out.println(new PostDaoImpl().getAllErpPost());
	}

	@Override
	public List<PostPO> getPosts(Integer empId) {
		String sql = "SELECT common_post.postId,common_post.postName FROM common_rep INNER JOIN common_post ON common_rep.postId = common_post.postId WHERE empId=?";
		List<Object> params = new ArrayList<Object>();
		params.add(empId);
		return queryForList(sql, params);
	}

	@Override
	public PostPO getPost(Integer postId) {
		String sql = "SELECT * FROM common_post WHERE postId=?";
		List<Object> params = new ArrayList<Object>();
		params.add(postId);
		return queryForSingle(sql, params);
	}
}
