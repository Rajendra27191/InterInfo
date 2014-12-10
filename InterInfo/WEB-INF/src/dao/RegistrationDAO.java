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
import bean.BillingBean;
import bean.CustomerBean;

/**
 * @author rajendra
 * 
 */
public class RegistrationDAO {

	/**
	 * @param objCustomerBean
	 * @param objBillingBean
	 * @return
	 */

	MyConnection objConnection = new MyConnection();

	public CustomerBean createCustomer(CustomerBean objCustomerBean,
			BillingBean objBillingBean) {
		Connection conn = objConnection.getConnection();
		CustomerBean objBean = new CustomerBean();
		int custID = 0;
		try {
			conn.setAutoCommit(false);
			String insertCustQuery = "INSERT INTO customer (trade_name, tax_no, name, position, email, phone, address, payment_type, payment_amount , invoice_needed, ci_available, cn_available ) values(?,?,?,?,?,?,?,?,?,?,?,?)";
			// pstmt = conn.prepareStatement(insertCustQuery);
			PreparedStatement pstmt = conn.prepareStatement(insertCustQuery,
					PreparedStatement.RETURN_GENERATED_KEYS);
			pstmt.setString(1, objCustomerBean.getTradeName());
			pstmt.setString(2, objCustomerBean.getTaxNumber());
			pstmt.setString(3, objCustomerBean.getCustomerName());
			pstmt.setString(4, objCustomerBean.getPosition());
			pstmt.setString(5, objCustomerBean.getEmail());
			pstmt.setString(6, objCustomerBean.getPhone());
			pstmt.setString(7, objCustomerBean.getAddress());
			pstmt.setString(8, objCustomerBean.getPaymentType());
			pstmt.setInt(9, objCustomerBean.getAmountOfPayment());
			pstmt.setString(10, objCustomerBean.getInvoiceNeeded());
			pstmt.setString(11, objCustomerBean.getCiAvailable());
			pstmt.setString(12, objCustomerBean.getCnAvailable());
			pstmt.executeUpdate();

			ResultSet rs = pstmt.getGeneratedKeys();
			while (rs.next()) {
				custID = rs.getInt(1);
			}
			// ----------------------- Get MAX Sequence_no
			// ---------------------------

			String getMaxSeqNo = "SELECT ifnull(max(sequence_no), 0) as sequence_no FROM billing where customer_id = ?";
			pstmt = conn.prepareStatement(getMaxSeqNo);
			pstmt.setInt(1, custID);
			rs = pstmt.executeQuery();
			int seqNo = 0;
			while (rs.next()) {
				seqNo = rs.getInt("sequence_no");
			}
			seqNo++;
			System.out.println("Seq NO: " + seqNo);
			// -----------------------------------------------------------------------

			System.out.println("Customer Created With ID: " + custID);
			// -------------------- Insert Into Billing ----------------
			String insertBillingQuery = "insert into billing (sequence_no, customer_id, name, tax_no, "
					+ " trade_name, street_number, colonia, delegacion, city, state, zip_code, payment_method, "
					+ " last_4_digit_bank_account, contact, mail_of_contact, tel_of_contact ) "
					+ " values( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(insertBillingQuery);
			pstmt.setInt(1, seqNo);
			pstmt.setInt(2, custID);
			pstmt.setString(3, objCustomerBean.getCustomerName());
			pstmt.setString(4, objCustomerBean.getTaxNumber());
			pstmt.setString(5, objCustomerBean.getTradeName());
			pstmt.setString(6, objBillingBean.getStreetNumber());
			pstmt.setString(7, objBillingBean.getColonia());
			pstmt.setString(8, objBillingBean.getDelegacian());
			pstmt.setString(9, objBillingBean.getCity());
			pstmt.setString(10, objBillingBean.getState());
			pstmt.setString(11, objBillingBean.getZipcode());
			pstmt.setString(12, objBillingBean.getPaymentMethod());
			pstmt.setString(13, objBillingBean.getAccountNumber());
			pstmt.setString(14, objBillingBean.getContactNumber());
			pstmt.setString(15, objBillingBean.getMailOfContact());
			pstmt.setString(16, objBillingBean.getTelOfContact());
			int res = pstmt.executeUpdate();
			System.out.println("Final Insert Result: " + res);
			if (res == 1) {
				conn.commit();
				objBean.setResult("created");
			} else {
				objBean.setResult("error");
			}
		} catch (SQLException e) {
			objBean.setResult("error");
			System.out.println("Error: RegistrationDAO/createCustomer()...!");
			e.printStackTrace();
		} finally {
			try {
				if (conn != null) {
					conn.close();
				}
			} catch (Exception e2) {
				System.out
						.println("Error while closing Connection...! RegistrationDAO / createCustomer()...!");
				e2.printStackTrace();
			}
		}
		return objBean;
	}

