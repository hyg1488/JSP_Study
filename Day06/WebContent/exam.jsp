<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%!
 	int add(int x, int y){
	 	int result = 0;
	 	for(int i = x; i<=y; i++){
	 		result += i;
	 	}
	 return result;
	 }
 %>
 
 <%
 	int s = add(1, 20);
 %>
 
<%  
	String[][] hak = {{"1","홍길동","010-4444-1111"},{"2","홍동","010-1111-1111"},{"3","동동","010-22222-1111"},{"4","열열","010-1234-1111"},{"5","홍오","010-4444-1111"}};
%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	int result02 = 0;
	for(int i = 1; i<=20; i++){
		result02 += i;
		if(result02/2 == 0){%>
			i = <%=i %>
			<h5 style="color:red;">result = <%=result02 %></h5>
		<%	
		}else{
		
		%>
			i = <%=i %>
			<h5 style = "color:blue;">result = <%= result02 %></h5><br>
		<%
		}%>
 		
 	
 		<%
 	}
	%>
	<h3> s =  <%= s %> </h3>
	
	
	
	<table>
		<tr>
			<td>번호</td><td>이름</td><td>전화</td>
		</tr>
		<%for(int i = 0; i<hak.length; i++){ %>
		<tr>
			<td><%=hak[i][0]%></td><td><%= hak[i][1] %><td><%= hak[i][2] %></td>
		</tr>
		<% }%>
		
	</table>
</body>
</html>