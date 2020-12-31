<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<%
	String myDriver = "oracle.jdbc.driver.OracleDriver";
	String myUrl = "jdbc:oracle:thin:@localhost:1521:xe";
	String myId = "jslhrd46";
	String myPass = "1234";
%>

<%
	// DB 연동 테스트
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try{
		Class.forName(myDriver);
		conn = DriverManager.getConnection(myUrl, myId, myPass);
		
	}catch(Exception e){
		
	}
	
	request.setCharacterEncoding("utf-8");
	
	int idx = Integer.parseInt(request.getParameter("idx"));
	String email = request.getParameter("email");
	String subject = request.getParameter("subject");
	String contents = request.getParameter("contents");
	String pass = request.getParameter("pass");
	String ip = request.getRemoteAddr();

	
	String query = "update tbl_board set email=?, subject=?, contents=? where idx=? and pass=?)";
			
	pstmt = conn.prepareStatement(query);
	pstmt.setString(1, email);
	pstmt.setString(2, subject);
	pstmt.setString(3, contents);
	pstmt.setInt(4, idx);
	pstmt.setString(5, pass);
	
	int row = pstmt.executeUpdate();	// insert, update , delete 는 업데이트된 수를 리턴. (0이면 업뎃 없다는 뜻.)
	if(row == 0){
%>    

	<script>
		alert("오류입니다. \n 다음에 다시 등록");
		history.back();
	</script>

<%
	}else{
%>
	<script>
		alert("등록 되었습니다.");
		location.href = "board_list.jsp";
	</script>
<%
	}
%>