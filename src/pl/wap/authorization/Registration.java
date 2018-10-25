package pl.wap.authorization;

import java.io.IOException;

import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.PreparedStatement;

import pl.wap.DBManager;
import pl.wap.authorization.PasswordProtection;

import java.sql.Connection;
import java.sql.SQLException;

/**
 * Servlet implementation class Registration
 */

@WebServlet("/registrationAction")
public class Registration extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PasswordProtection protection = new PasswordProtection();
		byte[] encryptedPassword = null;
		byte[] salt = null;
		
		try {
			String quary = "INSERT INTO users (username, email, password, salt) VALUES (?, ?, ?, ?)";

			String username = request.getParameter("username");
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			salt = protection.generateSalt();
			encryptedPassword = protection.getEncryptedPassword(password, salt);

			
			DBManager myDb = new DBManager();
			Connection conn = myDb.getConnection();
			
			PreparedStatement ps = (PreparedStatement) conn.prepareStatement(quary);
			ps.setString(1, username);
			ps.setString(2, email);
			ps.setBytes(3, encryptedPassword);
			ps.setBytes(4, salt);


			int count = ps.executeUpdate();
			if(count > 0) {
				response.sendRedirect("index.jsp");
			}
				
		} catch (ClassNotFoundException | SQLException | NoSuchAlgorithmException | InvalidKeySpecException e) {
			e.printStackTrace();
			
			response.sendRedirect("login.jsp#signup");
		}
	}

}
