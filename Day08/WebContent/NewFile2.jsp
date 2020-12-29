<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 	int age = Integer.parseInt(request.getParameter("age"));
	String name = request.getParameter("name");
 	if(age <= 19){
 		%>
 		<script type="text/javascript">
 			alert("19세 미만이므로 입장 불가")
 			history.go(-1)
 		</script>
 		<% 
 	}else{
 		response.sendRedirect("NewFile3.jsp?name="+name);
// 		request.setAttribute("name", name);
//		RequestDispatcher dispatcher = request.getRequestDispatcher("NewFile3.jsp");
//		dispatcher.forward(request, response);
 		
 		
 	}
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
</body>
</html>