package mjy.login.service.Impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import mjy.login.beans.po.BossPO;
import mjy.login.beans.po.ExtraLimitPO;
import mjy.login.beans.po.PostPO;
import mjy.login.beans.vo.PostLimitVO;
import mjy.login.beans.vo.PostVO;
import mjy.login.beans.vo.UserInfoVO;
import mjy.login.dao.BossDao;
import mjy.login.dao.ExtraLimitDao;
import mjy.login.dao.PostDao;
import mjy.login.dao.PostLimitDao;
import mjy.login.dao.impl.BossDaoImpl;
import mjy.login.dao.impl.ExtraLimitDaoImpl;
import mjy.login.dao.impl.PostDaoImpl;
import mjy.login.dao.impl.PostLimitDaoImpl;
import mjy.login.service.PostLimitService;

public class PostLimitServiceImpl implements PostLimitService {
	private PostLimitDao postLimitDao = new PostLimitDaoImpl();
	private ExtraLimitDao extraLimitDao = new ExtraLimitDaoImpl();
	private PostDao postDao = new PostDaoImpl();
	private BossDao bossDao=new BossDaoImpl();
	/**
	 * ���ڴ�Ÿ�λ��Ӧ�Ļ���Ȩ�޼���
	 */
	private static Map<Integer, List<PostLimitVO>> baseLimitMap;

	/**
	 * ��ȡ��λ����Ȩ�޼���
	 * 
	 * @param postId��λId
	 * @return
	 */
	public List<PostLimitVO> getBaseLimit(Integer postId) {
		if (baseLimitMap == null) {// ��һ�ν���ʱ��������Ȩ��map
			baseLimitMap = new HashMap<>();
		}
		List<PostLimitVO> limits = baseLimitMap.get(postId);

		if (limits == null) {// ���δ����map�л��Ȩ�޼��ϣ�����postLimitDao��ȥ��ȡ������map
			limits = postLimitDao.getBasicPostLimit(postId);
			baseLimitMap.put(postId, limits);
		}

		return limits;
	}

	@Override
	public List<PostLimitVO> getPostLimitVOs(Integer bossId, Integer postId) {
		// ��ȡ��λ����Ȩ��VO����
		List<PostLimitVO> limits = new ArrayList<>(getBaseLimit(postId));

		// ��ȡ��λ����Ȩ��PO��װ�ɻ���Ȩ��VO����뼯��
		List<ExtraLimitPO> extraLimitPOs = extraLimitDao.getExtraLimits(bossId, postId);
		PostLimitVO limitVO;
		for (ExtraLimitPO extraLimitPO : extraLimitPOs) {

			
			limitVO = postLimitDao.getLimitPO(extraLimitPO.getLimitId());
			limitVO.setSelected(extraLimitPO.getExtIsSelected() == 1 ? true : false);
			limits.add(limitVO);
		}
		return limits;
	}

	@Override
	public List<PostVO> getEmpPostVOs(Integer empId, Integer bossId) {
		// Ա����λ����
		List<PostPO> postPOs = postDao.getPosts(empId);
		return getPostVOs(empId, bossId, postPOs);
	}

	/**
	 * ��PostPO�����û�Id��bossId����Ϣ��װ��PostVO����
	 * 
	 * @param userId
	 * @param bossId
	 * @param postPOs
	 * @return
	 */
	private List<PostVO> getPostVOs(Integer userId, Integer bossId, List<PostPO> postPOs) {
		List<PostVO> postVOs = new ArrayList<>();
		Integer postId;
		String postName;
		List<PostLimitVO> limits;
		for (PostPO postPO : postPOs) {// ����postPO���󼯺ϣ�
										// ����bossId��postPO�����е�postIdȥ��ѯ���λ���������Ȩ����Ϣ���ϣ�
										// ��userId, bossId, postId, postName,
										// limits(Ȩ����Ϣ����)�����Է�װ���µ�PostVO�����в����뼯��
			postId = postPO.getPostId();
			postName = postPO.getPostName();
			limits = getPostLimitVOs(bossId, postId);
			PostVO postVO = new PostVO(userId, bossId, postId, postName, limits);
			postVOs.add(postVO);
		}
		return postVOs;// ����PostVO���󼯺�
	}

	public static void main(String[] args) {
//		BossPO bossPO=new BossPO();
//		bossPO.setUserID(10001);
//		bossPO.setBossType(8);
//		System.out.println(new PostLimitServiceImpl().getBossPostVOs(bossPO));
		System.out.println(new PostLimitServiceImpl().getAllPost());
	}

	@Override
	public List<PostVO> getBossPostVOs(BossPO bossPO) {
		// �ϰ��λ����
		//��ȡ����ERP��λ
		List<PostPO> postPOs = postDao.getAllErpPost();
		//��ȡ�ϰ�����͸�λ��������
		PostPO postPO=postDao.getPost(bossPO.getBossType());
		postPOs.add(postPO);
		
		Integer bossId=bossPO.getUserID();
		return getPostVOs(bossId, bossId, postPOs);
	}

	@Override
	public List<PostVO> getUserPostVOs(UserInfoVO userInfoVO) {
		String userType = userInfoVO.getUserType();
		List<PostVO> list;
		Integer bossId = userInfoVO.getBossPO().getUserID();
		if (userType.equals("boss")) {
			list = getBossPostVOs(userInfoVO.getBossPO());
		} else {
			list = getEmpPostVOs(userInfoVO.getUserPO().getUserId(), bossId);
		}
		return list;
	}

	@Override
	public List<PostPO> getAllPost() {
		return new PostDaoImpl().getAllErpPost();
	}

}
