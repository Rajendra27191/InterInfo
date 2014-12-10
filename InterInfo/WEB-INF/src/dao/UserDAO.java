/**
 * 
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import connection.MyConnection;
import bean.UserBean;

/**
 * @author rajendra
 *
 */
public class UserDAO {

	/**
	 * @param objUserBean
	 * @return
	 */
	MyConnection objConnection = new MyConnection();
	public boolean isEmailPresent(UserBean objUserBean) {
		boolean isEmailpresent = false;

		Connection conn = objConnection.getConnection();
		ResultSet rs = null;
		try {
			String isUserPresentQuery = "SELECT user_id, email FROM user WHERE email = ?";
			PreparedStatement pstmt = conn.prepareStatement(isUserPresentQuery);
			pstmt.setString(1, objUserBean.getEmail());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				System.out.println("I/p: "+objUserBean.getEmail() +"\t DB ID: "+rs.getString("user_id"));
				if (rs.getString("email").equalsIgnoreCase(objUserBean.getEmail())) {
					isEmailpresent = false;
				}else{
					isEmailpresent = true;
				}
			}
		} catch (SQLException e) {
			isEmailpresent = true;
			System.out.println("Error: UserDAO/isEmailPresent()...!");
			e.printStackTrace();
		} finally {
			try {
				if (conn != null) {
					conn.close();
				}
			} catch (Exception e2) {
				System.out
						.println("Error while closing Connection...! UserDAO / isEmailPresent()...!");
				e2.printStackTrace();
			}
		}
		return isEmailpresent;
	}
	/**
	 * @param objUserBean
	 * @return
	 */
	public UserBean createUser(UserBean objUserBean) {
		UserBean objBean = new UserBean();
		Connection conn = objConnection.getConnection();
		
		try {
			conn.setAutoCommit(false);
			String insertCustQuery = "INSERT INTO user ( login_name, password, customer_id, name, position, email, phone, is_active, from_date, to_date ) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			// pstmt = conn.prepareStatement(insertCustQuery);
			PreparedStatement pstmt = conn.prepareStatement(insertCustQuery);
			pstmt.setString(1, objUserBean.getName());
			pstmt.setString(2, objUserBean.getPassword());
			pstmt.setInt(3, objUserBean.getCustomerID());
			pstmt.setString(4, objUserBean.getName());
			pstmt.setString(5, objUserBean.getPosition());
			pstmt.setString(6, objUserBean.getEmail());
			pstmt.setString(7, objUserBean.getPhone());
			pstmt.setInt(8, objUserBean.getIsActive());
			pstmt.setString(9, objUserBean.getFromDate());
			pstmt.setString(10, objUserBean.getToDate());
			pstmt.executeUpdate();
			conn.commit();
			objBean.setResult("created");
		} catch (SQLException e) {
			objBean.setResult("error");
			System.out.println("Error: UserDAO/createUser()...!");
			e.printStackTrace();
		} finally {
			try {
				if (conn != null) {
					conn.close();
				}
			} catch (Exception e2) {
				System.out
						.println("Error while closing Connection...! UserDAO / createUser()...!");
				e2.printStackTrace();
			}
		}
		return objBean;
	}
	/**
	 * @param custID 
	 * @param userID 
	 * @return
	 */
	public UserBean getUserDetail(String userID, String custID) {
		UserBean objBean = new UserBean();
		Connection conn = objConnection.getConnection();
		ResultSet rs = null;
		try {
			String getUserListQuery = "SELECT user_id, name, password, position, email, phone, from_date, to_date, is_active FROM user WHERE customer_id = ? AND user_id = ?";
			PreparedStatement pstmt = conn.prepareStatement(getUserListQuery);
			pstmt.setString(1, custID);
			pstmt.setString(2, userID);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				objBean.setUserID(rs.getInt("user_id"));
				objBean.setName(rs.getString("name"));
				objBean.setPassword(rs.getString("password"));
				objBean.setPosition(rs.getString("position"));
				objBean.setEmail(rs.getString("email"));
				objBean.setPhone(rs.getString("phone"));
				objBean.setFromDate(rs.getString("from_date"));
				objBean.setToDate(rs.getString("to_date"));
				objBean.setIsActive(rs.getInt("is_active"));
			}
		} catch (SQLException e) {
			System.out.println("Error: UserDAO/getUserDetail()...!");
			e.printStackTrace();
		} finally {
			try {
				if (conn != null) {
					conn.close();
				}
			} catch (Exception e2) {
				System.out
						.println("Error while closing Connection...! UserDAO / getUserDetail()...!");
				e2.printStackTrace();
			}
		}
		return objBean;
	}
	/**
	 * @param customerID
	 * @return
	 */
	public ArrayList<UserBean> getUserList(String customerID) {
		ArrayList<UserBean> objBeans = new ArrayList<UserBean>();
		UserBean objUserBean ;
		Connection conn = objConnection.getConnection();
		ResultSet rs = null;
		try {
			String getUserListQuery = "SELECT user_id, name FROM user WHERE customer_id = ?";
			PreparedStatement pstmt = conn.prepareStatement(getUserListQuery);
			pstmt.setString(1, customerID);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				objUserBean = new UserBean();
				objUserBean.setUserID(rs.getInt("user_id"));
				objUserBean.setName(rs.getString("name"));
				objBeans.add(objUserBean);
			}
		} catch (SQLException e) {
			System.out.println("Error: UserDAO/getUserList()...!");
			e.printStackTrace();
		} finally {
			try {
				if (conn != null) {
					conn.close();
				}
			} catch (Exception e2) {
				System.out
						.println("Error while closing Connection...! UserDAO / getUserList()...!");
				e2.printStackTrace();
			}
		}
		return objBeans;
	}
	/**
	 * @param objUserBean
	 * @return
	 */
	public UserBean updateUser(UserBean objUserBean) {
		UserBean objBean = new UserBean();
		Connection conn = objConnection.getConnection();
		try {
			conn.setAutoCommit(false);
			System.out.println("CustID: "+ objUserBean.getCustomerID() +"\t UserID: "+objUserBean.getUserID());
			// ------------ Update Customer -------------
			String updateCustQuery = "UPDATE user SET name = ?, position = ?, email = ?, phone = ?, from_date = ?, to_date = ?, is_active=? WHERE customer_id = ? AND user_id = ?";
			PreparedStatement pstmt = conn.prepareStatement(updateCustQuery);
			pstmt.setString(1, objUserBean.getName());
			pstmt.setString(2, objUserBean.getPosition());
			pstmt.setString(3, objUserBean.getEmail());
			pstmt.setString(4, objUserBean.getPhone());
			pstmt.setString(5, objUserBean.getFromDate());
			pstmt.setString(6, objUserBean.getToDate());
			pstmt.setInt(7, objUserBean.getIsActive());
			pstmt.setInt(8, objUserBean.getCustomerID());
			pstmt.setInt(9, objUserBean.getUserID());
			int res = pstmt.executeUpdate();
			System.out.println("Res: "+ res);
			conn.commit();
			objBean.setResult("updated");
		} catch (SQLException e) {
			objBean.setResult("error");
			System.out.println("Error: UserDAO/updateUser()...!");
			e.printStackTrace();
		} finally {
			try {
				if (conn != null) {
					conn.close();
				}
			} catch (Exception e2) {
				System.out.println("Error while closing Connection...! UserDAO / updateUser()...!");
				e2.printStackTrace();
			}
		}
		return objBean;
	}
	
}
