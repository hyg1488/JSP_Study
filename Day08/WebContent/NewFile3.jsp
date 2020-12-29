<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	String age = request.getParameter("age");
    	String name = (String )request.getAttribute("name");	// request.getAttribute 는 Oject 임으로 String 으로 변환
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body bgcolor=pink>	
	forward 방식<br>
	나이 : <%=age %>
	이름 : <%=name %>
</body>
</html>