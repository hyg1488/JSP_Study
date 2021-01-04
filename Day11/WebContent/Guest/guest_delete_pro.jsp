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
	String sql = "DELETE TBL_GUEST02 WHERE IDX = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1, idx);
	int row = pstmt.executeUpdate();
	
if(row == 0){
%>
	<script>
		alert("삭제 실패");
		history.back();
	</script>
<%
	} else {
%>
	<script>
		alert("삭제 완료");
		opener.document.location.href="guest_list.jsp";
		self.close();

	</script>
<% } %>