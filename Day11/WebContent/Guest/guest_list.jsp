<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*, java.util.*" %>

<%
	request.setCharacterEncoding("utf-8");
	String myDriver = "oracle.jdbc.driver.OracleDriver";
	String myUrl = "jdbc:oracle:thin:@localhost:1521:xe";
	String myId = "jslhrd46";
	String myPass = "1234";
%>

<%
	// 검색 값 받기
	String search = "", key="";
	out.print(key);
// search = request.getParameter("saerch");
//	key = request.getParameter("key");			//검색버튼을 이용할때랑 이용하지 않을때 구분하기 위해 위처럼 사용
	
	// DB 연동 테스트
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	int totcount = 0;	// 전체 건수
	try{
		Class.forName(myDriver);
		conn = DriverManager.getConnection(myUrl, myId, myPass);
		// 전체 자료수 카운트
		String query1 = "select count(*) from tbl_guest02";
		String query2 = "select count(*) from tbl_guest02 where "+search+" like '% "+key+"%'";
		
		if(key.equals("")){
			pstmt = conn.prepareStatement(query1);
		}else{
			pstmt = conn.prepareStatement(query2);
		}
		
		rs = pstmt.executeQuery();
		if(rs.next()){
			totcount = rs.getInt(1);
		}
	}catch(Exception e){
		
	}
	
%>
<html>
<head><title>방명록 읽기</title>
<link rel="stylesheet" type="text/css" href="stylesheet.css">
<style type="text/css">
  a.list {text-decoration:none;color:black;font-size:10pt;}
</style>
</head>
<body bgcolor="#FFFFFF" topmargin="0" leftmargin="0">
<table border="0" width="800">
  <tr>
    <td width="20%" height="500" valign="top" bgcolor="#ecf1ef">
	<!-- 다음에 추가할 부분 --></td>
    <td width="80%" valign="top">	
    <br>
    <table border="0" cellspacing="1" width="100%" align="center">
      <tr>
        <td colspan="7" align="center" valign="center" height="20">
        <font size="4" face="돋움" color="blue">
        <img src="./img/bullet-01.gif"> <b>방 명 록</b></font></td></tr>
      <tr>
        <td colspan="5" align="right" valign="middle" height="20">
		<font size="2" face="고딕">전체 : <%=totcount %></b>건 - 1 Pages</font></td></tr>
 	   <tr bgcolor="e3e9ff">
 	      <td width="10%"align="center" height="20"><font face="돋움" size="2">번호</font></td>
 	      <td width="50%" align="center" height="20"><font face="돋움" size="2">제목</font></td>
 	      <td width="15%" align="center" height="20"><font face="돋움" size="2">글쓴이</font></td>
 	      <td width="15%" align="center" height="20"><font face="돋움" size="2">작성일</font></td>
 	      <td width="10%" align="center" height="20"><font face="돋움" size="2">조회수</font></td>
 	   </tr>
		<%
		
		
		if(totcount == 0){
			%>
			<tr onMouseOver="style.backgroundColor='#D1EEEE'" onMouseOut="style.backgroundColor=''">
	        <td align="center" height="25" colspan="5">
	        <font face="돋움" color="#000000">등록된 자료가 없습니다.</font></td>
	      </tr>
	
		<% }else{
			
			String sql1 = "select * from tbl_guest02 order by idx desc";
			
			pstmt = conn.prepareStatement(sql1);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
			int idx = rs.getInt("idx");
			String name = rs.getString("name");
			String subject = rs.getString("subject");
			String contents = rs.getString("contents");
			String regdate = rs.getString("regdate");
			String readcnt = rs.getString("readcnt");
			
		%>
				<tr onMouseOver="style.backgroundColor='#D1EEEE'" onMouseOut="style.backgroundColor=''">
	        <td align="center" height="25">
	        <font face="돋움" size="2" color="#000000"><%=idx %></font></td>
	        <td align="left" height="20">
	        <font face="돋움" size="2" color="#000000">
			       <a class="list" href="guest_view.jsp?idx=<%=idx%>"><%=subject %></a></td>
	        <td align="center" height="20"><font face="돋움" size="2">
	        <a class="list" href="guest_view.jsp?idx=<%=idx%>"><%=name %></a></font></td>
	        <td align="center" height="20"><font face="돋움" size="2"><%=regdate.substring(0,10) %></font></td>
	        <td align="center" height="20"><font face="돋움" size="2"><%=readcnt %></font></td>
	      </tr>
	      
	      <%
				}
	      	}
	      %>
     <!-- 검색 폼 추가  -->
     
     <div align="center">
        <table width="700" border="0" cellspacing="0" cellpadding="5">
          <tr>&nbsp;</tr><tr>
             <td colspan="5">        
                <div align="center">[1][2][3]</div>
			  </td>
			 </tr>
			<tr align=right><td colspan="5">
				<a href="guest_write.jsp"><img src="./img/write.gif" border="0"></a>
			</td>
			</tr>
		</table>
		</div>
	</body>
	</html>

