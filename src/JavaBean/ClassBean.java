package JavaBean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import Bpo.ClassBpo;
import util.DBConnection;

public class ClassBean {
	private String courseid;
	private String cname;

	
	private String ccredit;
	private String cpre;
	public String getCcredit() {
		return ccredit;
	}
	public void setCcredit(String ccredit) {
		this.ccredit = ccredit;
	}
	
	public String getCourseid() {
		return courseid;
	}
	public void setCourseid(String courseid) {
		this.courseid = courseid;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}

	public String getCpre() {
		return cpre;
	}
	public void setCpre(String cpre) {
		this.cpre = cpre;
	}
	
	
	
	
	
	public void add(){
		Connection conn = null;
		PreparedStatement ps = null;
		
		
		try {
			conn = DBConnection.getConnection();
			String sql = "insert into course"+" values(?,?,?,?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, this.courseid);
			ps.setString(2, this.cname);
			ps.setInt(3, Integer.valueOf(this.ccredit));
			ps.setString(4, this.cpre);
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBConnection.close(null, ps, conn);
		}
		
		
	}
	public void del(){
		
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = DBConnection.getConnection();
			String sql = "delete from course where courseid = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, Integer.valueOf(this.courseid));
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
	public void update(){
		
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = DBConnection.getConnection();
			String sql = "update course set cname=?,ccredit=?,cpre=? where courseid = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, this.cname);
			ps.setInt(2, Integer.valueOf(this.ccredit));
			ps.setString(3, this.cpre);
			ps.setString(4, this.courseid);
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBConnection.close(null, ps, conn);
		}
		
	}
	
	public Map<String,String> check()throws Exception{
		Map<String,String> errs = new HashMap<String, String>();
		if(courseid==null||courseid.equals("")){
			errs.put("courseiderr", "课程号不能为空");
		}else{
			ClassBpo bpo1 = new ClassBpo();
			ClassBean course = bpo1.getbycourseid(courseid);
			if(course!=null){errs.put("courseiderr", "课程号已存在");}
		}

		if(cpre!=null&&courseid!=null&&cpre.equals(courseid)){
			
			errs.put("cpreerr", "课程号和先修课号不能一致");
		}
		if(cpre!=null){
			ClassBpo bpo2 = new ClassBpo();
			ClassBean course2 = bpo2.getbycourseid(cpre);
			if(course2==null){
				errs.put("cpreerr", "无该课程号");
			}
		}
		return errs;
		
	}
	public ClassBean getbycourseid(String courseid) {
		ClassBean course = new ClassBean();
		Connection conn = null;
		Statement st = null;
		ResultSet rs = null;
		try {
			conn = DBConnection.getConnection();
			String sql = "select * from course where courseid = "+courseid;
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()){
				String cname = rs.getString("cname");
				String ccredit = Integer.toString(rs.getInt("ccredit"));
				String cpre = rs.getString("cpre");
				course.setCourseid(courseid);
				course.setCname(cname);
				course.setCcredit(ccredit);
				course.setCpre(cpre);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return course;
		
	}
	
}
