package jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;



import java.util.HashMap;
import java.util.Map;


import util.DBConnection;

public class AdminOperation {
	private String name;
	private String password;
	private String age;
	private String classname;
	private String checkpassword;
	public String getCheckpassword() {
		return checkpassword;
	}
	public void setCheckpassword(String checkpassword) {
		this.checkpassword = checkpassword;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getClassname() {
		return classname;
	}
	public void setClassname(String classname) {
		this.classname = classname;
	}
	
	public  boolean validlogin()throws SQLException{
		Connection conn = null;
		Statement st = null;
		ResultSet rs = null;
		boolean successflag=false;
		try {
			// 2、获得连接对象
			conn = DBConnection.getConnection();
			// 定义sql语句
			String sql = "select * from admin where name='"+this.name+"' and password='"+this.password+"'";
			// 3、创建语句对象
			st = conn.createStatement();
			// 4、遍历结果集（此处不需要）
			rs=st.executeQuery(sql);
			if(rs.next()==true) successflag=true;
		} finally {
			// 5、关闭资源对象
			DBConnection.close(rs, st, conn);
		}
		return successflag;
	}
	public static String getPassword(String name){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String resultstr = "";
		try{
			try {
				conn = DBConnection.getConnection();
				String sql = "select password from admin where name=?";
				ps = conn.prepareStatement(sql);
				ps.setString(1, name);
				
				rs = ps.executeQuery();
				while(rs.next()){
					String password = rs.getString("password");
					resultstr = password;
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
		}finally{
			DBConnection.close(rs, ps, conn);
		}
		return resultstr;
	}
	public static boolean updatePassword(String name,String password){
		boolean successflag = false;
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = DBConnection.getConnection();
			String sql = "update admin set password=? where name=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, password);
			ps.setString(2, name);
			ps.executeUpdate();
			successflag = true;
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("错误："+e.getMessage());
		}finally{
			DBConnection.close(null, ps, conn);
		}
		return successflag;
		
	}
	public static AdminOperation getinformation(String name) {
		AdminOperation admin = null;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = DBConnection.getConnection();
			String sql = "select * from admin where name = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, name);
			rs = ps.executeQuery();
			while(rs.next()==true){
				admin = new AdminOperation();
				String name0  = rs.getString("name");
				String age = rs.getString("age");
				String classname = rs.getString("classname");
				admin.setName(name0);
				admin.setAge(age);
				admin.setClassname(classname);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBConnection.close(rs, ps, conn);
		}
		return admin;
		
	}
	public static boolean updateuser(String name,String age,String classname) throws Exception{
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		boolean successflag = false;
		try {
			conn = DBConnection.getConnection();
			String sql = "update admin set age=?,classname=? where name=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, age);
			ps.setString(2, classname);
			ps.setString(3, name);
			ps.executeUpdate();
			successflag = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBConnection.close(rs, ps, conn);
		}
		return successflag;
	}
	public void adduser() throws Exception{
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try{
			conn = DBConnection.getConnection();
			String sql = "insert into admin(name,password,age,classname)" + " values(?,?,?,?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, this.name);
			ps.setString(2, this.password);
			ps.setString(3, this.age);
			ps.setString(4, this.classname);
			ps.executeUpdate();
		}catch(Exception e){
			throw e;
		}finally{
			DBConnection.close(rs, ps, conn);
		}
		
	}
	public Map<String,String> checkuser()throws Exception{
		Map<String,String> errs = new HashMap<String, String>();
		if(name==null||name.equals("")){
			errs.put("nameerr", "账号不能为空");
		}else{
			bpo bpo1 = new bpo();
			AdminOperation user0 = bpo1.getuserbyname(name);
			if(user0!=null){
				errs.put("nameerr", "用户已存在");
			}
		}
		if(password==null||password.equals("")){errs.put("passworderr", "密码不能为空");}
		if(checkpassword==null||checkpassword.equals("")){errs.put("checkpassworderr", "确认密码不能为空");}
		if(password!=null&&checkpassword!=null&&!password.equals(checkpassword)){errs.put("checkpassworderr", "确认密码和密码不一致");}
		return errs;
		
	}
	
}
