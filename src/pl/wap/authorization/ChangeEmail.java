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
@WebServlet("/changeEmail")
public class ChangeEmail extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String email = request.getParameter("new-email");
			HttpSession session=request.getSession();		
			
			String quary = "UPDATE users SET email = ? WHERE id = ?";
			DBManager myDb = new DBManager();
			Connection conn = myDb.getConnection();
			
			PreparedStatement ps = (PreparedStatement) conn.prepareStatement(quary);
			ps.setString(1, email);
			ps.setString(2, session.getAttribute("id").toString());

			
			int count = ps.executeUpdate();
			if(count > 0) {
				session.setAttribute("email", email);
				response.sendRedirect("settings.jsp");
			}

	
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}

}
