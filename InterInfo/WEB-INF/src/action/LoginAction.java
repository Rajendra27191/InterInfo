package action;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;

import bean.LoginBean;

import com.opensymphony.xwork2.ActionSupport;

import dao.LoginDAO;

/**
 * @author rajendra
 * 
 */
@SuppressWarnings("serial")
public class LoginAction extends ActionSupport implements ServletRequestAware, SessionAware{
	private LoginBean objBean;
	HttpServletRequest request;
	Map<String, Object> session;

	public LoginBean getObjBean() {
		return objBean;
	}

	public void setObjBean(LoginBean objBean) {
		this.objBean = objBean;
	}

	@Override
	public void validate() {
		super.validate();
	}

	@Override
	public String execute() throws Exception {
		return super.execute();
	}

	public String login() {
		LoginDAO objDao = new LoginDAO();
		objBean = objDao.validateLogin(objBean);
		session.put("password", objBean.getPassword());
		session.put("userId", objBean.getUserID());
		System.out.println("userId: "+objBean.getUserID() + "\t Password: " +objBean.getPassword());
		return SUCCESS;
	}

	/* (non-Javadoc)
	 * @see org.apache.struts2.interceptor.ServletRequestAware#setServletRequest(javax.servlet.http.HttpServletRequest)
	 */
	@Override
	public void setServletRequest(HttpServletRequest arg0) {
		this.request = arg0;
	}

	/* (non-Javadoc)
	 * @see org.apache.struts2.interceptor.SessionAware#setSession(java.util.Map)
	 */
	@Override
	public void setSession(Map<String, Object> arg0) {
		session = arg0;
	}
}
