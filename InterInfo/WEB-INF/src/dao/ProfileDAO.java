/**
 * 
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import bean.ProfileBean;
import connection.MyConnection;

/**
 * @author rajendra
 *
 */
public class ProfileDAO {
	MyConnection objConnection = new MyConnection();

	/**
	 * @param objProfileBean
	 * @param loggerID 
	 * @return
	 */
	public ProfileBean updatePassword(ProfileBean objProfileBean, String loggerID) {
		ProfileBean objBean = new ProfileBean();
		Connection conn = objConnection.getConnection();
		try {
			conn.setAutoCommit(false);
			// ------------ Update Password -------------
			String updatePassQuery = "UPDATE user SET password = ? WHERE user_id = ?";
			PreparedStatement pstmt = conn.prepareStatement(updatePassQuery);
			pstmt.setString(1, objProfileBean.getNewPassword());
			pstmt.setString(2, loggerID);
			int res = pstmt.executeUpdate();
			System.out.println("Result of Password Upadation: "+ res);
			conn.commit();
			objBean.setResult("updated");
		} catch (SQLException e) {
			objBean.setResult("error");
			System.out.println("Error: ProfileDAO/updatePassword()...!");
			e.printStackTrace();
		} finally {
			try {
				if (conn != null) {
					conn.close();
				}
			} catch (Exception e2) {
				System.out.println("Error while closing Connection...! ProfileDAO / updatePassword()...!");
				e2.printStackTrace();
			}
		}
		return objBean;
	}
}
