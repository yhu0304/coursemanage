package adminServlet;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import myBean.CourseBean;
import dao.CourseInfoDao;

public class AcouManage extends HttpServlet {
	private static final long serialVersionUID=1L;
	/**
	 * Constructor of the object.
	 */
	public AcouManage() {
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

		HttpSession session = request.getSession();
		String couaction = (String)request.getParameter("couaction");
		String cid = (String)request.getParameter("cid");
		String cname = new String(((String)request.getParameter("cname")).getBytes("iso-8859-1"),"UTF-8");
		String cproperty = new String(((String)request.getParameter("cproperty")).getBytes("iso-8859-1"),"UTF-8");
		CourseInfoDao td = new CourseInfoDao();
		if(couaction.equals("0")){
			session.setAttribute("couaction1", "录入");
			if(td.insertinfo(cid, cname, cproperty)){
				session.setAttribute("couactionres", "success");
			} else {
				session.setAttribute("couactionres", "lose");
			}
		} else if(couaction.equals("1")) {
			session.setAttribute("couaction1", "删除");
			if(td.deleteinfo(cid)){
				session.setAttribute("couactionres", "success");
			} else {
				session.setAttribute("couactionres", "lose");
			}
		} else if(couaction.equals("2")) {
			session.setAttribute("couaction1", "更新");
			if(td.updateinfo(cid, cname, cproperty)){
				session.setAttribute("couactionres", "success");
			} else {
				session.setAttribute("couactionres", "lose");
			}
		} else if(couaction.equals("3")) {
			session.setAttribute("couaction1", "查询");
			CourseBean tb = new CourseBean();
			tb = td.queryinfo(cid, cname, cproperty);
			if(null != tb){
				request.setAttribute("couinfo", tb);
				session.setAttribute("couactionres", "success");
			} else {
				request.setAttribute("couinfo", null);
				session.setAttribute("couactionres", "lose");
			}
		}
		//跳转页面
		ServletContext application = this.getServletContext();
		RequestDispatcher rd =application.getRequestDispatcher("/AdminManage/ACourseInfo.jsp");
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
