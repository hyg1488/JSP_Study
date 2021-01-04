<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>

<%
	request.setCharacterEncoding("utf-8");
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
	
	String name = request.getParameter("name");
	String subject = request.getParameter("subject");
	String pass = request.getParameter("pass");
	String contents = request.getParameter("contents");
	String ip = request.getRemoteAddr();
	
	System.out.println("왕!"+name);
	System.out.println(subject);
	System.out.println(contents);
	System.out.println(pass);
	System.out.println(ip);
	String sql = "insert into tbl_guest02(idx, name, subject, contents, pass, ip) values(tbl_guest_seq_idx01.nextval, ?,?,?,?,?)";

	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, name);
	pstmt.setString(2, subject);
	pstmt.setString(3, contents);
	pstmt.setString(4, pass);
	pstmt.setString(5, ip);

	int row = pstmt.executeUpdate();
	
	if(row == 0){
%>
	<script>
		alert("등록 실패");
		history.back();
	</script>
<%
	} else {
%>
	<script>
		alert("등록 완료");
		location.href = "guest_list.jsp"
	</script>
<% } %>