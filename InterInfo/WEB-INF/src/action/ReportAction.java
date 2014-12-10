/**
 * 
 */
package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import bean.ReportBean;

import com.opensymphony.xwork2.ActionSupport;

import dao.ReportDAO;

/**
 * @author rajendra
 * 
 */
@SuppressWarnings("serial")
public class ReportAction extends ActionSupport implements ServletRequestAware {

	HttpServletRequest request;
	private ReportBean objReportBean;
	private ArrayList<ReportBean> objReportBeans;

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

	public ReportBean getObjReportBean() {
		return objReportBean;
	}

	public void setObjReportBean(ReportBean objReportBean) {
		this.objReportBean = objReportBean;
	}

	public ArrayList<ReportBean> getObjReportBeans() {
		return objReportBeans;
	}

	public void setObjReportBeans(ArrayList<ReportBean> objReportBeans) {
		this.objReportBeans = objReportBeans;
	}

	public String reportOperation() {
		if (objReportBean.getIsStandard() == null) {
			objReportBean.setIsStandard("0");
		}
		ReportDAO objDao = new ReportDAO();
		boolean isReportNamePresent = objDao.isReportNamePresent(objReportBean);
		if (!isReportNamePresent) {
			if (objReportBean.getCallFrom().equalsIgnoreCase("create")) {
				objReportBean = objDao.createReport(objReportBean);
				request.setAttribute("callFromAction", "create");
			} else {
				objReportBean = objDao.updateReport(objReportBean);
				request.setAttribute("callFromAction", "edit");
			}
		} else {
			objReportBean.setResult("present");
		}
		request.setAttribute("callFromAction", objReportBean.getCallFrom());
		request.setAttribute("result", objReportBean.getResult());
		return SUCCESS;
	}

	public String getReportList() {
		ReportDAO  objDao = new ReportDAO();
		objReportBeans = objDao.getReportList();
		return SUCCESS;
	}
	
	public String getReportDetails() {
		ReportDAO objDao = new ReportDAO();
		int reportID =Integer.parseInt(request.getParameter("reportID"));
		objReportBean = objDao.getRreprtDetails(reportID);
		return SUCCESS;
	}
	
	public String getNationalReports() {
		ReportDAO objDao = new ReportDAO();
		objReportBeans = objDao.getNationalReportList();
		return SUCCESS;
	}
	
	public String getInternationalReports() {
		ReportDAO objDao = new ReportDAO();
		objReportBeans = objDao.getInternationalReportList();
		return SUCCESS;
	}
}
