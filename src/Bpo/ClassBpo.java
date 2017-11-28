package Bpo;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import util.DBConnection;
import JavaBean.ClassBean;

public class ClassBpo {
	public ClassBean getbycourseid(String courseid){
		ClassBean course = null;
		Connection conn = null;
		Statement st = null;
		ResultSet rs  = null;
		try {
			conn  = DBConnection.getConnection();
			String sql = "select * from course where courseid = "+courseid;
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()){
				course = new ClassBean();
				String cname = rs.getString("cname");
				String ccredit = Integer.toString(rs.getInt("ccredit"));
				String cpre = rs.getString("cpre");
				course.setCourseid(courseid);
				course.setCcredit(ccredit);
				course.setCpre(cpre);
				course.setCname(cname);

			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return course;
		
	}
	public List<ClassBean> get(){
		List<ClassBean> courselist = new ArrayList<ClassBean>();
		
		Connection conn = null;
		Statement st = null;
		ResultSet rs = null;
		try {
			conn = DBConnection.getConnection();
			String sql = "select * from course";
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()==true){
				ClassBean course = new ClassBean();
				String courseid = rs.getString("courseid");
				String cname = rs.getString("cname");
				String ccredit = Integer.toString(rs.getInt("ccredit"));
				String cpre = rs.getString("cpre");
				course.setCourseid(courseid);
				course.setCname(cname);
				course.setCcredit(ccredit);
				course.setCpre(cpre);
				courselist.add(course);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return courselist;
		
	}
	public static List<ClassBean> get(String courseid,String cname) throws SQLException{
		List<ClassBean> cours = new ArrayList<ClassBean>();
		Connection conn = null;
		Statement st = null;
		ResultSet rs = null;
		try{
		conn = DBConnection.getConnection();
		String sql = "select * from course where courseid ='"+courseid+"' and cname = '"+cname+"'";
		st = conn.createStatement();
		rs = st.executeQuery(sql);
		while(rs.next()){
			ClassBean course = new ClassBean();
			String courseid0 = rs.getString("courseid");
			String cname0 = rs.getString("cname");
			String ccredit = rs.getString("ccredit");
			String cpre = rs.getString("cpre");
			course.setCourseid(courseid0);
			course.setCname(cname0);
			course.setCcredit(ccredit);
			course.setCpre(cpre);
			cours.add(course);
		}
		}catch(SQLException e){
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		finally{
			DBConnection.close(rs, st, conn);
		}
		return cours;
		
	}
}
