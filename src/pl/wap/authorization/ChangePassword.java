package pl.wap.authorization;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.jdbc.PreparedStatement;

import pl.wap.DBManager;

/**
 * Servlet implementation class ChangePassword
 */
@WebServlet("/changePassword")
public class ChangePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String password = request.getParameter("new-password");
			HttpSession session=request.getSession();		
			
			String quary = "UPDATE users SET password = ? WHERE id = ?";
			DBManager myDb = new DBManager();
			Connection conn = myDb.getConnection();
			
			PreparedStatement ps = (PreparedStatement) conn.prepareStatement(quary);
			ps.setString(1, password);
			ps.setString(2, session.getAttribute("id").toString());

			
			int count = ps.executeUpdate();
			if(count > 0) {
				response.sendRedirect("settings.jsp");
			}

	
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}

}
