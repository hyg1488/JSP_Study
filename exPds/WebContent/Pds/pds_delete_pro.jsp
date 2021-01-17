<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:choose>
	<c:when test="${row==1}">
		<script>
			alert("삭제 되었습니다");
			opener.location.href="pds_list.do";
			self.close();
		</script>	
	</c:when>
	<c:when test="${row==0 }">
		<script>
			alert("삭제 실패!");
			history.back();
		</script>
	</c:when>
</c:choose>