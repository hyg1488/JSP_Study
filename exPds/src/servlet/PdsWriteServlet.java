package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import model.pdsDAO;
import model.pdsVO;

/**
 * Servlet implementation class PdsWriteServlet
 */
@WebServlet("/pds_write.do")
public class PdsWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PdsWriteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("Pds/pds_write.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		ServletContext context = getServletContext();
		String path = context.getRealPath("Pds/upload");
		String encType = "UTF-8";
		int sizeLimit = 2*1024*1024; // 파일 최대 용량 설정 (지금은 최대 2M로 설정함)
		
		MultipartRequest multi = new MultipartRequest(request, path, sizeLimit, encType, new DefaultFileRenamePolicy());
		// new DefalutFileRenamePolicy()  :  이 기능을 주면 파일 중복시 자동이름 변경  a.gif -> a1.gif
		
		pdsVO vo = new pdsVO();
		vo.setName(multi.getParameter("name"));
		vo.setEmail(multi.getParameter("email"));
		vo.setSubject(multi.getParameter("subject"));
		vo.setContents(multi.getParameter("contents"));
		vo.setPass(multi.getParameter("pass"));
		vo.setFilename(multi.getFilesystemName("filename"));
		
		System.out.println("파일" + vo.getFilename());
		pdsDAO dao = pdsDAO.getInstance();
		int row = dao.pdsWrite(vo);
		request.setAttribute("row", row);
		response.sendRedirect("pds_list.do");
	}

}
