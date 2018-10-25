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
 * Servlet implementation class testIncome
 */
@WebServlet("/getExpenesesCategoryData")

	public class ExpensesCategoryData extends HttpServlet {
		private static final long serialVersionUID = 1L;

		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String sql = "SELECT id, name, description FROM expenses_categories WHERE id = ?";
			String categoryId = request.getParameter("category-id");

			try{
				Connection conn = DBManager.getConnection();
				PreparedStatement ste= conn.prepareStatement(sql);
				ste.setObject(1, categoryId);
				ResultSet rse=ste.executeQuery();
				while (rse.next()) {
					request.setAttribute("categoryName", rse.getString("name"));
					request.setAttribute("descriptionName", rse.getString("description"));
					request.setAttribute("categoryID", rse.getString("id"));
				}
			} catch(Exception e){
				System.out.println(e);
			}
			
			request.getRequestDispatcher("expenses-categories-edit.jsp").forward(request, response);

		}
	}

