<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>	
<h1>계산 결과</h1>
        <ul>
        	<% int a = Integer.parseInt(request.getParameter("m1")); %>
        	<% int b = Integer.parseInt(request.getParameter("m2")); %>
        	<% String y = request.getParameter("yun"); 
        		int c = 0;%>
        	<%  if(y.equals("+")) c =  a + b;
        	else if(y.equals("-")) c =  a - b;
        	else if(y.equals("*")) c =  a * b;
        	else if(y.equals("/")) c =  a / b;
        	else if(y.equals("%")) c =  a % b;
        	%>
            <li>정수 1: <%= a%></li>
            <li>정수 2: <%= b %></li>
            <li>결과 : <%= a%> <%= y %> <%= b%> = <%= c%></li>
          
        </ul>

</body>
</html>