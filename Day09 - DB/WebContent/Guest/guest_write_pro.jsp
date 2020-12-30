<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<%
	// 값 받기
		request.setCharacterEncoding("utf-8");
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "jslhrd46", "1234");
			
		}catch(Exception e){
			
		}
	// db 연결
	String name = request.getParameter("name");
	String subject = request.getParameter("subject");
	String contents = request.getParameter("contents");
	contents = contents.replace("\n", "<br>");
	String query = "insert into tbl_guest(idx, name, subject, contents) values(tbl_guest_seq_idx.nextval, ?,?,?)";
	
	pstmt = conn.prepareStatement(query);
	pstmt.setString(1, name);
	pstmt.setString(2, subject);
	pstmt.setString(3, contents);
	int row = pstmt.executeUpdate();
	if(row == 1){
%>

<script>
	alert("등록되었습니다");
	location.href="guest_list.jsp";
</script>

<%}else{
%>

<script>
	alert("서버에러 \n 다음에");
	history.back();
</script>

<% } %>