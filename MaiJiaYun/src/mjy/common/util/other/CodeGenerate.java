package mjy.common.util.other;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import mjy.common.util.jdbc.JdbcUtil;

/**
 * code生成工具类
 * 
 * @author student
 *
 */
public class CodeGenerate {
	/**
	 * example： getCode(10001, CodeGenerate.DIAOBODAN_CODE,3)
	 * 生成用户10001的调拨单编号，流水号为3位;
	 * 
	 */

	/**
	 * 采购单编号
	 */
	public static final String PURCHASSE_CODE = "codePurchasse_Max";
	/**
	 * 退货单编号
	 */
	public static final String RETURN_CODE = "codePurchasse_Max";
	/**
	 * 订单编号
	 */
	public static final String ORDER_CODE = "codeOrder_Max";
	/**
	 * 出库单编号
	 */
	public static final String CHUKUANDAN_CODE = "codeChukudan_Max";
	/**
	 * 调拨单编号
	 */
	public static final String DIAOBODAN_CODE = "codeDiaobodan_Max";

	/**
	 * 默认流水号位数
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
	 * 用默认的流水号位数获取code
	 * 
	 * @param bossUserId
	 *            老板的用户ID
	 * @param codeName
	 *            需要获得的code名称，可引用该类的静态常量
	 * @return
	 */
	public static String getCode(int bossUserId, String codeName) {
		return getCode(bossUserId, codeName, SERIAL_NUM);
	}

	/**
	 * 获取code值
	 * 
	 * @param bossUserId
	 *            老板的用户ID
	 * @param codeName
	 *            需要获得的code名称，可引用该类的静态常量
	 * @param serialNum
	 *            流水号位数
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
