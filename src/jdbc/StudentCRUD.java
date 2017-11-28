package jdbc;
import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;







import java.util.ArrayList;
import java.util.List;

import util.DBConnection;
public class StudentCRUD {
	
	//add
	
		public static void add( String stuid,String sname,String sex,String age,String birthday,String classname) throws SQLException {
			Connection conn = null;
			PreparedStatement ps = null;
			ResultSet rs = null;
			try{
				conn = DBConnection.getConnection();
				String sql = "insert into student(stuid,sname,sex,age,birthday,classname) values(?,?,?,?,?,?)";
			    ps = conn.prepareStatement(sql);
			   
			    ps.setString(1, stuid);
				ps.setString(2, sname);
				ps.setString(3, sex);
				ps.setString(4, age);
				
				ps.setString(5, birthday);
				ps.setString(6, classname);
				
			    ps.executeUpdate();
			}finally{
				DBConnection.close(rs, ps, conn);
			}
	    }
		
		//add with transaction
			/*public static void addwithtrans() throws SQLException {
				Connection conn = null;
				PreparedStatement ps1 = null;
				PreparedStatement ps2 = null;
				ResultSet rs = null;
				try{
					conn = DBConnection.getConnection();
					conn.setAutoCommit(false);
					
					String sql1 = "insert into user(id,name,password,sex,age,birthday) values(2,'zhangsan','123','man',21,'1990-12-31')";
				    String sql2="insert into student(stuid,name,sex,age,birthday) values(2,'zhangsan','man',21,'1990-12-31')";
					
				    ps1 = conn.prepareStatement(sql1);
					ps1.executeUpdate();
					
					ps2 = conn.prepareStatement(sql2);
					ps2.executeUpdate();
					
					conn.commit();
				}catch(SQLException e){
					 
					conn.rollback();
				}finally{
					conn.setAutoCommit(true);
					DBConnection.close(null, ps1, null);
					DBConnection.close(rs, ps2, conn);
				}
		    }*/
		//update
		/*public static void update() throws SQLException {
			Connection conn = null;
			Statement st = null;
			ResultSet rs = null;
			try{
				conn = DBConnection.getConnection();
				String sql = "update student set sname='lisi' where stuid='stuid'";
			    st = conn.createStatement();
			    st.executeUpdate(sql);
			}finally{
				DBConnection.close(rs, st, conn);
			}
	    }*/
		//delete
		/*public static void delete() throws SQLException {
			Connection conn = null;
			Statement st = null;
			ResultSet rs = null;
			try{
				conn = DBConnection.getConnection();
				String sql = "delete from student where stuid='stuid'";
			    st = conn.createStatement();
			    st.executeUpdate(sql);
			}finally{
				DBConnection.close(rs, st, conn);
			}
	    }*/
		//get
		/*public static void get() throws SQLException {
			Connection conn = null;
			Statement st = null;
			ResultSet rs = null;
			try{
				conn = DBConnection.getConnection();
				String sql = "select stuid,sname, sex,age,birthday,classname from student";
				st = conn.createStatement();
				rs = st.executeQuery(sql);
				while(rs.next()){
					int id=rs.getInt("id");
					String name=rs.getString("name");
					String password=rs.getString("password");
					String sex=rs.getString("sex");
					int age=rs.getInt("age");
					Date birthday = rs.getDate("birthday");
					System.out.println("id=" + id + ";name=" + name + ";password="
							+ password + ";sex=" + sex + ";age=" + age + ";birthday="
							+ birthday);
				}
			}finally{
				DBConnection.close(rs, st, conn);
			}
	    }*/
		public static List<Student> get()throws SQLException {
			List<Student> stuList = new ArrayList<Student>();
			Connection conn =null;
			Statement st = null;
			ResultSet rs = null;
			try{
				
				conn = DBConnection.getConnection();
				String sql = "select * from student;";
				st = conn.createStatement();
				rs = st.executeQuery(sql);
				while (rs!=null&&rs.next()) {
					Student stu = new Student();
					String stuid = rs.getString("stuid");
					String sname = rs.getString("sname");
					String sex = rs.getString("sex");
					int age = rs.getInt("age");
					String birthday = rs.getString("birthday");
					String classname = rs.getString("classname");
					stu.setStuid(stuid);
					stu.setSname(sname);
					stu.setSex(sex);
					stu.setAge(age);
					stu.setBirthday(birthday);
					stu.setClassname(classname);
					
					stuList.add(stu);
				}
				
			}catch(Exception e){
				e.printStackTrace();
				System.out.println(e.getMessage());
				
			}
			return stuList;
			
			
		}
		public static Student get(String stuid)throws SQLException{
			Connection conn = null;
			PreparedStatement ps = null;
			ResultSet rs = null;
			Student stu = new Student();
			try{
				conn = DBConnection.getConnection();
				String sql = "select sname,sex,age,birthday,classname from student where stuid=?";
				ps = conn.prepareStatement(sql);
				ps.setString(1, stuid);
				
				rs = ps.executeQuery();
				while(rs.next()){
					
					String sname = rs.getString("sname");
					String sex = rs.getString("sex");
					int age = rs.getInt("age");
					String birthday = rs.getString("birthday");
					String classname = rs.getString("classname");
					stu.setSname(sname);
					stu.setSex(sex);
					stu.setAge(age);
					stu.setBirthday(birthday);
					stu.setClassname(classname);
				}
			}catch(SQLException e){
				System.out.println("错误："+e.getMessage());
			}finally{
				DBConnection.close(rs, ps, conn);
			}
			return stu;
			
		}
		public static boolean update(String stuid,String sname,String sex,String age,String birthday,String classname) throws SQLException{
			Connection conn = null;
			PreparedStatement ps = null;
			boolean successflag=false;
			try{
				conn = DBConnection.getConnection();
				
				String sql = "update student set sname=?,sex=?,age=?,birthday=?,classname=? where stuid=?";
				ps = conn.prepareStatement(sql);
				
				ps.setString(1, sname);
				ps.setString(2, sex);
				ps.setString(3, age);
				ps.setString(4, birthday);
				ps.setString(5, classname);
				ps.setString(6, stuid);
				ps.executeUpdate();
				successflag=true;
			}catch(SQLException e){
				System.out.println("错误"+e.getMessage());
			}finally{
				DBConnection.close(null, ps, conn);
			}
			return successflag;
		}
		public static boolean del(String stuid) throws SQLException{
			boolean successflag = false;
			Connection conn = null;
			PreparedStatement ps = null;
			try{
				conn = DBConnection.getConnection();
				String sql = "delete from student where stuid=?";
				ps = conn.prepareStatement(sql);
				ps.setString(1, stuid);
				ps.executeUpdate();
				successflag = true;
			}catch(SQLException e){
				System.out.println("错误"+e.getMessage());
			}finally{
				DBConnection.close(null, ps, conn);
			}
			return successflag;
		}
	 


		

}
