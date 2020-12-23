package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/user_s")
public class UserInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public UserInsertServlet() {
        super();
      
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String name = request.getParameter("name");
		String userid = request.getParameter("userid");
		String passwd = request.getParameter("passwd");
		String repasswd = request.getParameter("repasswd");
		String gender = request.getParameter("gender");
		String tel = request.getParameter("tel");
		String email1 = request.getParameter("email1");
		String email2 = request.getParameter("email2");
		String email3 = request.getParameter("email3");
		

	
		
		request.setAttribute("name", name);
		request.setAttribute("id", userid);
		request.setAttribute("pw", passwd);
		request.setAttribute("tel", tel);
		if(gender.equals("M")) {
			gender = "남자";
		}else if(gender.equals("F")) {
			gender = "여자";
		}
		
		request.setAttribute("gen", gender);
		request.setAttribute("m1", email1);
		
		if(email3.equals("9")){
			request.setAttribute("m2", email2);
		}else{
			request.setAttribute("m2", email3);
		}
		
	
		
//		response.sendRedirect("/Guest/guest_write_pro.jsp?row="+row);
		
		RequestDispatcher rd = request.getRequestDispatcher("Users/user_insert_pro.jsp");
		rd.forward(request, response);
	}

}
