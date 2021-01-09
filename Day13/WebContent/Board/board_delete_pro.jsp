<%@page import="Day13.model.BoardDAO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int idx = Integer.parseInt(request.getParameter("idx"));
	String pass = request.getParameter("pass");
	
	BoardDAO dao = BoardDAO.getInstatnce();
	int row = dao.boardDelete(idx, pass);
	if(row == 0){
%>
	<script>
		alert("삭제 실패");
		history.back();
	</script>
<%
	} else {
%>
	<script>
		alert("삭제 완료");
		opener.document.location.href="board_list.jsp";
		self.close();
	</script>
<% } %>