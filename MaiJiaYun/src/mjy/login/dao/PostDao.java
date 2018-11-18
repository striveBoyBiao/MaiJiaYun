package mjy.login.dao;

import java.util.List;

import mjy.login.beans.po.PostPO;

public interface PostDao {
	/**
	 * 获取所有的岗位PO对象
	 * @return
	 */
	List<PostPO> getAllErpPost();
	
	/**
	 * 通过员工Id获取其岗位PO对象集合
	 * @param empId员工Id
	 * @return
	 */
	List<PostPO> getPosts(Integer empId);
	/**
	 * 通过岗位ID获得岗位PO对象
	 * @param postId
	 * @return
	 */
	PostPO getPost(Integer postId);
	
}
