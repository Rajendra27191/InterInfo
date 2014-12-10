package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import bean.LoginBean;
import connection.MyConnection;

public class LoginDAO {
	MyConnection objConnection = new MyConnection();
	Connection conn = objConnection.getConnection();

	/**
	 * @param objBean
	 */
	public LoginBean validateLogin(LoginBean objBean) {
		LoginBean objLoginBean = new LoginBean();
		ResultSet rs = null, rs1 = null;
		String isUserPresentQuery = "SELECT email FROM user WHERE email=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(isUserPresentQuery);
			pstmt.setString(1, objBean.getEmail());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				// -------- Check for valid password --------
				String isValidPassordQuery = "SELECT user_id, name, is_active, password FROM user WHERE email=? AND password =?";
				pstmt = conn.prepareStatement(isValidPassordQuery);
				pstmt.setString(1, objBean.getEmail());
				pstmt.setString(2, objBean.getPassword());
				System.out.println("isValidPassordQuery: "+isValidPassordQuery);
				rs1 = pstmt.executeQuery();
				if (rs1.next()) {
					objLoginBean.setEmail(objBean.getEmail());
					objLoginBean.setPassword(objBean.getPassword());
					objLoginBean.setUserID(rs1.getInt("user_id"));
					objLoginBean.setName(rs1.getString("name"));
					objLoginBean.setIsActive(rs1.getInt("is_active"));
					objLoginBean.setResult("success");
				}else {
					objLoginBean.setResult("invalidPassword");
				}
			} else {
				objLoginBean.setResult("invalidUser");
			}
		} catch (SQLException e) {
			System.out.println("Error: LoginDAO / validateLogin()...!");
			e.printStackTrace();
		} finally {
			try {
				if (conn != null) {
					conn.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e2) {
				System.out
						.println("Error while closing Connection...! LoginDAO / validateLogin()...!");
				e2.printStackTrace();
			}
		}
		return objLoginBean;
	}
}