package adminServlet;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import myBean.StudentBean;
import dao.StudentInfoDao;

public class AstuManage extends HttpServlet {
	private static final long serialVersionUID=1L;
	/**
	 * Constructor of the object.
	 */
	public AstuManage() {
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
		String stuaction = (String)request.getParameter("stuaction");
		String sid = (String)request.getParameter("sid");
		String spassword = new String(((String)request.getParameter("spassword")).getBytes("iso-8859-1"),"UTF-8");
		String sname = new String(((String)request.getParameter("sname")).getBytes("iso-8859-1"),"UTF-8");
		String ssex = new String(((String)request.getParameter("ssex")).getBytes("iso-8859-1"),"UTF-8");
		String date = (String)request.getParameter("sbirth");
		Date sbirth = null;
		if("" != date && null != date){
		try {
			java.util.Date date1 = new SimpleDateFormat("yyyy-MM-dd").parse(date);     
			sbirth=  new java.sql.Date(date1.getTime());
		} catch (Exception e) {
			e.printStackTrace();
		}}
		String sprofession = new String(((String)request.getParameter("sprofession")).getBytes("iso-8859-1"),"UTF-8");
		String stel = new String(((String)request.getParameter("stel")).getBytes("iso-8859-1"),"UTF-8");
		String semail = new String(((String)request.getParameter("semail")).getBytes("iso-8859-1"),"UTF-8");
		StudentInfoDao sd = new StudentInfoDao();
		if(stuaction.equals("0")){
			session.setAttribute("stuaction1", "录入");
			if(sd.insertinfo(sid, spassword, sname, ssex, sbirth, sprofession, stel, semail)){
				session.setAttribute("stuactionres", "success");
			} else {
				session.setAttribute("stuactionres", "lose");
			}
		} else if(stuaction.equals("1")) {
			session.setAttribute("stuaction1", "删除");
			if(sd.deleteinfo(sid)){
				session.setAttribute("stuactionres", "success");
			} else {
				session.setAttribute("stuactionres", "lose");
			}
		} else if(stuaction.equals("2")) {
			session.setAttribute("stuaction1", "更新");
			if(sd.updateinfo(sid, spassword, sname, ssex, sbirth, sprofession, stel, semail)){
				session.setAttribute("stuactionres", "success");
			} else {
				session.setAttribute("stuactionres", "lose");
			}
		} else if(stuaction.equals("3")) {
			session.setAttribute("stuaction1", "查询");
			StudentBean sb = new StudentBean();
			sb = sd.queryinfo(sid, spassword, sname, ssex, sbirth, sprofession, stel, semail);
			if(null != sb){
				request.setAttribute("stinfo", sb);
				session.setAttribute("stuactionres", "success");
			} else {
				request.setAttribute("stinfo", null);
				session.setAttribute("stuactionres", "lose");
			}
			
		}
		//跳转页面
		ServletContext application = this.getServletContext();
		RequestDispatcher rd =application.getRequestDispatcher("/AdminManage/AStudentInfo.jsp");
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
