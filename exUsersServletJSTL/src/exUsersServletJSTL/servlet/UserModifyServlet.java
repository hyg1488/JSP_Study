package exUsersServletJSTL.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import exUsersServletJSTL.model.UserDAO;
import exUsersServletJSTL.model.UserVO;

/**
 * Servlet implementation class UserModifyServlet
 */
@WebServlet("/user_modify")
public class UserModifyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserModifyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		UserVO vo = (UserVO) session.getAttribute("user");
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("Users/user_modify.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String passwd = request.getParameter("newpasswd");
		String tel = request.getParameter("tel");
		String userid = request.getParameter("userid");
		
		UserDAO dao = UserDAO.getInstance();
		int row = dao.userModify(passwd, tel,userid);
		
		request.setAttribute("row", row);
		HttpSession session = request.getSession();
		session.invalidate();
		RequestDispatcher dispatcher = request.getRequestDispatcher("Users/user_modify_pro.jsp");
		dispatcher.forward(request, response);
		
	}

}
