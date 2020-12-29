<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<from method="post" action="test.jsp">
	<input type="submit" value="전송">
	컨텍스트 패스 : 	<%= request.getContextPath() %><br>
	요청 방식 :		<%= request.getRequestURL() %><br>
	요청한 URL : 	<%= request.getRequestURI() %><br>
	요청한 URI :	<%= request.getServerName() %><br>
	서버 이름 : 	<%= request.getProtocol() %><br>
	프로토콜 :		<%= request.getMethod() %><br>
	세션 객체 : 	<%= request.getSession() %> <br>
	요청한 사용자 : 	<%= request.getRemoteUser() %> <br>
	요청한 호스트 주소 : 	<%= request.getRemoteAddr() %> <br>
	</from>
				<a href="test.jsp">이동</a>
</body>
</html>