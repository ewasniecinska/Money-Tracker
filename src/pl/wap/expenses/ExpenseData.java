package pl.wap.expenses;

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
 * Servlet implementation class ExpensesData
 */
	@WebServlet("/getExpenese")

	public class ExpenseData extends HttpServlet {
		private static final long serialVersionUID = 1L;

		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String sql = "SELECT id, name, amount, date, description, category FROM expenses WHERE id = ?";
			String categoryId = request.getParameter("expense-id");
			System.out.println(categoryId);
			
			try{
				Connection conn = DBManager.getConnection();
				PreparedStatement ste= conn.prepareStatement(sql);
				ste.setObject(1, categoryId);
				ResultSet rse=ste.executeQuery();
				while (rse.next()) {
					request.setAttribute("expensesID", rse.getString("id"));
					request.setAttribute("expensesName", rse.getString("name"));
					request.setAttribute("expensesAmount", rse.getFloat("amount"));
					request.setAttribute("expensesDate", rse.getDate("date"));
					request.setAttribute("expensesDescription", rse.getString("description"));
					request.setAttribute("expensesCategory", rse.getInt("category"));
				}
			} catch(Exception e){
				System.out.println(e);
			}
			
			request.getRequestDispatcher("expenses-edit.jsp").forward(request, response);

		}
	}

