<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
	int dno = 70;
	String dname = "aaaa1";
	String loc = "ddddd2";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	String sql = "insert into department(dno, dname, loc) values(?,?,?)";
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "jslhrd46", "1234");
		
	}catch(Exception e){
		
	}
	
	pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1, dno);
	pstmt.setString(2, dname);
	pstmt.setString(3, loc);
	
	int row = pstmt.executeUpdate();
	if(row == 1){
%>
	<script>
		alert("성공");
	</script>
<%
	}
%>