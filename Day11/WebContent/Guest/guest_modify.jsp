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
	
	sql = "select * from tbl_guest02 where idx=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1,idx);
	rs = pstmt.executeQuery();
	
	rs.next();
	String name = rs.getString("name");
	String pass = rs.getString("pass");
	String subject = rs.getString("subject");
	String contents = rs.getString("contents");
	String regdate = rs.getString("regdate");
	String readcnt = rs.getString("readcnt");
	String moddate = rs.getString("moddate");
%>
 <html>
   <head><title>방명록 수정</title>
    <link rel="stylesheet" type="text/css" href="/stylesheet.css">
    
    <script>
    	function in_check(){
    		if(input.pass.value==""){
    			alert("비밀번호를 입력하세요");
    			input.pass.focus();
    			return;
    		}else if(input.pass.value!="<%=pass%>"){
    			alert("비밀번호가 틀렸습니다.");
    			input.pass.focus();
    			return;
    		}
    		
    		input.submit();
    	}
    </script>

</head>

 <body topmargin="0" leftmargin="0">
 <table border="0" width="800">
 <tr>
   <td width="20%" height="500" bgcolor="#ecf1ef" valign="top">

   <!-- 다음에 추가할 부분 "-->

   </td>
   <td width="80%" valign="top">&nbsp;<br>
     <img src="./img/bullet-01.gif"><font size="3" face="돋움" color="blue"> <b>방 명 록</b></font>
     <font size="2"> - 수정하기</font><p>
     <img src="./img/bullet-03.gif"><font size="2" face="돋움" color="orange"> 잠깐</font> &nbsp;
     <img src="./img/bullet-02.gif"><font size="2" face="돋움">는 필수 입력 사항입니다.</font><p>
     
		 <form method="post" action="guest_modify_pro.jsp?idx=<%=idx %>" name="input">
			<input type="hidden" name="idx" value="">
     

      <table border="0">
       <tr>
         <td width="5%" align="right"><img src="./img/bullet-02.gif"></td>
         <td width="15%"><font size="2 face="돋움"">글쓴이</font></td>
         <td width="80%">
         <input type="text" size="20" name="name" value="<%=name %>" readonly></td>
       </tr>
       <tr>
         <td width="5%" align="right"><img src="./img/bullet-02.gif"></td>
         <td width="15%"><font size="2 face="돋움"">비밀번호</font></td>
         <td width="80%">
         <input type="password" size="20" name="pass"></td>
       </tr>
       
       <tr>
         <td align="right"><img src="./img/bullet-02.gif"></td>
         <td><font size="2" face="돋움">제목</font></td>
         <td><input type="text" size="60" name="subject" value="<%=subject%>"></td>
       </tr>
       <tr>
         <td align="right"><img src="./img/bullet-02.gif"></td>
         <td><font size="2" face="돋움">내용</font></td>
         <td><textarea wrap="physical" rows="10" name="contents" cols="60" ><%=contents %></textarea></td>
       </tr>
        <tr>
          <td align="right">&nbsp;</td>
          <td><font size="2">&nbsp;</font></td>
          <td><input type="button" value="수정하기" onClick="in_check()">&nbsp;
          <input type="button" value="돌아가기" onClick="history.back();"></td></tr>
      </table>
      </form>
    </td></tr>
  </table>
  </body>
  </html>
   