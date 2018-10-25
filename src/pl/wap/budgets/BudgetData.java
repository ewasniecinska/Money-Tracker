package pl.wap.budgets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pl.wap.DBManager;

/**
 * Servlet implementation class BudgetData
 */
@WebServlet("/getBudget")
public class BudgetData extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String sql = "SELECT id, name, category, start_date, frequency, budget FROM budgets WHERE id = ?";
		String budgetId = request.getParameter("budget-id");
		System.out.println(budgetId);
		
		try{
			Connection conn = DBManager.getConnection();
			PreparedStatement ste= conn.prepareStatement(sql);
			ste.setObject(1, budgetId);
			ResultSet rse=ste.executeQuery();
			while (rse.next()) {
				request.setAttribute("budgetsID", rse.getString("id"));
				request.setAttribute("budgetsName", rse.getString("name"));
				request.setAttribute("budgetsCategory", rse.getInt("category"));
				request.setAttribute("budgetsDate", rse.getDate("start_date"));
				request.setAttribute("budgetsFrequency", rse.getString("frequency"));
				request.setAttribute("budgetsAmount", rse.getFloat("budget"));
			}
		} catch(Exception e){
			System.out.println(e);
		}
		
		request.getRequestDispatcher("budgets-edit.jsp").forward(request, response);

	}
}

