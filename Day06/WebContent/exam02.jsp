<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function send(){
		alert("전송");
		mat.action = "exam03.jsp";
		mat.submit();
	}
</script>
</head>
<body>
	<form name=mat method=post>
	<table>
	<tr>
		<td rowspan="1"> 입력 </td>
	</tr>
	<tr>
		<td> 값 1 :</td><td><input type="text" name = "m1" value =""></td>
	</tr>
	<tr>
		<td> 값 2 :</td><td><input type="text" name = "m2" value =""></td>
	</tr>
	<tr><td><input type ="button" value ="계산" onclick="send()"> </td></tr>
	</table>
	</form>
</body>
</html>