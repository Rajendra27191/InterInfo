/**
 * 
 */
package bean;

import java.util.ArrayList;

/**
 * @author rajendra
 * 
 */
public class CustomerBean {
	private String customerID;
	private String customerName;
	private String tradeName;
	private String taxNumber;
	private String position;
	private String email;
	private String phone;
	private String address;
	private String paymentType;
	private int amountOfPayment;
	private String invoiceNeeded;
	private String ciAvailable;
	private String cnAvailable;
	private String result;
	private String callFrom;
	private ArrayList<BillingBean> objBillingBeans;

	public String getCustomerID() {
		return customerID;
	}

	public void setCustomerID(String customerID) {
		this.customerID = customerID;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getTradeName() {
		return tradeName;
	}

	public void setTradeName(String tradeName) {
		this.tradeName = tradeName;
	}

	public String getTaxNumber() {
		return taxNumber;
	}

	public void setTaxNumber(String taxNumber) {
		this.taxNumber = taxNumber;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPaymentType() {
		return paymentType;
	}

	public void setPaymentType(String paymentType) {
		this.paymentType = paymentType;
	}

	public int getAmountOfPayment() {
		return amountOfPayment;
	}

	public void setAmountOfPayment(int amountOfPayment) {
		this.amountOfPayment = amountOfPayment;
	}

	public String getInvoiceNeeded() {
		return invoiceNeeded;
	}

	public void setInvoiceNeeded(String invoiceNeeded) {
		this.invoiceNeeded = invoiceNeeded;
	}

	public String getCiAvailable() {
		return ciAvailable;
	}

	public void setCiAvailable(String ciAvailable) {
		this.ciAvailable = ciAvailable;
	}

	public String getCnAvailable() {
		return cnAvailable;
	}

	public void setCnAvailable(String cnAvailable) {
		this.cnAvailable = cnAvailable;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public String getCallFrom() {
		return callFrom;
	}

	public void setCallFrom(String callFrom) {
		this.callFrom = callFrom;
	}

	public ArrayList<BillingBean> getObjBillingBeans() {
		return objBillingBeans;
	}

	public void setObjBillingBeans(ArrayList<BillingBean> objBillingBeans) {
		this.objBillingBeans = objBillingBeans;
	}

}
