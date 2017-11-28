package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;




import Bpo.ClassBpo;
import JavaBean.ClassBean;

/**
 * Servlet implementation class getbyCourseid_do
 */
@WebServlet("/getbyCourseid_do")
public class getbyCourseid_do extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public getbyCourseid_do() {
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
		Map<String,String> err = new HashMap<String,String>();
		
		String courseid = request.getParameter("courseid");
		String cname = request.getParameter("cname");
		
		List<ClassBean>  lists = null;
		
		
			ClassBpo bpo = new ClassBpo();
		if(courseid==null||courseid.equals("")){
			err.put("null0", "您输入的课程号为空，请重新输入");
			if(cname==null||cname.equals("")){
				err.put("null2", "您输入的课程名为空，请重新输入");
			}
		}else{
			try {
				lists = bpo.get(courseid, cname);
				if(lists.size()==0){
					err.put("nullcourse", "未查询到该用户");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				err.put("error", "查询错误："+e.getMessage());
			}
		}
				
		  
			 
			
			
		
		request.setAttribute("err", err);
		request.setAttribute("lists", lists);
		request.getRequestDispatcher("class/getCourse.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
