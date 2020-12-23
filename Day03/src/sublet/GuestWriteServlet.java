package sublet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.org.apache.xerces.internal.impl.xpath.regex.REUtil;


// 가짜 url 을 이용해 클래스 이름 노출을 최소화함. - 주의 !!! 이걸 다른 것과 똑같은 이름으로 줄 경우 ! 톰캣자체에서 오류 !
@WebServlet("/guest_write011")
public class GuestWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public GuestWriteServlet() {
        super();
    }

	// GET 방식이면 여기서 프로그램 작성
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
//		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	// POST 방식이면 여기에서 프로그램 작성
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String name = request.getParameter("name");
		String subject = request.getParameter("subject");
		String contents = request.getParameter("contents");
		
		// request 내장객체 : jsp 에서 객체를 이미 만들어주기 때문에 new 를 이용해서 생성하지 않아도 사용 가능 
		
		
		int row = 1;
		
		
		request.setAttribute("row", row);
		request.setAttribute("name", name);
		request.setAttribute("subject", subject);
		request.setAttribute("contents", contents);
		
//		response.sendRedirect("/Guest/guest_write_pro.jsp?row="+row);
		
		RequestDispatcher rd = request.getRequestDispatcher("/Day03/Guest/guest_write_pro.jsp");
		rd.forward(request, response);
		
//		doGet(request, response); // post 로 들어오면 자동으로 위로(GET) 올려주는 메서드 post 와 get 의 구분을 안주면 이걸 사용
	}

}
