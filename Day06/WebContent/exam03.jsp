<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>전달받은 데이터</h1>
        <ul>
        	<% int a = Integer.parseInt(request.getParameter("m1")); %>
        	<% int b = Integer.parseInt(request.getParameter("m2")); %>
        	<% int c = a+b; %>
            <li>숫자 1: <%= a%></li>
            <li>숫자 2: <%= b %></li>
            <li>숫자의 합 : <%= a%> + <%= b%> = <%= c%></li>
          
        </ul>
	
	

</body>
</html>