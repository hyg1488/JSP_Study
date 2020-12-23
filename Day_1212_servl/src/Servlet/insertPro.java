package Servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class insertPro
 */
@WebServlet("/insertPro")
public class insertPro extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public insertPro() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String name = request.getParameter("name");
		String [] fa = request.getParameterValues("fa");
		
		String faS = fa[0];
		for (int i = 1; i < fa.length; i++) {
			faS += fa+","+fa[i];
		}
		
		String[] s = faS.split(",");
		
		int cnt = fa.length;
		
		request.setAttribute("name", name);
		for (int i = 0; i < s.length; i++) {
			request.setAttribute("fa"+i, s[i]);
		}
		
		RequestDispatcher rd = request.getRequestDispatcher("Member/userinfo_insert_pro.jsp");
		rd.forward(request, response);
		
		
	}

}
