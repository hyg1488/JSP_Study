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
	// DB 연동 테스트
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try{
		Class.forName(myDriver);
		conn = DriverManager.getConnection(myUrl, myId, myPass);
		
	}catch(Exception e){
		
	}
	
	int idx = Integer.parseInt(request.getParameter("idx"));
	
	String sql = "update tbl_guest02 set readcnt = readcnt +1 where idx=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1, idx);
	pstmt.executeUpdate();
	
	sql = "select * from tbl_guest02 where idx = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1, idx);
	rs = pstmt.executeQuery();
	
	rs.next();
	String name = rs.getString("name");
	String subject = rs.getString("subject");
	String contents = rs.getString("contents").replace("\n", "<br>");
	String regdate = rs.getString("regdate");
	String readcnt = rs.getString("readcnt");
	String moddate = rs.getString("moddate");
%>
 <html>
 <head><meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
   <title>방명록 내용 보기</title>
   <link rel="stylesheet" type="text/css" href="/stylesheet.css">
   <style type="text/css">
     td.title { padding:4px; background-color:#e3e9ff }
     td.content { padding:10px; line-height:1.6em; text-align:justify; }
     a.list { text-decoration:none;color:black;font-size:10pt; }
   </style>
 <script language="javascript">
 function guest_del(){
	 window.open("guest_delete.jsp?idx=<%=idx%>", "게시판삭제" ,"width=300, height=170");
 }
 <!--
 function del_list() {
   var urlString;
    urlString = "guest_delete.jsp" ;
    window.open(urlString, "del_list"," resizable=no,x=150,y=150,width=300,height=170");
 }
 //-->
 </script>
 </head>
 <body topmargin="0" leftmargin="0">
   <table border="0" width="800">
     <tr>
       <td width="20%"  height="500" bgcolor="#ecf1ef" valign="top">

		 <!--  다음에 추가할 부분 -->

	   </td>
       <td width="80%" valign="top">&nbsp;<br>
         <table border="0" width="90%" align="center">
           <tr>
             <td colspan="2"><img src="./img/bullet-01.gif"> 
              <font color="blue" size="3">방 명 록</font><font size="2"> - 글읽기</font></td>
           </tr>
         </table>
       <p>
       <table border="0" width="90%" align="center" cellspacing="0"  style="border-width:1px;border-color:#0066cc;border-style:outset;">
         <tr bgcolor="e3e9ff">
           <td class="title">
             <img src="./img/bullet-04.gif"> <font size="2" face="돋움">
                  홈페이지 제작</font>
           </td>
         </tr>
         <tr>
           <td class="content">
             <p align="right"><font size="2" face="돋움">
              <%=name %>  / <font size="2" face="돋움">작성일자 : <%=regdate.substring(0,10) %> / 
              	최근수정일자 :<%if(moddate == null){%> 없음 <%}else{ %><%=moddate.substring(0,10) %><%} %> 
                /<%= readcnt %>번 읽음</font>
             <p>
             <%=contents %><p>
           </td>
         </tr>
       </table>

      <!--**** 여기서부터 게시물 내용 아래쪽의 버튼들이 나옵니다. 답변, 수정, 삭제, 목록보기 ****-->
      <p align="center">
      <font size="2">
       <!-- 목록보기 -->
       <a href="guest_list.jsp"><img src="./img/list-2.gif" border="0"></a>&nbsp;&nbsp;&nbsp;&nbsp;
        <!--  수정 -> 수정하고 -> list 로  -->
        <a href="guest_modify.jsp?idx=<%=idx%>"><img src="./img/edit.gif" border="0"></a>&nbsp;&nbsp;&nbsp;&nbsp;
       <!--  삭제 -->
		<a href="javascript:guest_del()"><img src="./img/del.gif" border="0"></a>&nbsp;&nbsp;&nbsp;&nbsp;
       
      </font>
    </td>
  </tr>
  </table>
  </body>
  </html>
