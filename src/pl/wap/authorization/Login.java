package pl.wap.authorization;

import pl.wap.authorization.PasswordProtection;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Login
 */

@WebServlet("/loginAction")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {			
			String uname=request.getParameter("username");
			String pass=request.getParameter("password");
			LoginDao dao=new LoginDao();
						
			if(dao.checkLoginData(uname, pass))
			{

				int userId = dao.getUserId(uname);	
				HttpSession session=request.getSession();
				session.setAttribute("username",uname);
				session.setAttribute("id", userId);
				session.setAttribute("email", dao.getUserEmail(uname));
				response.sendRedirect("index.jsp");
				
			}else {
				
				response.sendRedirect("login.jsp");
				
			}
			
			
	}

}
