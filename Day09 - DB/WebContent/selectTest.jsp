<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "jslhrd46", "1234");
			
		}catch(Exception e){
			
		}
		
		String sql = "select * from department";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border = "1">
		<tr>
			<td> 부서번호 </td> <td>부서명</td><td>지역명</td>
		</tr>
		
		<%while(rs.next()){%>
			
		<tr>
			<td><%=rs.getInt("dno") %></td><td><%= rs.getString("dname") %></td><td><%= rs.getString("loc") %></td>
		</tr>
		<%} 
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
		if(conn != null) conn.close();
		%>
	</table>
</body>
</html>