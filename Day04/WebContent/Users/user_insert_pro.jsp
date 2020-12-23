<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <% 
   		request.setCharacterEncoding("utf-8");
   	// get 방식은 한글이 무조건 깨짐. get 방식은 넘길때 인코딩 해야함. post 는 괜찮음.
   %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3> xxx님 회원가입 되었습니다.</h3>
이름 : ${name} <br>
아이디 : ${id}	<br>
비밀번호 :  ${pw}	<br>
성별 : ${gen}	<br>
전화 : ${tel} <br>
이메일 :${m1} @ ${m2}

<h3><a href="/index.jsp"> 로그인 </a> </h3>
</body>
</html>