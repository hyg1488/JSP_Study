package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Service.Action;
import Service.GuestListAction;
import Service.GuestWriteAction;
import Service.GuestWriteProAction;

/**
 * Servlet implementation class GuestController
 */
@WebServlet("/Guest")
public class GuestController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GuestController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 클라이언트 요청 받기
		String cmd = request.getParameter("cmd");
		System.out.println("요청 확인 : "+cmd);
		Action action = null;
		if(cmd.equals("guest_list")) {
			action = new GuestListAction();
		}else if(cmd.equals("guest_write")) {
			action = new GuestWriteAction();
		}else if(cmd.equals("guest_write_pro")) {
			action = new GuestWriteProAction();
		}
		
		action.execute(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		doGet(request, response);
	}

}
