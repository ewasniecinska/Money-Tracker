package pl.wap;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.google.gson.Gson;

public class AuthorizationSummary {
	public String checkIfLoginExists(String name) {
		
		String sql = "SELECT * FROM USERS WHERE username = ?";
		String message = "";
		
		try{
			Connection conn = DBManager.getConnection();
			PreparedStatement ste= conn.prepareStatement(sql);
			ste.setObject(1, name);
			ResultSet rse=ste.executeQuery();
			while (rse.next()) {
				message = "This username already exist!";
			}
		} catch(Exception e){
			System.out.println(e);
		}
 
		return message;
	}
	
}
