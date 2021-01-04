<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import="java.sql.*, java.util.*" %>
    
    <% 
		int idx = Integer.parseInt(request.getParameter("idx"));

    %>
    
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
	
	String sql = "select pass from tbl_guest02 where idx = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1, idx);
	rs = pstmt.executeQuery();
	rs.next();
	String pass = rs.getString("pass");
	%>
<!DOCTYPE html>
<html>
<head><title>방명록 삭제</title>
 <link rel="stylesheet" type="text/css" href="/stylesheet.css">
 <script>
 	function send_02(){

 		if(del.pass.value==""){
			alert("비밀번호를 입력하세요");
			del.pass.focus();
			return;
		}else if(del.pass.value!="<%=pass%>"){
			alert("비밀번호가 틀렸습니다.");
			del.pass.focus();
			return;
		}
 		del.action ="guest_delete_pro.jsp?idx=<%=idx%>";
 		del.submit();
 	}
 </script>
 
 </head>
 <body>
 <form name = "del" method="post" >
   <table border="0" cellpadding="0" cellspacing="0" width="300" align="center">
     <tr>
       <td height="50">
       <img src="./img/bullet-05.gif"><b><font size="3" color="red">잠깐 !!</font></b></td></tr>
     <tr>
       <td valign="middle" height="30">
       <font size="2" face="돋움">게시물은 작성하신 분만 삭제할 수 있습니다. <br>
       글작성시 입력한 비밀번호를 입력해 주세요...</font></td></tr>
     <tr>
       <td valign="middle" height="40">
       <font size="2" face="돋움">
       비밀번호 <input type="password" name="pass" size="8"></font>
       <input type="submit" value="삭제" onClick = "javascript:send_02()">
       <input type="button" value="닫기" onClick = "javascript:self.close()"></td></tr>
   </table>
   </form>
 </body>
 </html>