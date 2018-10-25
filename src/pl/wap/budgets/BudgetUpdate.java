package pl.wap.budgets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.PreparedStatement;

import pl.wap.DBManager;

/**
 * Servlet implementation class BudgetUpdate
 */
@WebServlet("/updateBudget")
public class BudgetUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String name = request.getParameter("budget-name");
			String category = request.getParameter("budget-category");
			String start_date = request.getParameter("start-date");
			String frequency = request.getParameter("budget-frequency");
			System.out.println(frequency);
			String budget = request.getParameter("budget-amount");
			String budgetId = request.getParameter("budget-id");
			
			
			String quary = "UPDATE budgets SET name = ?, category = ?, start_date = ?, frequency = ?, budget = ? WHERE id = ?";
			DBManager myDb = new DBManager();
			Connection conn = myDb.getConnection();
			
			PreparedStatement ps = (PreparedStatement) conn.prepareStatement(quary);
			ps.setString(1, name);
			ps.setString(2, category);
			ps.setString(3, start_date);
			ps.setString(4, frequency);
			ps.setString(5, budget);
			ps.setString(6, budgetId);
			
			int count = ps.executeUpdate();
			if(count > 0) {
				response.sendRedirect("budgets-details.jsp");
			}

			
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}
}
