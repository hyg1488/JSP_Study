<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	

	function send(){
		alert("페이지를 이동합니다.");
		mat.action = "NewFile.jsp";
		mat.submit();
	}
</script>

<%	
//	int row = 0;
//	if(request.getParameter("row") != null){
//		row = Integer.parseInt(request.getParameter("row"));
//	}	

// request.getParameter("row") 를 쓸경우 row 값을 이용해 페이지를 결정할 수 있다.
// 첫 실행일 경우 row 값은 null 이므로 1페이지가 나오고
// 1페이지에서 넘어갈때 row 값은 null 이 아니게 되므로 2페이지로 넘어가고
// 2페이지에서는 row 데이터를 넘겨주지 않음으로 다시 null 값이 된다.

	String ss = request.getParameter("m1");
	out.print(ss);
	
	int cnt = 0;
	try{
	if(request.getParameter("h").equals("1")) cnt = 1;

	}catch(Exception e){
		
	}
%>
</head>
<body>
<%
	if(cnt == 0){
		%>
		<form name=mat method=post>
		<table>
		<tr>
			<td rowspan="1"> 계산기 </td>
		</tr>
		<tr>
			<td><input type ="hidden" name ="h" value ="1"></td>
			<td><input type="text" name = "m1" size = "20px" value =""></td>
			<td><select name=yun  class="formbox">
																<option value="0">선택
																<option value="+"> +
																<option value="-"> -
																<option value="*"> *
																<option value="/"> /
																<option value="%"> %
														</select></td>
			<td><input type="text" name = "m2" value =""></td>
		</tr>
		<tr><td><input type ="button" value ="계산" onclick="send()"> </td></tr>
		</table>
		</form>
		<%  cnt = 1;
	}else if(cnt == 1){
		int a = Integer.parseInt(request.getParameter("m1"));
    	int b = Integer.parseInt(request.getParameter("m2"));
    	String y = request.getParameter("yun"); 
    	int c = 0;
    	if(y.equals("+")) c =  a + b;
    	else if(y.equals("-")) c =  a - b;
    	else if(y.equals("*")) c =  a * b;
    	else if(y.equals("/")) c =  a / b;
    	else if(y.equals("%")) c =  a % b;
    	%>
    	<h3>계산 결과</h3>
    	<ul>
    	<li>정수 1: <%= a%></li>
            <li>정수 2: <%= b %></li>
            <li>결과 : <%= a%> <%= y %> <%= b%> = <%= c%></li>
          
        </ul>
        <form name=mat method=post>
        <input type ="hidden" name ="h" value ="tt">
        <input type ="button" name ="back" value ="계산기로 돌아가기" onclick="send()">
    	</form>
    	<%
	}
%>

</body>
</html>