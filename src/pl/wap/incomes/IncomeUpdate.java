package pl.wap.incomes;

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
 * Servlet implementation class IncomeUpdate
 */

@WebServlet("/updateIncome")
public class IncomeUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String name = request.getParameter("income-name");
			String amount = request.getParameter("income-amount");
			String date = request.getParameter("income-date");
			String description = request.getParameter("income-description");
			String category = request.getParameter("income-category");
			String expensesId = request.getParameter("income-id");
			
			
			String quary = "UPDATE incomes SET name = ?, amount = ?, date = ?, description = ?, category = ? WHERE id = ?";
			DBManager myDb = new DBManager();
			Connection conn = myDb.getConnection();
			
			PreparedStatement ps = (PreparedStatement) conn.prepareStatement(quary);
			ps.setString(1, name);
			ps.setString(2, amount);
			ps.setString(3, date);
			ps.setString(4, description);
			ps.setString(5, category);
			ps.setString(6, expensesId);
			
			int count = ps.executeUpdate();
			if(count > 0) {
				response.sendRedirect("incomes-details.jsp");
			}

			
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}
}

