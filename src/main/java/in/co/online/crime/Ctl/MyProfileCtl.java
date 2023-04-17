package in.co.online.crime.Ctl;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import in.co.online.crime.Bean.BaseBean;
import in.co.online.crime.Bean.UserBean;
import in.co.online.crime.Model.UserModel;
import in.co.online.crime.Utility.DataUtility;
import in.co.online.crime.Utility.DataValidator;
import in.co.online.crime.Utility.PropertyReader;
import in.co.online.crime.Utility.ServletUtility;

/**
 * Servlet implementation class MyProfileCtl
 */
@WebServlet(name = "MyProfileCtl", urlPatterns = "/myprofile")
public class MyProfileCtl extends BaseCtl {
	private static final long serialVersionUID = 1L;
	public static final String OP_MYPROFILE = "MyProfile";
	public static final String OP_UPDATE = "Update";

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MyProfileCtl() {
		super();
		// TODO Auto-generated constructor stub
	}

	/*
	 * @Override protected boolean validate(HttpServletRequest request) {
	 * System.out.println("in validation"); boolean pass = true;
	 * 
	 * if (DataValidator.isNull(request.getParameter("firstName"))) {
	 * request.setAttribute("firstName", PropertyReader.getvalue("error.require",
	 * "First Name")); pass = false;
	 * 
	 * } else if (!DataValidator.isName(request.getParameter("firstName"))) {
	 * request.setAttribute("firstName", PropertyReader.getvalue("error.name",
	 * "First Name")); pass = false; }
	 * 
	 * if (DataValidator.isNull(request.getParameter("lastName"))) {
	 * 
	 * request.setAttribute("lastName", PropertyReader.getvalue("error.require",
	 * "Last Name")); pass = false; } else if
	 * (!DataValidator.isName(request.getParameter("lastName"))) {
	 * request.setAttribute("lastName", PropertyReader.getvalue("error.name",
	 * "Last Name")); pass = false;
	 * 
	 * } if (DataValidator.isNull(request.getParameter("email"))) {
	 * request.setAttribute("email", PropertyReader.getvalue("error.require",
	 * "Email Id")); pass = false;
	 * 
	 * } else if (!DataValidator.isEmail(request.getParameter("email"))) {
	 * request.setAttribute("email", PropertyReader.getvalue("error.login",
	 * "Email Id")); pass = false; }
	 * 
	 * if (DataValidator.isNull(request.getParameter("password"))) {
	 * request.setAttribute("password", PropertyReader.getvalue("error.require",
	 * "Password")); pass = false;
	 * 
	 * }
	 * 
	 * else if (!DataValidator.isPassword(request.getParameter("password"))) {
	 * request.setAttribute("password", PropertyReader.getvalue("error.password",
	 * "Password")); return false;
	 * 
	 * } if (DataValidator.isNull(request.getParameter("phoneNo"))) {
	 * request.setAttribute("phoneNo", PropertyReader.getvalue("error.require",
	 * "Phone No")); pass = false;
	 * 
	 * }
	 * 
	 * if ("-----Select-----".equalsIgnoreCase(request.getParameter("gender"))) {
	 * request.setAttribute("gender", PropertyReader.getvalue("error.require",
	 * "Gender")); pass = false; }
	 * 
	 * if ("-----Select-----".equalsIgnoreCase(request.getParameter("roleName"))) {
	 * request.setAttribute("roleName", PropertyReader.getvalue("error.require",
	 * "RoleName")); pass = false; }
	 * 
	 * return pass; }
	 */
	protected BaseBean populateBean(HttpServletRequest request) {

		UserBean bean = new UserBean();
		bean.setId(DataUtility.getLong(request.getParameter("id")));
		bean.setFirstName(DataUtility.getString(request.getParameter("firstName")));
		bean.setLastName(DataUtility.getString(request.getParameter("lastName")));
		bean.setEmail(DataUtility.getString(request.getParameter("email")));
		bean.setPassword(DataUtility.getString(request.getParameter("password")));
		bean.setPhoneNo(DataUtility.getString(request.getParameter("phoneNo")));
		bean.setGender(DataUtility.getString(request.getParameter("gender")));
		bean.setRoleid(2);
		populateDTO(bean, request);
		return bean;

	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		  HttpSession session = request.getSession(true);

	        UserBean UserBean = (UserBean) session.getAttribute("user");
	        long id = UserBean.getId();
	        String op = DataUtility.getString(request.getParameter("operation"));

	        // get model
	        UserModel model = new UserModel();
	        if (id > 0 || op != null) {
	            System.out.println("in id > 0  condition");
	            UserBean bean;
	            try {
	                bean = model.findByPk(id);
	                ServletUtility.setbean(bean, request);
	            } catch (Exception e) {          //ApplicationException
	                ServletUtility.handleException(e, request, response);
	                return;
	            }
	        }
	       
	        ServletUtility.forward(getView(), request, response);

	    }


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(true);

		UserBean UserBean = (UserBean) session.getAttribute("user");
		long id = UserBean.getId();
		String op = DataUtility.getString(request.getParameter("operation"));

		// get model
		UserModel model = new UserModel();
		if (OP_RESET.equalsIgnoreCase(op)) {
			ServletUtility.redirect(OCRView.MYPROFILE_CTL, request, response);
			return;
		}

		if (OP_UPDATE.equalsIgnoreCase(op)) {
			UserBean bean = (UserBean) populateBean(request);
			try {
				if (id > 0) {
					UserBean.setFirstName(bean.getFirstName());
					UserBean.setLastName(bean.getLastName());
					UserBean.setGender(bean.getGender());
					UserBean.setPhoneNo(bean.getPhoneNo());
					model.Update(UserBean);
					ServletUtility.setbean(bean, request);
					ServletUtility.setSuccessMessage("Profile has been updated Successfully. ", request);
					ServletUtility.forward(getView(), request, response);

				}
			} catch (Exception e) { // ApplicationException
				ServletUtility.handleException(e, request, response);
				return;
			}
			return;

		}

		ServletUtility.forward(getView(), request, response);

	}

	@Override
	protected String getView() {
		return OCRView.MYPROFILE_VIEW;
	}

}
