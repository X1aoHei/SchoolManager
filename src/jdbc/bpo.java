package jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import util.DBConnection;

public class bpo {
	public AdminOperation getuserbyname(String name0){
		AdminOperation user = null;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = DBConnection.getConnection();
			String sql = "select * from admin where name=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, name0);
			rs = ps.executeQuery();
			while(rs.next()){
				user = new AdminOperation();
				user.setName(name0);
				user.setPassword(rs.getString("password"));
				user.setAge(rs.getString("age"));
				user.setClassname(rs.getString("classname"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBConnection.close(rs, ps, conn);
		}
		return user;
		
	}
}
