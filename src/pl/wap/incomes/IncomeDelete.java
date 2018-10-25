package pl.wap.incomes;

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
 * Servlet implementation class ExpensesDeleteAction
 */
@WebServlet("/deleteIncome")
public class IncomeDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String expensesId = request.getParameter("income-id");
			
			
			String quary = "DELETE FROM incomes WHERE id = ?";
			DBManager myDb = new DBManager();
			Connection conn = myDb.getConnection();
			
			PreparedStatement ps = (PreparedStatement) conn.prepareStatement(quary);
			ps.setString(1, expensesId);

			
			int count = ps.executeUpdate();
			if(count > 0) {
				response.sendRedirect("incomes-details.jsp");
			}

	
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}

}
