package studentServlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.OptionalCourseDao;

import myBean.OptionalCourseBean;

public class STGetOptionalCourse extends HttpServlet {
	private static final long serialVersionUID=1L;
	/**
	 * Constructor of the object.
	 */
	public STGetOptionalCourse() {
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
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String sid = (String)session.getAttribute("userid");
		//使用OptionalCourseBean获取选修课程及已选情况信息
		ArrayList<OptionalCourseBean> ocb = new ArrayList<OptionalCourseBean>();
		OptionalCourseDao oc = new OptionalCourseDao();
		ocb = oc.getOptionalCourseBySid(sid);
		session.setAttribute("optionalcourse", ocb);
		//跳转页面
		ServletContext application = this.getServletContext();
		RequestDispatcher rd =application.getRequestDispatcher("/STManage/STOptionalCourse.jsp");
		rd.forward(request, response);
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
