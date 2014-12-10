/**
 * 
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import bean.ReportBean;
import connection.MyConnection;

/**
 * @author rajendra
 * 
 */
public class ReportDAO {
	MyConnection objConnection = new MyConnection();

	/**
	 * @param objReportBean
	 * @return
	 */
	public boolean isReportNamePresent(ReportBean objReportBean) {
		boolean isReportNamePresent = false;

		Connection conn = objConnection.getConnection();
		ResultSet rs = null;
		try {
			String isReportNamePresentQuery = "SELECT report_id, report_name FROM report WHERE report_name = ?";
			PreparedStatement pstmt = conn
					.prepareStatement(isReportNamePresentQuery);
			pstmt.setString(1, objReportBean.getReportName());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				System.out.println("I/p: " + objReportBean.getReportId()
						+ " : " + objReportBean.getReportName() + "\t DB ID: "
						+ rs.getString("report_id"));
				if (rs.getString("report_id").equalsIgnoreCase(
						String.valueOf(objReportBean.getReportId()))) {
					isReportNamePresent = false;
				} else {
					isReportNamePresent = true;
				}
			}
		} catch (SQLException e) {
			isReportNamePresent = true;
			System.out.println("Error: ReportDAO/isReportNamePresent()...!");
			e.printStackTrace();
		} finally {
			try {
				if (conn != null) {
					conn.close();
				}
			} catch (Exception e2) {
				System.out
						.println("Error while closing Connection...! ReportDAO / isReportNamePresent()...!");
				e2.printStackTrace();
			}
		}
		return isReportNamePresent;
	}

	/**
	 * @param objReportBean
	 * @return
	 */
	public ReportBean createReport(ReportBean objReportBean) {
		ReportBean objBean = new ReportBean();
		Connection conn = objConnection.getConnection();
		try {
			if (objReportBean.getIsActive() == null) {
				objReportBean.setIsActive("1");
			}
			conn.setAutoCommit(false);
			String insertReportQuery = "INSERT INTO report ( report_name, sql_text, is_standard, cn_or_ci, is_active, date, day, month, year) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement pstmt = conn.prepareStatement(insertReportQuery);
			pstmt.setString(1, objReportBean.getReportName());
			pstmt.setString(2, objReportBean.getSqlText());
			pstmt.setString(3, objReportBean.getIsStandard());
			pstmt.setString(4, objReportBean.getNatOrInternat());
			pstmt.setString(5, objReportBean.getIsActive());
			pstmt.setString(6, objReportBean.getDate());
			pstmt.setString(7, objReportBean.getDay());
			pstmt.setString(8, objReportBean.getMonth());
			pstmt.setString(9, objReportBean.getYear());
			pstmt.executeUpdate();
			conn.commit();
			objBean.setResult("created");
		} catch (SQLException e) {
			objBean.setResult("error");
			System.out.println("Error: ReportDAO/createReport()...!");
			e.printStackTrace();
		} finally {
			try {
				if (conn != null) {
					conn.close();
				}
			} catch (Exception e2) {
				System.out
						.println("Error while closing Connection...! ReportDAO / createReport()...!");
				e2.printStackTrace();
			}
		}
		return objBean;
	}

	/**
	 * @return
	 */
	public ArrayList<ReportBean> getReportList() {
		ArrayList<ReportBean> objList = new ArrayList<ReportBean>();
		ReportBean objBean;
		Connection conn = objConnection.getConnection();
		ResultSet rs = null;
		try {
			String getReportListQuery = "SELECT report_id, report_name FROM report ORDER BY report_name";
			PreparedStatement pstmt = conn.prepareStatement(getReportListQuery);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				objBean = new ReportBean();
				objBean.setReportId(rs.getInt("report_id"));
				objBean.setReportName(rs.getString("report_name"));
				objList.add(objBean);
			}
		} catch (SQLException e) {
			System.out.println("Error: ReportDAO/getReportList()...!");
			e.printStackTrace();
		} finally {
			try {
				if (conn != null) {
					conn.close();
				}
			} catch (Exception e2) {
				System.out
						.println("Error while closing Connection...! ReportDAO / getReportList()...!");
				e2.printStackTrace();
			}
		}
		return objList;
	}

	/**
	 * @param reportID
	 * @return
	 */
	public ReportBean getRreprtDetails(int reportID) {
		ReportBean objBean = new ReportBean();
		Connection conn = objConnection.getConnection();
		ResultSet rs = null;
		try {
			String getReportDetailQuery = "SELECT report_id, report_name, sql_text, is_standard, cn_or_ci, is_active, date, day, month, year FROM report WHERE report_id = ?";
			PreparedStatement pstmt = conn.prepareStatement(getReportDetailQuery);
			pstmt.setInt(1, reportID);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				objBean.setReportId(rs.getInt("report_id"));
				objBean.setReportName(rs.getString("report_name"));
				objBean.setSqlText(rs.getString("sql_text"));
				objBean.setIsStandard(rs.getString("is_standard"));
				objBean.setNatOrInternat(rs.getString("cn_or_ci"));
				objBean.setIsActive(rs.getString("is_active"));
				objBean.setDate(rs.getString("date"));
				objBean.setDay(rs.getString("day"));
				objBean.setMonth(rs.getString("month"));
				objBean.setYear(rs.getString("year"));
			}
		} catch (SQLException e) {
			System.out.println("Error: ReportDAO/getRreprtDetails()...!");
			e.printStackTrace();
		} finally {
			try {
				if (conn != null) {
					conn.close();
				}
			} catch (Exception e2) {
				System.out
						.println("Error while closing Connection...! ReportDAO / getRreprtDetails()...!");
				e2.printStackTrace();
			}
		}
		return objBean;
	}

	/**
	 * @param objReportBean
	 * @return
	 */
	public ReportBean updateReport(ReportBean objReportBean) {
		ReportBean objBean = new ReportBean();
		Connection conn = objConnection.getConnection();
		if (objReportBean.getIsActive() == null) {
			objReportBean.setIsActive("1");
		}
		try {
			conn.setAutoCommit(false);
			System.out.println("reportID: "+ objReportBean.getReportId());
			// ------------ Update Customer -------------
			String updateReportQuery = "UPDATE report SET sql_text = ?, is_standard = ?, cn_or_ci = ?, is_active = ?, date = ?, day = ?, month = ?, year = ? WHERE report_id = ?";
			PreparedStatement pstmt = conn.prepareStatement(updateReportQuery);
			pstmt.setString(1, objReportBean.getSqlText());
			pstmt.setString(2, objReportBean.getIsStandard());
			pstmt.setString(3, objReportBean.getNatOrInternat());
			pstmt.setString(4, objReportBean.getIsActive());
			pstmt.setString(5, objReportBean.getDate());
			pstmt.setString(6, objReportBean.getDay());
			pstmt.setString(7, objReportBean.getMonth());
			pstmt.setString(8, objReportBean.getYear());
			pstmt.setInt(9, objReportBean.getReportId());
			int res = pstmt.executeUpdate();
			System.out.println("Res: "+ res);
			conn.commit();
			objBean.setResult("updated");
		} catch (SQLException e) {
			objBean.setResult("error");
			System.out.println("Error: ReportDAO/updateReport()...!");
			e.printStackTrace();
		} finally {
			try {
				if (conn != null) {
					conn.close();
				}
			} catch (Exception e2) {
				System.out.println("Error while closing Connection...! ReportDAO / updateReport()...!");
				e2.printStackTrace();
			}
		}
		return objBean;
	}

	/**
	 * @return
	 */
	public ArrayList<ReportBean> getNationalReportList() {
		ArrayList<ReportBean> objReportBeans = new ArrayList<ReportBean>();
		ReportBean objBean;
		Connection conn = objConnection.getConnection();
		ResultSet rs = null;
		try {
			String getNatReportListQuery = "SELECT report_id, report_name FROM report WHERE cn_or_ci = 'National Report' ORDER BY report_name";
			PreparedStatement pstmt = conn.prepareStatement(getNatReportListQuery);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				objBean = new ReportBean();
				objBean.setReportId(rs.getInt("report_id"));
				objBean.setReportName(rs.getString("report_name"));
				objReportBeans.add(objBean);
			}
		} catch (SQLException e) {
			System.out.println("Error: ReportDAO/getNationalReportList()...!");
			e.printStackTrace();
		} finally {
			try {
				if (conn != null) {
					conn.close();
				}
			} catch (Exception e2) {
				System.out
						.println("Error while closing Connection...! ReportDAO / getNationalReportList()...!");
				e2.printStackTrace();
			}
		}
		return objReportBeans;
	}

	/**
	 * @return
	 */
	public ArrayList<ReportBean> getInternationalReportList() {
		ArrayList<ReportBean> objReportBeans = new ArrayList<ReportBean>();
		ReportBean objBean;
		Connection conn = objConnection.getConnection();
		ResultSet rs = null;
		try {
			String getNatReportListQuery = "SELECT report_id, report_name FROM report WHERE cn_or_ci = 'International Report' ORDER BY report_name";
			PreparedStatement pstmt = conn.prepareStatement(getNatReportListQuery);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				objBean = new ReportBean();
				objBean.setReportId(rs.getInt("report_id"));
				objBean.setReportName(rs.getString("report_name"));
				objReportBeans.add(objBean);
			}
		} catch (SQLException e) {
			System.out.println("Error: ReportDAO/getInternationalReportList()...!");
			e.printStackTrace();
		} finally {
			try {
				if (conn != null) {
					conn.close();
				}
			} catch (Exception e2) {
				System.out
						.println("Error while closing Connection...! ReportDAO / getInternationalReportList()...!");
				e2.printStackTrace();
			}
		}
		return objReportBeans;
	}
}
