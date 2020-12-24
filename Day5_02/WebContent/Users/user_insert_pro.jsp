<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>	
이름 		: ${name}
성별		: ${gen}
아이디 	: ${userid}
비밀번호	: ${pwd}
이메일 	: ${e1} @ ${e2}${e3} 
전화 번호 	: ${tel}

<%
	String name = (String) request.getAttribute("name");
%>

이름 : <%= name %>
</body>
</html>