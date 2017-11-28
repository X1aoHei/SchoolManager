package servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import JavaBean.ClassBean;

/**
 * Servlet implementation class savaCourse
 */
@WebServlet("/savaCourse")
public class savaCourse extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public savaCourse() {
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
		String courseid = request.getParameter("courseid");
		String cname = request.getParameter("cname");
		String ccredit = request.getParameter("ccredit");
		String cpre = request.getParameter("cpre");
		ClassBean course = new ClassBean();
		course.setCourseid(courseid);
		course.setCname(cname);
		course.setCcredit(ccredit);
		course.setCpre(cpre);
		Map<String,String> errs = this.vaild(course);

		if(errs.size()!=0){
			request.setAttribute("errs", errs);
			request.setAttribute("course", course);
			request.getRequestDispatcher("/class/updateCourse_show.jsp").forward(request, response);
		}else{
			
				course.update();
			
			response.sendRedirect("class/magCourse.jsp");
		}
		
	}
	
	private Map<String,String> vaild(ClassBean course) {
		Map<String,String> errs = new HashMap<String, String>();
		if(course.getCname().equals("")){
			errs.put("cname", "课程名不能为空");
		}
		return errs;
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
