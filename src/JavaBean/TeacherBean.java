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
import Bpo.TeacherBpo;

import com.sun.org.apache.regexp.internal.recompile;

import util.DBConnection;

public class TeacherBean {
	private String tno;
	private String tname;
	private String sex;
	private String tdept;
	private String tpost;
	private String tdirect;

	public String getTno() {
		return tno;
	}
	public void setTno(String tno) {
		this.tno = tno;
	}
	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getTdept() {
		return tdept;
	}
	public void setTdept(String tdept) {
		this.tdept = tdept;
	}
	public String getTpost() {
		return tpost;
	}
	public void setTpost(String tpost) {
		this.tpost = tpost;
	}
	public String getTdirect() {
		return tdirect;
	}
	public void setTdirect(String tdirect) {
		this.tdirect = tdirect;
	}
	public  void add() throws SQLException{
		Connection conn = null;
		PreparedStatement ps = null;
		
		try {
			conn = DBConnection.getConnection();
			String sql = "insert into teacher values(?,?,?,?,?,?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, this.tno);
			ps.setString(2, this.tname);
			ps.setString(3, this.sex);
			ps.setString(4, this.tdept);
			ps.setString(5, this.tpost);
			ps.setString(6, this.tdirect);
			ps.executeUpdate();
			
		} finally{
			DBConnection.close(null, ps, conn);
		}
		
		
	}
	public  boolean del() throws SQLException{
		boolean successflag = false;
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = DBConnection.getConnection();
			String sql = "delete from teacher where tno=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, this.tno);
			ps.executeUpdate();
			successflag = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("错误："+e.getMessage());
		}
		return successflag;
		
	}
	public void update(){
			
			Connection conn = null;
			PreparedStatement ps = null;
			try {
				conn = DBConnection.getConnection();
				String sql = "update teacher set tname=?,sex=?,tdept=?,tpost=?,tdirect=? where tno = ?";
				ps = conn.prepareStatement(sql);
				ps.setString(1, this.tname);
				ps.setString(2, this.sex);
				ps.setString(3, this.tdept);
				ps.setString(4, this.tpost);
				ps.setString(5, this.tdirect);
				ps.setString(6, this.tno);
				ps.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
				DBConnection.close(null, ps, conn);
			}
			
		}
	public static List<TeacherBean> get()throws SQLException {
		List<TeacherBean> teaList = new ArrayList<TeacherBean>();
		Connection conn =null;
		Statement st = null;
		ResultSet rs = null;
		try{
			
			conn = DBConnection.getConnection();
			String sql = "select * from teacher";
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			while (rs!=null&&rs.next()) {
				TeacherBean tea = new TeacherBean();
				String tno = rs.getString("tno");
				String tname = rs.getString("tname");
				String sex = rs.getString("sex");
				String tdept = rs.getString("tdept");
				String tpost = rs.getString("tpost");
				String tdirect = rs.getString("tdirect");
				tea.setTno(tno);
				tea.setTname(tname);
				tea.setSex(sex);
				tea.setTdept(tdept);
				tea.setTpost(tpost);
				tea.setTdirect(tdirect);
				
				teaList.add(tea);
			}
			
		}catch(SQLException e){
			e.printStackTrace();
			System.out.println("错误："+e.getMessage());
			
		}
		return teaList;
		
		
	}
	
	public Map<String,String> check()throws Exception{
		Map<String,String> errs = new HashMap<String, String>();
		if(tno==null||tno.equals("")){
			errs.put("tnoerr", "职工号不能为空");
		}else{
			TeacherBpo bpo1 = new TeacherBpo();
			TeacherBean tea = bpo1.getBytno(tno);
			if(tea!=null){errs.put("tnoerr", "该职工已存在");}
		}

		
		
		return errs;
		
	}

	
	

}
