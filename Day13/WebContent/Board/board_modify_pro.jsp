<%@page import="Day13.model.BoardDAO"%>
<%@page import="Day13.model.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
    request.setCharacterEncoding("utf-8");
	BoardVO vo = new BoardVO();
	vo.setIdx(Integer.parseInt(request.getParameter("idx")));
	vo.setName(request.getParameter("name"));
	vo.setEmail(request.getParameter("email"));
	vo.setSubject(request.getParameter("subject"));
	vo.setPass(request.getParameter("pass"));
	vo.setContents(request.getParameter("contents"));
	vo.setIp(request.getRemoteAddr());
	
	BoardDAO dao = BoardDAO.getInstatnce();

	int row = dao.boardEdit(vo);
	if(row == 0){
%>
	<script>
		alert("수정 실패");
		history.back();
	</script>
<%
	} else {
%>
	<script>
		alert("수정 완료");
		location.href = "board_list.jsp"
	</script>
<% } %>