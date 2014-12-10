/**
 * 
 */
package action;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;

import bean.ProfileBean;

import com.opensymphony.xwork2.ActionSupport;

import dao.ProfileDAO;

/**
 * @author rajendra
 * 
 */
@SuppressWarnings("serial")
public class ProfileAction extends ActionSupport implements ServletRequestAware, SessionAware {

	HttpServletRequest request;
	ProfileBean objProfileBean;
	Map<String, Object> session;

	public ProfileBean getObjProfileBean() {
		return objProfileBean;
	}

	public void setObjProfileBean(ProfileBean objProfileBean) {
		this.objProfileBean = objProfileBean;
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

	public String changePassword() {
		String newPassword = objProfileBean.getNewPassword();
		String oldPassword = String.valueOf(session.get("password"));
		String loggerID = String.valueOf(session.get("userId"));
		System.out.println("Current Password: "
				+ objProfileBean.getCurrentPassword() + "\tSession Password: "
				+ oldPassword + "\tLoggerID: " + loggerID);
		if (oldPassword.equalsIgnoreCase(objProfileBean.getCurrentPassword())) {
			// -------------- Update Password ------------
			ProfileDAO objDao = new ProfileDAO();
			objProfileBean = objDao.updatePassword(objProfileBean, loggerID);
		} else {
			objProfileBean.setResult("invalid");
		}

		// --------- if password update successfully then change password stored
		// in session ----------
		if (objProfileBean.getResult().equalsIgnoreCase("updated")) {
			System.out.println("objProfileBean.getNewPassword(): "+newPassword);
			session.put("password", newPassword);
		}
		// ----------------------------------------------------------------------
		request.setAttribute("result", objProfileBean.getResult());
		return SUCCESS;
	}

	/* (non-Javadoc)
	 * @see org.apache.struts2.interceptor.SessionAware#setSession(java.util.Map)
	 */
	@Override
	public void setSession(Map<String, Object> arg0) {
		session = arg0;
	}

}
