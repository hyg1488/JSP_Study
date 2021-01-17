package servlet;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.pdsDAO;

/**
 * Servlet implementation class PdsDeleteServlet
 */
@WebServlet("/pds_delete.do")
public class PdsDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PdsDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = Integer.parseInt(request.getParameter("idx"));
		
		request.setAttribute("idx", idx);
		RequestDispatcher disp = request.getRequestDispatcher("Pds/pds_delete.jsp");
		disp.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = Integer.parseInt(request.getParameter("idx"));
		String pass = request.getParameter("pass");
		System.out.println("pass = "+pass +" row = "+idx);

		pdsDAO dao = pdsDAO.getInstance();
		String filename = dao.getFile(idx);
		int row = dao.pdsDelete(idx, pass);
		if(row == 1) {
			ServletContext context = getServletContext();
			String path = context.getRealPath("Pds/upload/");
			File file = new File(path+filename);
			if(file.exists()) {
				file.delete();
			}
		}
		request.setAttribute("row", row);
		
		RequestDispatcher disp = request.getRequestDispatcher("Pds/pds_delete_pro.jsp");
		disp.forward(request, response);
	}

}
