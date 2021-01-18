package Service;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;
import Model.GuestDAO;
import Model.GuestVO;

public class GuestWriteProAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("등록처리");
		GuestDAO dao = GuestDAO.getInstance();
		
		int totcount = dao.guestCount();
		
		List<GuestVO> list = dao.guestList();
		
		request.setAttribute("totcount", totcount);
		request.setAttribute("list", list);
		RequestDispatcher dis = request.getRequestDispatcher("Guest/guset_list");
		dis.forward(request, response);

	}

}
