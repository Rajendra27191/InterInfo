/**
 * 
 */
package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import bean.UserBean;

import com.opensymphony.xwork2.ActionSupport;

import dao.UserDAO;

/**
 * @author rajendra
 * 
 */
@SuppressWarnings("serial")
public class UserAction extends ActionSupport implements ServletRequestAware {

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

	private UserBean objUserBean;
	HttpServletRequest request;
	private ArrayList<UserBean> objUserBeans;

	public UserBean getObjUserBean() {
		return objUserBean;
	}

	public void setObjUserBean(UserBean objUserBean) {
		this.objUserBean = objUserBean;
	}

	public HttpServletRequest getRequest() {
		return request;
	}

	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}

	public ArrayList<UserBean> getObjUserBeans() {
		return objUserBeans;
	}

	public void setObjUserBeans(ArrayList<UserBean> objUserBeans) {
		this.objUserBeans = objUserBeans;
	}

	public String userOperation() {
		UserDAO objDao = new UserDAO();
		boolean isEmailPresent = objDao.isEmailPresent(objUserBean);
		if (!isEmailPresent) {
			if (objUserBean.getCallFrom().equalsIgnoreCase("create")) {
				System.out.println("Active at Create: "+objUserBean.getIsActive());
				// ----------- Insert Into User Table -------------
				objUserBean = objDao.createUser(objUserBean);
				request.setAttribute("callFromAction", "create");
			}else if(objUserBean.getCallFrom().equalsIgnoreCase("edit")){
				System.out.println("Active at Edit: "+objUserBean.getIsActive());
				// ----------- Update User Table -------------
				objUserBean = objDao.updateUser(objUserBean);
				request.setAttribute("callFromAction", "edit");
			}
		} else {
			objUserBean.setResult("present");
		}
		request.setAttribute("result", objUserBean.getResult());
		return SUCCESS;
	}

	public String getUserList() {
		String customerID = request.getParameter("customerID");
		UserDAO objDao = new UserDAO();
		objUserBeans = objDao.getUserList(customerID);
		return SUCCESS;
	}

	public String getUserDetail() {
		String custID = request.getParameter("custID");
		String userID = request.getParameter("userID");
		
		UserDAO objDao = new UserDAO();
		objUserBean = objDao.getUserDetail(userID, custID);
		return SUCCESS;
	}
}
