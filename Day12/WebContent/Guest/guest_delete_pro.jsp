<%@page import="Day12.model.GuestDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int idx = Integer.parseInt(request.getParameter("idx"));
	String pass = request.getParameter("pass");
	
	GuestDAO dao = new GuestDAO();
	int row = dao.guestDelete(idx, pass);
	
	
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
		opener.document.location.href="guest_list.jsp";
		self.close();
	</script>
<% } %>