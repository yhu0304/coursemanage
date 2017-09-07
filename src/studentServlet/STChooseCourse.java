package studentServlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.OptionalCourseDao;

public class STChooseCourse extends HttpServlet {
	private static final long serialVersionUID=1L;
	/**
	 * Constructor of the object.
	 */
	public STChooseCourse() {
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
		String cid = (String) request.getParameter("cid");
		String sid = (String) session.getAttribute("userid");
		OptionalCourseDao ocb = new OptionalCourseDao();
		if(ocb.chooseCourseByCid(cid, sid))
		{
			session.setAttribute("choosecourseresult", "success");
			
		} else {
			
			session.setAttribute("choosecourseresult", "lose");
		}
		//跳转页面
		ServletContext application = this.getServletContext();
		RequestDispatcher rd =application.getRequestDispatcher("/Course/STGetOptionalCourse");
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
