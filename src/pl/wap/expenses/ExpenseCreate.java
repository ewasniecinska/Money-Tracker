package pl.wap.expenses;

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
 * Servlet implementation class ExpensesAction
 */
@WebServlet("/addExpense")
public class ExpenseCreate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			try {
				String name = request.getParameter("expenses-name");
				String amount = request.getParameter("expenses-amount");
				String date = request.getParameter("expenses-date");
				String description = request.getParameter("expenses-description");
				String category = request.getParameter("expenses-category");
				HttpSession session=request.getSession();
				
				
				String quary = "INSERT INTO expenses (name, amount, date, description, category, user) VALUES (?, ?, ?, ?, ?, ?)";
				DBManager myDb = new DBManager();
				Connection conn = myDb.getConnection();
				
				PreparedStatement ps = (PreparedStatement) conn.prepareStatement(quary);
				ps.setString(1, name);
				ps.setString(2, amount);
				ps.setString(3, date);
				ps.setString(4, description);
				ps.setString(5, category);
				ps.setInt(6, (int) session.getAttribute("id"));
				
				int count = ps.executeUpdate();
				if(count > 0) {
					response.sendRedirect("expenses-details.jsp");
				}

		
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
	}
}

