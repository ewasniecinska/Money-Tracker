package pl.wap.authorization;

import pl.wap.authorization.PasswordProtection;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import pl.wap.DBManager;

public class LoginDao {
	
	public boolean checkLoginData(String username, String password) {
		String sql ="select password, salt from users where username=?";

		try{
			Connection conn = DBManager.getConnection();
		    	PreparedStatement st=conn.prepareStatement(sql);
		    	st.setString(1,username);
		    	ResultSet rs=st.executeQuery();
		    	
		    	if(rs.next()) {
		    		int l = (int) rs.getBlob("password").length();
		    		int l2 = (int) rs.getBlob("salt").length();
		    		
		    		boolean check = PasswordProtection.authenticate(password, rs.getBlob("password").getBytes(1, l), rs.getBlob("salt").getBytes(1, l2));
		    		if(check == true) {
		    			return true;
		    		}
		    	}
	  
		} catch(Exception e){System.out.println(e);} return false;
	}
	
	
	public int getUserId(String username) {
		String sql = "SELECT id FROM users WHERE username=?";
		int id = 0;

		try{
			Connection conn = DBManager.getConnection();
			PreparedStatement ste= conn.prepareStatement(sql);
	   	 	ste.setString(1,username);
			ResultSet rse=ste.executeQuery();
			while (rse.next()) {
				id = rse.getInt("id");
			}
	
			return id;
		} catch(Exception e){System.out.println(e);} return id;
	}
	
	public String getUserEmail(String username) {
		String sql = "SELECT email FROM users WHERE username=?";
		String email = null;

		try{
			Connection conn = DBManager.getConnection();
			PreparedStatement ste= conn.prepareStatement(sql);
	   	 	ste.setString(1,username);
			ResultSet rse=ste.executeQuery();
			while (rse.next()) {
				email = rse.getString("email");
			}
	
			return email;
		} catch(Exception e){System.out.println(e);} return email;
	}
	

		

}
