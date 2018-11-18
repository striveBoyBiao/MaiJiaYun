package mjy.login.dao;

import java.util.List;

import mjy.login.beans.po.PostPO;

public interface PostDao {
	/**
	 * ��ȡ���еĸ�λPO����
	 * @return
	 */
	List<PostPO> getAllErpPost();
	
	/**
	 * ͨ��Ա��Id��ȡ���λPO���󼯺�
	 * @param empIdԱ��Id
	 * @return
	 */
	List<PostPO> getPosts(Integer empId);
	/**
	 * ͨ����λID��ø�λPO����
	 * @param postId
	 * @return
	 */
	PostPO getPost(Integer postId);
	
}
