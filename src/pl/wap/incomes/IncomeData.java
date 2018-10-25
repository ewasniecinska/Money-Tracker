package pl.wap.incomes;

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
 * Servlet implementation class IncomeData
 */
@WebServlet("/getIncome")
public class IncomeData extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String sql = "SELECT id, name, amount, date, description, category FROM incomes WHERE id = ?";
		String categoryId = request.getParameter("income-id");
		System.out.println(categoryId);
		
		try{
			Connection conn = DBManager.getConnection();
			PreparedStatement ste= conn.prepareStatement(sql);
			ste.setObject(1, categoryId);
			ResultSet rse=ste.executeQuery();
			while (rse.next()) {
				request.setAttribute("incomesID", rse.getString("id"));
				request.setAttribute("incomesName", rse.getString("name"));
				request.setAttribute("incomesAmount", rse.getFloat("amount"));
				request.setAttribute("incomesDate", rse.getDate("date"));
				request.setAttribute("incomesDescription", rse.getString("description"));
				request.setAttribute("incomesCategory", rse.getInt("category"));
			}
		} catch(Exception e){
			System.out.println(e);
		}
		
		request.getRequestDispatcher("incomes-edit.jsp").forward(request, response);

	}
		
}

