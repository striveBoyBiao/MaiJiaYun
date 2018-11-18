package mjy.common.util.other;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import mjy.common.util.jdbc.JdbcUtil;

/**
 * code���ɹ�����
 * 
 * @author student
 *
 */
public class CodeGenerate {
	/**
	 * example�� getCode(10001, CodeGenerate.DIAOBODAN_CODE,3)
	 * �����û�10001�ĵ�������ţ���ˮ��Ϊ3λ;
	 * 
	 */

	/**
	 * �ɹ������
	 */
	public static final String PURCHASSE_CODE = "codePurchasse_Max";
	/**
	 * �˻������
	 */
	public static final String RETURN_CODE = "codePurchasse_Max";
	/**
	 * �������
	 */
	public static final String ORDER_CODE = "codeOrder_Max";
	/**
	 * ���ⵥ���
	 */
	public static final String CHUKUANDAN_CODE = "codeChukudan_Max";
	/**
	 * ���������
	 */
	public static final String DIAOBODAN_CODE = "codeDiaobodan_Max";

	/**
	 * Ĭ����ˮ��λ��
	 */
	private static int SERIAL_NUM = 3;

	//
	// private static Map<String,String> CodePres=new HashMap<String, String>();
	// static{
	// CodePres.put(PURCHASSE_CODE, "PC");
	// CodePres.put(RETURN_CODE, "RT");
	// CodePres.put(ORDER_CODE, "OD");
	// CodePres.put(CHUKUANDAN_CODE, "CK");
	// CodePres.put(DIAOBODAN_CODE, "DB");
	// }
	//

	/**
	 * ��Ĭ�ϵ���ˮ��λ����ȡcode
	 * 
	 * @param bossUserId
	 *            �ϰ���û�ID
	 * @param codeName
	 *            ��Ҫ��õ�code���ƣ������ø���ľ�̬����
	 * @return
	 */
	public static String getCode(int bossUserId, String codeName) {
		return getCode(bossUserId, codeName, SERIAL_NUM);
	}

	/**
	 * ��ȡcodeֵ
	 * 
	 * @param bossUserId
	 *            �ϰ���û�ID
	 * @param codeName
	 *            ��Ҫ��õ�code���ƣ������ø���ľ�̬����
	 * @param serialNum
	 *            ��ˮ��λ��
	 * @return
	 */
	public static synchronized String getCode(int bossUserId, String codeName, int serialNum) {
		String codeValue = "";
		Connection con = JdbcUtil.getConnection();
		CallableStatement callStmt = null;
		String sql = "CALL getCode(?,?,?,?);";
		try {
			callStmt = con.prepareCall(sql);
			callStmt.setInt(1, bossUserId);
			callStmt.setString(2, codeName);
			callStmt.setInt(3, serialNum);
			callStmt.setString(4, "!");
			ResultSet resultSet = callStmt.executeQuery();
			if (resultSet.next()) {
				codeValue = resultSet.getString(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return codeValue;
	}

	public static void main(String[] args) {
		System.out.println(getCode(10001, DIAOBODAN_CODE, 3));
	}
}
