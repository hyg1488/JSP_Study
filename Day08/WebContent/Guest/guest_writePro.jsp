<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   <%--  <%
    	request.setCharacterEncoding("utf-8");
    	String name = request.getParameter("name");
    	String subject = request.getParameter("subject");
    	String contents = request.getParameter("contents");
    	// 리플레이스로 contents 처리 contents = "\n 을 <br> 로 바꾸는 replace 사용"
    	out.print("작성자 : " + name + "<br>");
    	out.print("제목 : " + subject + "<br>");
    	out.print("내용 : <pre>"+contents+"</pre><br>");
    %> --%>
    
    <%
    	request.setCharacterEncoding("utf-8");
    %>
    
    <jsp:useBean id="guest" class="model.GuestBean"> 	<!-- id 는 변수명--> 
    	<jsp:setProperty name ="geust" property ="*" /> <!-- * 는 모든 데이터를 의미 -->
    </jsp:useBean>

	<%
		guest.setContents(guest.getContents().replace("\n", "<br>"));
	%>
  	이름 : <%= guest.getName() %> <br>
  	제목 : <%= guest.getSubject() %><br>
  	내용 : <%= guest.getContents() %><br>