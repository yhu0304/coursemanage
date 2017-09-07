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

import myBean.TeacherBean;
import dao.TeacherInfoDao;

public class AteaManage extends HttpServlet {
	private static final long serialVersionUID=1L;
	/**
	 * Constructor of the object.
	 */
	public AteaManage() {
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
		String teaaction = (String)request.getParameter("teaaction");
		String tid = (String)request.getParameter("tid");
		String tpassword = new String(((String)request.getParameter("tpassword")).getBytes("iso-8859-1"),"UTF-8");
		String tname = new String(((String)request.getParameter("tname")).getBytes("iso-8859-1"),"UTF-8");
		String tsex = new String(((String)request.getParameter("tsex")).getBytes("iso-8859-1"),"UTF-8");
		String date = (String)request.getParameter("tbirth");
		Date tbirth = null;
		if("" != date && null != date){
		try {
			java.util.Date date1 = new SimpleDateFormat("yyyy-MM-dd").parse(date);     
			tbirth=  new java.sql.Date(date1.getTime());
		} catch (Exception e) {
			e.printStackTrace();
		}}
		String tjob = new String(((String)request.getParameter("tjob")).getBytes("iso-8859-1"),"UTF-8");
		String ttel = new String(((String)request.getParameter("ttel")).getBytes("iso-8859-1"),"UTF-8");
		String temail = new String(((String)request.getParameter("temail")).getBytes("iso-8859-1"),"UTF-8");
		TeacherInfoDao td = new TeacherInfoDao();
		if(teaaction.equals("0")){
			session.setAttribute("teaaction1", "录入");
			if(td.insertinfo(tid, tpassword, tname, tsex, tbirth, tjob, ttel, temail)){
				session.setAttribute("teaactionres", "success");
			} else {
				session.setAttribute("teaactionres", "lose");
			}
		} else if(teaaction.equals("1")) {
			session.setAttribute("teaaction1", "删除");
			if(td.deleteinfo(tid)){
				session.setAttribute("teaactionres", "success");
			} else {
				session.setAttribute("teaactionres", "lose");
			}
		} else if(teaaction.equals("2")) {
			session.setAttribute("teaaction1", "更新");
			if(td.updateinfo(tid, tpassword, tname, tsex, tbirth, tjob, ttel, temail)){
				session.setAttribute("teaactionres", "success");
			} else {
				session.setAttribute("teaactionres", "lose");
			}
		} else if(teaaction.equals("3")) {
			session.setAttribute("teaaction1", "查询");
			TeacherBean tb = new TeacherBean();
			tb = td.queryinfo(tid, tpassword, tname, tsex, tbirth, tjob, ttel, temail);
			if(null != tb){
				request.setAttribute("teainfo", tb);
				session.setAttribute("teaactionres", "success");
			} else {
				request.setAttribute("teainfo", null);
				session.setAttribute("teaactionres", "lose");
			}
		}
		//跳转页面
		ServletContext application = this.getServletContext();
		RequestDispatcher rd =application.getRequestDispatcher("/AdminManage/ATeacherInfo.jsp");
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
