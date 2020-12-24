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
		mat.action = "exam04_pro.jsp";
		mat.submit();
	}
</script>

</head>
<body>
	<form name=mat method=post>
	<table>
	<tr>
		<td rowspan="1"> 계산기 </td>
	</tr>
	<tr>
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
</body>
</html>