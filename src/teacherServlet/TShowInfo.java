package teacherServlet;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import myBean.TeacherBean;
import dao.TeacherInfoDao;

public class TShowInfo extends HttpServlet {
	private static final long serialVersionUID=1L;
	/**
	 * Constructor of the object.
	 */
	public TShowInfo() {
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
		String tid = (String)session.getAttribute("userid");
		//使用teacherbean获取数据
		TeacherInfoDao ti = new TeacherInfoDao();
		TeacherBean sb = ti.getInfoById(tid);
		request.setAttribute("teainfo", sb);
		//跳转页面
		ServletContext application = this.getServletContext();
		RequestDispatcher rd =application.getRequestDispatcher("/TeacherManage/TShowInfo.jsp");
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
