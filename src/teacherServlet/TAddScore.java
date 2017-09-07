package teacherServlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import myBean.StuTeaCourseBean;
import dao.GradeDao;

public class TAddScore extends HttpServlet {
	private static final long serialVersionUID=1L;
	/**
	 * Constructor of the object.
	 */
	public TAddScore() {
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
		String cid = request.getParameter("curcid");
		String tid = (String)session.getAttribute("userid");
		@SuppressWarnings("unchecked")
		ArrayList<StuTeaCourseBean> mycourse =(ArrayList<StuTeaCourseBean>) session.getAttribute("mystudent");
		boolean isFinish = false;
		GradeDao gd = new GradeDao();
		if(mycourse != null){
	  		for(int i=0; i<mycourse.size(); i++){
	  			int sid = mycourse.get(i).getSid(); 
	  			String score = (String) request.getParameter(Integer.toString(sid));
	  			if(null != score && "" != score)
	  				isFinish = gd.enterGrade(sid, cid , tid, score);
	  		}
	  	}
		if(isFinish) {
			session.setAttribute("mystudent", null);
			session.setAttribute("addscoreres", "success");
		} else {
			session.setAttribute("mystudent", null);
			session.setAttribute("addscoreres", "lose");
		}
		//跳转页面
		ServletContext application = this.getServletContext();
		RequestDispatcher rd =application.getRequestDispatcher("/ScoreServlet/TGetallcourse");
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
