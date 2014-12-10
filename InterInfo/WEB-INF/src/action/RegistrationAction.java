/**
 * 
 */
package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import bean.BillingBean;
import bean.CustomerBean;

import com.opensymphony.xwork2.ActionSupport;

import dao.RegistrationDAO;

/**
 * @author rajendra
 * 
 */
@SuppressWarnings("serial")
public class RegistrationAction extends ActionSupport implements
		ServletRequestAware {
	private CustomerBean objCustomerBean;
	private BillingBean objBillingBean;
	HttpServletRequest request;
	private ArrayList<CustomerBean> objCustomerBeans;

	public CustomerBean getObjCustomerBean() {
		return objCustomerBean;
	}

	public void setObjCustomerBean(CustomerBean objCustomerBean) {
		this.objCustomerBean = objCustomerBean;
	}

	public BillingBean getObjBillingBean() {
		return objBillingBean;
	}

	public void setObjBillingBean(BillingBean objBillingBean) {
		this.objBillingBean = objBillingBean;
	}

	public ArrayList<CustomerBean> getObjCustomerBeans() {
		return objCustomerBeans;
	}

	public void setObjCustomerBeans(ArrayList<CustomerBean> objCustomerBeans) {
		this.objCustomerBeans = objCustomerBeans;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.opensymphony.xwork2.ActionSupport#execute()
	 */
	@Override
	public String execute() throws Exception {
		return super.execute();
	}

	public String createCustomer() {
		RegistrationDAO objDao = new RegistrationDAO();
		System.out.println("CallFrom on Action: "+ objCustomerBean.getPaymentType());
		boolean isCustomerNamePresent = objDao.isCustomerPresent(objCustomerBean.getCustomerName(), objCustomerBean.getCustomerID());
		if (!isCustomerNamePresent) {
			if (objCustomerBean.getCallFrom().equalsIgnoreCase("create")) {
				objCustomerBean = objDao.createCustomer(objCustomerBean,
						objBillingBean);
				request.setAttribute("callFromAction", "create");
			} else{
				objCustomerBean = objDao.updateCustomer(objCustomerBean,
						objBillingBean);
				request.setAttribute("callFromAction", "edit");
			} 
		} else {
			objCustomerBean.setResult("present");
		}
		request.setAttribute("result", objCustomerBean.getResult());
		return SUCCESS;
	}

	public String getCustomerList() {
		RegistrationDAO objDao = new RegistrationDAO();
		objCustomerBeans = objDao.getCustomerList();
		return SUCCESS;
	}

	public String getCustomerDetails() {
		RegistrationDAO objDao = new RegistrationDAO();
		String custIDToEdit = request.getParameter("custID");
		System.out.println("Customer ID To Edit: " + custIDToEdit);
		objCustomerBean = objDao.getCustomerDetails(custIDToEdit);
		return SUCCESS;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * org.apache.struts2.interceptor.ServletRequestAware#setServletRequest(
	 * javax.servlet.http.HttpServletRequest)
	 */
	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}
}
