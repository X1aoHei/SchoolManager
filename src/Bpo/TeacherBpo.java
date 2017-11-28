package Bpo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.sun.corba.se.spi.orbutil.fsm.State;

import util.DBConnection;
import JavaBean.ClassBean;
import JavaBean.TeacherBean;

public class TeacherBpo {
	public  TeacherBean getBytno(String tno) throws SQLException{
		TeacherBean tea = null;
		Connection conn = null;
		Statement ps = null;
		ResultSet rs = null;
		try {
			
			conn = DBConnection.getConnection();
			String sql = "select * from teacher where tno="+tno;
			ps = conn.createStatement();
			
			rs = ps.executeQuery(sql);
			while(rs.next()==true){
				tea = new TeacherBean();
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
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}finally{
			DBConnection.close(rs, ps, conn);
		}
		return tea;
	}
	public List<TeacherBean> get(){
		List<TeacherBean> tealist = new ArrayList<TeacherBean>();
		
		Connection conn = null;
		Statement st = null;
		ResultSet rs = null;
		try {
			conn = DBConnection.getConnection();
			String sql = "select * from teacher";
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()==true){
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
				tealist.add(tea);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return tealist;
		
	}
public static List<TeacherBean> getBytno1(String tno)throws SQLException{
		
		List<TeacherBean> tealist = new ArrayList<TeacherBean>();
		Connection conn= null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = DBConnection.getConnection();
			String sql = "select * from teacher where tno=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, tno);
			rs = ps.executeQuery();
			while(rs.next()==true){
				TeacherBean tea = new TeacherBean();
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
				tealist.add(tea);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}finally{
			DBConnection.close(rs, ps, conn);
		}
		return tealist;
		
	}
	public static List<TeacherBean> getBytname(String tname)throws SQLException{
		
		List<TeacherBean> tealist = new ArrayList<TeacherBean>();
		Connection conn= null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = DBConnection.getConnection();
			String sql = "select * from teacher where tname=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, tname);
			rs = ps.executeQuery();
			while(rs.next()==true){
				TeacherBean tea = new TeacherBean();
				String tno = rs.getString("tno");
				
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
				tealist.add(tea);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}finally{
			DBConnection.close(rs, ps, conn);
		}
		return tealist;
		
	}
	public static List<TeacherBean> getBytdept(String tdept){
		List<TeacherBean> tealist = new ArrayList<TeacherBean>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = DBConnection.getConnection();
			String sql = "select tno,tname,sex,tdept,tpost,tdirect from teacher where tdept=?"; 
			ps = conn.prepareStatement(sql);
			ps.setString(1, tdept);
			rs = ps.executeQuery();
			while(rs.next()){
				TeacherBean tea = new TeacherBean();
				String tno = rs.getString("tno");
				String tname = rs.getString("tname");
				String sex = rs.getString("sex");
				String tdept1 = rs.getString("tdept");
				String tpost = rs.getString("tpost");
				String tdirect = rs.getString("tdirect");
				tea.setTno(tno);
				tea.setTname(tname);
				tea.setSex(sex);
				tea.setTdept(tdept1);
				tea.setTpost(tpost);
				tea.setTdirect(tdirect);
				tealist.add(tea);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("错误："+e.getMessage());
		}
		return tealist;
	}
	public static boolean getvaild(String tno) {
		boolean successflag = false;
		TeacherBean tea = null;
		Connection conn = null;
		Statement ps = null;
		ResultSet rs = null;
		try {
			
			conn = DBConnection.getConnection();
			String sql = "select * from teacher where tno="+tno;
			ps = conn.createStatement();
			
			rs = ps.executeQuery(sql);
			successflag  = true;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}finally{
			DBConnection.close(rs, ps, conn);
		}
		return successflag;
	}
}
