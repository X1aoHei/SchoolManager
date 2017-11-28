package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bpo.TeacherBpo;
import JavaBean.ClassBean;
import JavaBean.TeacherBean;

/**
 * Servlet implementation class savaTeacher_do
 */
@WebServlet("/savaTeacherdo")
public class savaTeacherdo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public savaTeacherdo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		TeacherBean tea = new TeacherBean();
		String tno = request.getParameter("tno");
		String tname = request.getParameter("tname");
		String sex = request.getParameter("sex");
		String tdept = request.getParameter("tdept");
		String tpost = request.getParameter("tpost");
		String tdirect = request.getParameter("tdirect");
		tea.setTno(tno);
		tea.setTname(tname);
		tea.setSex(sex);
		tea.setTdept(tdept);
		tea.setTpost(tpost);
		tea.setTdirect(tdirect);

			
				tea.update();
			
			response.sendRedirect("magTeacher.jsp");
		
		
		
	}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}


}
