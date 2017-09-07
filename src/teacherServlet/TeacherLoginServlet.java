package teacherServlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import myBean.TeacherBean;
import dao.TeacherInfoDao;

public class TeacherLoginServlet extends HttpServlet {
	private static final long serialVersionUID=1L;
	/**
	 * Constructor of the object.
	 */
	public TeacherLoginServlet() {
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
		String tid = request.getParameter("userID");
		String spassword = request.getParameter("password");
		TeacherInfoDao idinfo = new TeacherInfoDao();
		TeacherBean tb = idinfo.getInfoById(tid);
		if(tb != null){
			if(!spassword.equals(tb.getTpassword())) {
				session.setAttribute("loginres", "lose");
				response.sendRedirect(path+"/TeacherLogin.jsp");
			}else{
				session.setAttribute("username",tb.getTname());	
				session.setAttribute("userid", tb.getTid());
				response.sendRedirect(path+"/TeacherManage/TeacherManage.jsp");
			}
		} else {
			session.setAttribute("loginres", "lose");
			response.sendRedirect(path+"/TeacherLogin.jsp");
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
