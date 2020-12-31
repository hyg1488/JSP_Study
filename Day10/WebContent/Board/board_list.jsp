<%@page import="com.sun.corba.se.spi.orbutil.fsm.Guard.Result"%>
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
		String query1 = "select count(*) from tbl_board";
		String query2 = "select count(*) from tbl_board where "+search+" like '% "+key+"%'";
		
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
<head><title>게시판 읽기</title>
<link rel="stylesheet" type="text/css" href="/stylesheet.css">
<style type="text/css">
  a.list {text-decoration:none;color:black;font-size:10pt;}
</style>

<script>
	function send(){
		alert("전송");
		b_search.submit();
	}
</script>

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
        <img src="./img/bullet-01.gif"> <b>자 유 게 시 판</b></font></td></tr>
      <tr>
        <td colspan="5" align="right" valign="middle" height="20">
		<font size="2" face="고딕">전체 : <b><%=totcount %></b>건 - 1/ 2 Pages</font></td></tr>
 	   <tr bgcolor="e3e9ff">
 	      <td width="10%" align="center" height="20"><font face="돋움" size="2">번 호</font></td>
 	      <td width="50%" align="center" height="20"><font face="돋움" size="2">제 목</font></td>
 	      <td width="15%" align="center" height="20"><font face="돋움" size="2">글쓴이</font></td>
 	      <td width="15%" align="center" height="20"><font face="돋움" size="2">작성일</font></td>
 	      <td width="10%" align="center" height="20"><font face="돋움" size="2">조회수</font></td>
 	   </tr>
		
		<%
			if(totcount == 0){
		%>

			<tr onMouseOver="style.backgroundColor='#D1EEEE'" onMouseOut="style.backgroundColor=''">
				<td align="center" height="25" colspan="5">
				<font face="돋움" size="2" color="#000000">등록된 자료가 없습니다.</font></td>
			<tr>
			
		<%
			}else{
				String query1 = "select * from tbl_board order by idx desc";
				String query2 = "select * from tbl_board where "+search+" like '% "+key+"%' order by idx desc";
				
				if(key.equals("")){
					pstmt = conn.prepareStatement(query1);
				}else{
					pstmt = conn.prepareStatement(query2);
				}
				

				rs = pstmt.executeQuery();
				while(rs.next()){
					int idx = rs.getInt("idx");
					String name = rs.getString("name");
					String subject = rs.getString("subject");
					String contents = rs.getString("contents").replace("\n", "<br>");
					String regdate = rs.getString("regdate");
					int readcnt = rs.getInt("readcnt");
					
		%>
		<tr onMouseOver="style.backgroundColor='#D1EEEE'" onMouseOut="style.backgroundColor=''">
			<td align="center" height="25">
			<font face="돋움" size="2" color="#000000"><%= idx%></td>
			<td align="left" height="20">&nbsp;
				<font face="돋움" size="2" color="#000000">
				<a class="list" href="board_view.jsp?idx=<%=idx%>"><%= subject%></a></td>
					<td align="center" height="20"><font face="돋움" size="2">
					<a class="list" href="mailto:ein1027@nate.com"><%= name %></a></font></td>
				<td align="center" height="20"><font face="돋움" size="2"><%= regdate.substring(0,10)%></font></td>
				<td align="center" height="20"><font face="돋움" size="2"><%= readcnt %>
				</font></td>
		</tr>
		<%
				}
			}
		%>
<!-- 		<tr onMouseOver="style.backgroundColor='#D1EEEE'" onMouseOut="style.backgroundColor=''">
			<td align="center" height="25">
			<font face="돋움" size="2" color="#000000">5</font></td>
			<td align="left" height="20">&nbsp;
				<font face="돋움" size="2" color="#000000">
				<a class="list" href="">제목부분입니다</a></td>
					<td align="center" height="20"><font face="돋움" size="2">
					<a class="list" href="mailto:ein1027@nate.com">나종민</a></font></td>
				<td align="center" height="20"><font face="돋움" size="2">2007-10-22</font></td>
				<td align="center" height="20"><font face="돋움" size="2">
				3</font></td>
		</tr>
 -->

	 <div align="center">
        <table width="700" border="0" cellspacing="0" cellpadding="5">
          <tr>&nbsp;</tr><tr>
             <td colspan="5">        
                <div align="center">[1][2][3]</div>
			  </td>
			 </tr>
		</table>

	<table width="600">
		<tr>
			<td width="25%"> &nbsp;</td>
			<td width="50%" align="center">
				<table>
					<form name="b_search" method="post" action="board_list.jsp">	
					<!-- 검색어를 이용하여 글제목, 작성자, 글내용 중에 하나를 입력 받아 처리하기 위한 부분 -->
						<tr>
							<td>
								<select name="search">
									<option value="subject" <% if(search.equals("subject")){ %> selected <%} %> >글제목</option>
									<option value="name" <% if(search.equals("name")){ %> selected <%} %> >작성자</option>
									<option value="contents" <% if(search.equals("contents")){ %> selected <%} %> >글내용</option>
								</select>
							</td>
							<td> <input type="text" size=20 name="key" value="<%=key%>"></td>
							<td> <a href="javascript:send()"><img src="./img/search2.gif" border="0"></a></td>
						</tr>
					</form>
				</table>
			</td>
			<td width="25%" align="right">
			<a href="board_write.jsp"><img src="./img/write.gif" border="0"></a>
			</td>
		</tr>
	</table>
</body>
</html>

