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
	
	int idx = Integer.parseInt(request.getParameter("idx"));
	String name = request.getParameter("name");
	String subject = request.getParameter("subject");
	String contents = request.getParameter("contents");
	String sql = "update tbl_guest02 set subject = ?, contents =?, name=?,moddate=sysdate where idx=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, subject);
	pstmt.setString(2, contents);
	pstmt.setString(3, name);
	pstmt.setInt(4, idx);
	
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