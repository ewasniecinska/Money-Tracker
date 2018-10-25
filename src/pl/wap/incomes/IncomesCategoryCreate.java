package pl.wap.incomes;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.Connection;
import com.mysql.jdbc.PreparedStatement;

import pl.wap.DBManager;

/**
 * Servlet implementation class CategoryIncome
 */

@WebServlet("/addIncomesCategory")
public class IncomesCategoryCreate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String name = request.getParameter("category-name");
			String description = request.getParameter("category-description");
			HttpSession session=request.getSession();
			
			
			String quary = "INSERT INTO incomes_categories (name, description, user) VALUES (?, ?, ?)";
			DBManager myDb = new DBManager();
			Connection conn = myDb.getConnection();
			
			PreparedStatement ps = (PreparedStatement) conn.prepareStatement(quary);
			ps.setString(1, name);
			ps.setString(2, description);
			ps.setString(3, session.getAttribute("id").toString());
			
			int count = ps.executeUpdate();
			if(count > 0) {
				response.sendRedirect("incomes-categories.jsp");
			}

			
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}

}

