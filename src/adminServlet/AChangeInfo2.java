package adminServlet;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.AdministratorInfoDao;

public class AChangeInfo2 extends HttpServlet {
	private static final long serialVersionUID=1L;
	/**
	 * Constructor of the object.
	 */
	public AChangeInfo2() {
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
		String aid = (String)session.getAttribute("userid");
		String atel = request.getParameter("telephone");
		String aemail = request.getParameter("email");
		AdministratorInfoDao si = new AdministratorInfoDao();
		boolean res = si.updateInfoById(aid, atel, aemail);
		if(res)
		{
			session.setAttribute("changeinfores", "success");
		} else {
			session.setAttribute("changeinfores", "lose");
		}
		//跳转页面
		ServletContext application = this.getServletContext();
		RequestDispatcher rd =application.getRequestDispatcher("/changeInfoServlet/AChangeInfo1");
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
