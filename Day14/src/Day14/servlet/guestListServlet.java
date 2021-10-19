package Day14.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Day14.model.GuestDAO;
import Day14.model.GuestDTO;


@WebServlet("/guest_list")
public class guestListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public guestListServlet() {
        super();
      
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		GuestDAO dao = GuestDAO.getInstance();
		int totcount = dao.guestCount();
		List<GuestDTO> list = dao.guestList();
		
		request.setAttribute("totcount", totcount);
		request.setAttribute("list", list);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("Guest/guest_list.jsp");
		dispatcher.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
