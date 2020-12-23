<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>


<%
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
	String [] fa = request.getParameterValues("fa");
	
	String str = fa[0];
	
	for(int i = 1; i<fa.length; i++){
		str = str+"," +fa[i];
	}
	
	out.print(str);
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>