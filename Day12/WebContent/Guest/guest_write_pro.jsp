<%@page import="Day12.model.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="Day12.model.*" %>
   <%
   	request.setCharacterEncoding("utf-8");
      String name = request.getParameter("name");
      String pass = request.getParameter("pass");
      String subject = request.getParameter("subject");
      String contents = request.getParameter("contents");
      
      BoardVO vo = new BoardVO();
      vo.setName(name);
      vo.setPass(pass);
      vo.setSubject(subject);
      vo.setContents(contents);
      
      GuestDAO dao = new GuestDAO();
      int row = dao.guestWrite(vo);
   //   int row = dao.guestwrite(name, pass, subject, contents);

   	if(row == 0){
   %>
	<script>
		alert("등록 실패");
		history.back();
	</script>
<%
	} else {
%>
	<script>
		alert("등록 완료");
		location.href = "guest_list.jsp"
	</script>
<% } %>