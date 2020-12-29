<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

     <%
    	request.setCharacterEncoding("utf-8");
    %>
    
    <jsp:useBean id="mem" class="model.MemberBean"> 	<!-- id 는 변수명--> 
    	<jsp:setProperty name ="mem" property ="*" /> <!-- * 는 모든 데이터를 의미 -->
    </jsp:useBean>

	<%
		String[] s = mem.getFa();
		String fa = s[0];
		for(int i = 1; i < s.length; i++){
			fa = fa+","+s[i];
		}
	%>

  	회원 이름	: <%= mem.getName() %> <br>
  	회원 ID	: <%= mem.getUserid() %><br>
  	비밀번호 	: <%= mem.getPasswd() %><br>
<%--   	주소 구분 	: <%= mem.getGubun() %><br>
 --%>  	관심 분야	: <%= fa %><br>
  	
  	