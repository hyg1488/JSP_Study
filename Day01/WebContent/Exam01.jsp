<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table {
    width: 800px
    ;
    border: 1px solid #444444;
  }
  th, td {
  	width:180px;
    border: 1px solid #444444;
  }
  .a{
  	width: 540px
  }
  .b{

  }
</style>
</head>
<body>
	<h2> 목록 만들기 </h2>
	<ol type ="A">
		<li> 테스트</li>
		<li> 테스트</li>
		<li> 테스트</li>
		<li> 테스트</li>
		
	</ol>
	
	<ul>
		<li> 테스트</li>
		<li> 테스트</li>
	
	</ul>
	
	<table
	>
		<caption> 입사지원서</caption>
		
		<!-- colspan  , rowspan -->
	
		<tr>
		<td rowspan ="4">사진</td>
		<td rowspan="2">성명</td>
		<td>한글</td>
		<td class = "a"></td>
		<td >주민번호</td>
		<td class ="a"></td>
		</tr>
		<tr>
		<td>영문</td>
		<td></td>
		<td>전화번호</td>
		<td></td>
		
		</tr>
		<tr>
		<td colspan ="2">E-Mail</td>
		
		<td></td>
		<td>휴대폰번호</td>
		<td></td>
		</tr>
		<tr>
		<td colspan ="2">주소</td>
		
		<td colspan="3"></td>
		
		
		</tr>
	</table>
</body>
</html>