	/**
	 * @param email
	 * @return
	 */
	public boolean isCustomerPresent(String name, String CustID) {
		Connection conn = objConnection.getConnection();
		boolean isCustomerPresent = false;
		ResultSet rs = null;
		try {
			String isCustomerPresentQuery = "SELECT name, customer_id FROM customer WHERE name = ?";
			PreparedStatement pstmt = conn.prepareStatement(isCustomerPresentQuery);
			pstmt.setString(1, name);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				System.out.println("I/p: "+CustID +"\t Present ID: "+rs.getString("customer_id"));
				if (rs.getString("customer_id").equalsIgnoreCase(CustID)) {
					isCustomerPresent = false;
				}else{
					isCustomerPresent = true;
				}
			}
		} catch (SQLException e) {
			isCustomerPresent = true;
			System.out
					.println("Error: RegistrationDAO/isCustomerPresent()...!");
			e.printStackTrace();
		} finally {
			try {
				if (conn != null) {
					conn.close();
				}
			} catch (Exception e2) {
				System.out
						.println("Error while closing Connection...! RegistrationDAO / createCustomer()...!");
				e2.printStackTrace();
			}
		}
		return isCustomerPresent;
	}

	/**
	 * @param objCustomerBean
	 * @param objBillingBean
	 * @return
	 */
	public CustomerBean updateCustomer(CustomerBean objCustomerBean,
			BillingBean objBillingBean) {
		Connection conn = objConnection.getConnection();
		CustomerBean objBean = new CustomerBean();
		try {
			conn.setAutoCommit(false);
			// ------------ Update Customer -------------
			String updateCustQuery = "UPDATE customer set trade_name = ?, tax_no= ?, name= ?, position = ?, email = ?, phone = ?, address = ?, payment_type = ?, payment_amount = ?, invoice_needed = ?, ci_available = ?, cn_available = ? where customer_id = ?";
			PreparedStatement pstmt = conn.prepareStatement(updateCustQuery);
			pstmt.setString(1, objCustomerBean.getTradeName());
			pstmt.setString(2, objCustomerBean.getTaxNumber());
			pstmt.setString(3, objCustomerBean.getCustomerName());
			pstmt.setString(4, objCustomerBean.getPosition());
			pstmt.setString(5, objCustomerBean.getEmail());
			pstmt.setString(6, objCustomerBean.getPhone());
			pstmt.setString(7, objCustomerBean.getAddress());
			pstmt.setString(8, objCustomerBean.getPaymentType());
			System.out.println("objCustomerBean.getPaymentType(): "+objCustomerBean.getPaymentType());
			pstmt.setInt(9, objCustomerBean.getAmountOfPayment());
			pstmt.setString(10, objCustomerBean.getInvoiceNeeded());
			pstmt.setString(11, objCustomerBean.getCiAvailable());
			pstmt.setString(12, objCustomerBean.getCnAvailable());
			pstmt.setString(13, objCustomerBean.getCustomerID());
			int res = pstmt.executeUpdate();
			int res2 =0;
			// -------------------- Update Billing ----------------
			System.out.println("res: "+ res);
			if (res >= 0) {
				String updateBillingQuery = "UPDATE billing set name = ?, tax_no = ?, trade_name = ?, street_number = ?, colonia = ?, delegacion = ?, city = ?, state = ?, zip_code = ?, payment_method = ?, last_4_digit_bank_account = ?, contact = ?, mail_of_contact = ?, tel_of_contact = ? WHERE customer_id = ? and sequence_no = ?";
				PreparedStatement pstmt1 = conn.prepareStatement(updateBillingQuery);
				pstmt1.setString(1, objCustomerBean.getCustomerName());
				pstmt1.setString(2, objCustomerBean.getTaxNumber());
				pstmt1.setString(3, objCustomerBean.getTradeName());
				pstmt1.setString(4, objBillingBean.getStreetNumber());
				pstmt1.setString(5, objBillingBean.getColonia());
				pstmt1.setString(6, objBillingBean.getDelegacian());
				pstmt1.setString(7, objBillingBean.getCity());
				pstmt1.setString(8, objBillingBean.getState());
				pstmt1.setString(9, objBillingBean.getZipcode());
				pstmt1.setString(10, objBillingBean.getPaymentMethod());
				pstmt1.setString(11, objBillingBean.getAccountNumber());
				pstmt1.setString(12, objBillingBean.getContactNumber());
				pstmt1.setString(13, objBillingBean.getMailOfContact());
				pstmt1.setString(14, objBillingBean.getTelOfContact());
				pstmt1.setString(15, objCustomerBean.getCustomerID());
				pstmt1.setString(16, objBillingBean.getSeqNumber());
				System.out.println("Billing Updated Successfully...!: "+objBillingBean.getSeqNumber());
				res2 = pstmt1.executeUpdate();
			}
			System.out.println("res2...!: "+res2);
			if (res2 >= 0) {
				conn.commit();
			}
			objBean.setResult("updated");
		} catch (SQLException e) {
			objBean.setResult("error");
			System.out.println("Error: RegistrationDAO/updateCustomer()...!");
			e.printStackTrace();
		} finally {
			try {
				if (conn != null) {
					conn.close();
				}
			} catch (Exception e2) {
				System.out
						.println("Error while closing Connection...! RegistrationDAO / updateCustomer()...!");
				e2.printStackTrace();
			}
		}
		return objBean;
	}

	/**
	 * @return
	 */
	public ArrayList<CustomerBean> getCustomerList() {
		ArrayList<CustomerBean> objCustomerBeans = new ArrayList<CustomerBean>();
		CustomerBean objCustomerBean = null;
		Connection conn = objConnection.getConnection();
		ResultSet rs = null;
		try {
			String customerListQuery = "SELECT customer_id, name FROM customer ORDER BY name";
			PreparedStatement pstmt = conn.prepareStatement(customerListQuery);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				objCustomerBean = new CustomerBean();
				objCustomerBean.setCustomerID(rs.getString("customer_id"));
				objCustomerBean.setCustomerName(rs.getString("name"));
				objCustomerBeans.add(objCustomerBean);
			}
		} catch (SQLException e) {
			System.out.println("Error: RegistrationDAO/getCustomerList()...!");
			e.printStackTrace();
		} finally {
			try {
				if (conn != null) {
					conn.close();
				}
			} catch (Exception e2) {
				System.out
						.println("Error while closing Connection...! RegistrationDAO / getCustomerList()...!");
				e2.printStackTrace();
			}
		}
		return objCustomerBeans;
	}

	/**
	 * @param custToEdit
	 * @return
	 */
	public CustomerBean getCustomerDetails(String custID) {
		CustomerBean objBean = new CustomerBean();
		ArrayList<BillingBean> objBillingBeans = new ArrayList<BillingBean>();
		BillingBean objBillingBean;
		Connection conn = objConnection.getConnection();
		ResultSet rs, rs1 = null;
		try {
			// ----------- Get Customer Basic Info -----------
			String customerBasicInfoQuery = "SELECT customer_id, trade_name, tax_no, name, position, email, phone, address, payment_type, payment_amount, invoice_needed, ci_available, cn_available FROM customer WHERE customer_id = ?";
			PreparedStatement pstmt = conn
					.prepareStatement(customerBasicInfoQuery);
			pstmt.setString(1, custID);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				objBean.setCustomerID(rs.getString("customer_id"));
				objBean.setTradeName(rs.getString("trade_name"));
				objBean.setTaxNumber(rs.getString("tax_no"));
				objBean.setCustomerName(rs.getString("name"));
				objBean.setPosition(rs.getString("position"));
				objBean.setEmail(rs.getString("email"));
				objBean.setPhone(rs.getString("phone"));
				objBean.setAddress(rs.getString("address"));
				objBean.setPaymentType(rs.getString("payment_type"));
				objBean.setAmountOfPayment(rs.getInt("payment_amount"));
				objBean.setInvoiceNeeded(rs.getString("invoice_needed"));
				objBean.setCiAvailable(rs.getString("ci_available"));
				objBean.setCnAvailable(rs.getString("cn_available"));
			}

			// ----------- Get Customer Billing Info (May Be
			// Multiple)-----------
			String customerBillingInfoQuery = "SELECT sequence_no, street_number, colonia, delegacion, city, state, zip_code, payment_method, last_4_digit_bank_account, contact, mail_of_contact, tel_of_contact FROM billing where customer_id = ?";
			pstmt = conn.prepareStatement(customerBillingInfoQuery);
			pstmt.setString(1, custID);
			rs1 = pstmt.executeQuery();
			while (rs1.next()) {
				objBillingBean = new BillingBean();
				objBillingBean.setSeqNumber(rs1.getString("sequence_no"));
				objBillingBean.setStreetNumber(rs1.getString("street_number"));
				objBillingBean.setColonia(rs1.getString("colonia"));
				objBillingBean.setDelegacian(rs1.getString("delegacion"));
				objBillingBean.setCity(rs1.getString("city"));
				objBillingBean.setState(rs1.getString("state"));
				objBillingBean.setZipcode(rs1.getString("zip_code"));
				objBillingBean.setPaymentMethod(rs1.getString("payment_method"));
				objBillingBean.setAccountNumber(rs1.getString("last_4_digit_bank_account"));
				objBillingBean.setContactNumber(rs1.getString("contact"));
				objBillingBean.setMailOfContact(rs1.getString("mail_of_contact"));
				objBillingBean.setTelOfContact(rs1.getString("tel_of_contact"));
				objBillingBeans.add(objBillingBean);
			}
			objBean.setObjBillingBeans(objBillingBeans);

		} catch (SQLException e) {
			System.out.println("Error: RegistrationDAO/getCustomerList()...!");
			e.printStackTrace();
		} finally {
			try {
				if (conn != null) {
					conn.close();
				}
			} catch (Exception e2) {
				System.out
						.println("Error while closing Connection...! RegistrationDAO / getCustomerList()...!");
				e2.printStackTrace();
			}
		}
		return objBean;
	}

}
