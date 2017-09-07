package studentServlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import myBean.StudentBean;
import dao.StudentInfoDao;

public class StudentLoginServlet extends HttpServlet {
	private static final long serialVersionUID=1L;
	/**
	 * Constructor of the object.
	 */
	public StudentLoginServlet() {
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
		HttpSession session = request.getSession();
		String sid = request.getParameter("userID");
		String spassword = request.getParameter("password");
		StudentInfoDao idinfo = new StudentInfoDao();
		StudentBean sb = idinfo.getInfoById(sid);
		if(sb != null){
			if(!spassword.equals(sb.getSpassword())) {
				session.setAttribute("loginres", "lose");
				response.sendRedirect(path+"/STLogin.jsp");
			}else{
				session.setAttribute("username",sb.getSname());	
				session.setAttribute("userid", sb.getSid());
				response.sendRedirect(path+"/STManage/STManage.jsp");
			}
		} else {
			session.setAttribute("loginres", "lose");
			response.sendRedirect(path+"/STLogin.jsp");
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
