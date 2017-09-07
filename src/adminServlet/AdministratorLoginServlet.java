package adminServlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import myBean.AdministratorBean;
import dao.AdministratorInfoDao;

public class AdministratorLoginServlet extends HttpServlet {
	private static final long serialVersionUID=1L;
	/**
	 * Constructor of the object.
	 */
	public AdministratorLoginServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String path = request.getContextPath();
		response.setContentType("text/html; charset = utf-8");
		HttpSession session = request.getSession();
		String aid = request.getParameter("userID");
		String spassword = request.getParameter("password");
		AdministratorInfoDao adinfo = new AdministratorInfoDao();
		AdministratorBean ab = adinfo.getInfoById(aid);
		if(ab != null){
			if(!spassword.equals(ab.getApassword())) {
				session.setAttribute("loginres", "lose");
				response.sendRedirect(path+"/ManageLogin.jsp");
			}else{
				session.setAttribute("username",ab.getAname());	
				session.setAttribute("userid", ab.getAid());
				response.sendRedirect(path+"/AdminManage/AdminManage.jsp");
			}
		} else {
			session.setAttribute("loginres", "lose");
			response.sendRedirect(path+"/ManageLogin.jsp");
		}
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
