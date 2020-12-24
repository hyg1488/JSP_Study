package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class userInsert
 */
@WebServlet("/user_insert.do")
public class userInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public userInsert() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "Users/user_insert.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String name = request.getParameter("name");
    	String userid = request.getParameter("userid");
    	String passwd = request.getParameter("passwd");
    	String gender = request.getParameter("gender");
    	String tel = request.getParameter("tel");
    	String email1 = request.getParameter("email1");
    	String email2 = request.getParameter("email2");
    	String email3 = request.getParameter("email3");
    	
		System.out.println("이름 : "+name+"<br>");
		
		int row = 1;
		
		request.setAttribute("name", name);
		request.setAttribute("row", row);
		request.setAttribute("userid", userid);
		request.setAttribute("pwd", passwd);
		request.setAttribute("gen", gender);
		request.setAttribute("tel", tel);
		request.setAttribute("e1", email1);
		request.setAttribute("e2", email2);
		request.setAttribute("e3", email3);
		
		RequestDispatcher rd = request.getRequestDispatcher("Users/user_insert_pro.jsp");
		rd.forward(request, response);
	}

}
