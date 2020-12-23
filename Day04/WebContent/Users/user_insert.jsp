<%@ page contentType="text/html; charset=UTF-8"%>

<html>
<head>


<title>회원등록</title>
<STYLE TYPE="text/css">
<!--
body {
	font-family: 돋움, Verdana;
	font-size: 9pt
}

td {
	font-family: 돋움, Verdana;
	font-size: 9pt;
	text-decoration: none;
	color: #000000;
	BACKGROUND-POSITION: left top;
	BACKGROUND-REPEAT: no-repeat;
}

-->
.formbox {
	BACKGROUND-COLOR: #F0F0F0;
	FONT-FAMILY: "Verdana", "Arial", "Helvetica", "돋움";
	FONT-SIZE: 9pt
}
-
-->
</STYLE>

<script type="text/javascript">
	function idcheck() {
		var url = "user_idcheck.jsp?userid=" + join.userid.value;
		if (join.userid.value == "") {
			alert("아이디 입력");
			join.userid.focus();
			return;
		}
		//	window.open("url", "창 제목", "크기"); // 판업창 띄우는 메서드
		window.open(url, "아이디확인", "width=300");

	}

	function send() {

		if (join.name.value == "") {
			alert("이름 입력");
			join.name.focus();
			return;
		} else if (join.userid.value == "") {
			alert("아이디 입력");
			join.userid.focus();
			return;
		} else if (join.passwd.value == "") {
			alert("비밀번호 입력");
			join.passwd.focus();
			return;
		} else if (join.repasswd.value == "") {
			alert("비밀번호 확인 입력");
			join.repasswd.focus();
			return;
		} else if (!(join.gender.value == "M" || join.gender.value == "F")) {
			alert("성별 선택");
			join.gender.focus();
			return;
		} else if (join.tel.value == "") {
			alert("전화 번호 입력");
			join.tel.focus();
			return;
		} else if (join.email1.value == "") {
			alert("이메일 입력");
			join.email1.focus();
			return;
		} else if (join.email2.value == "") {
			alert("이메일 입력");
			join.email2.focus();
			return;
		}
	
		if(join.passwd.value != join.repasswd.value){
			alert("비밀번호를 다시 확인해주세요.");
			join.passwd.focus();
			return;
		}
		
		alert("전송입니다.");
		join.action = "/user_s";
		join.submit();
	}

	function aa() {
		if (join.email3.selectedIndex == 0) {
			join.email3.reaOnly = false;
		} else {
			join.email3.reaOnly = true;
		}
	}

	function email_change() {

		if (document.join.email3.options[document.join.email3.selectedIndex].value == '0') {

			document.join.email2.disabled = true;

			document.join.email2.value = "";

		}

		if (document.join.email3.options[document.join.email3.selectedIndex].value == '9') {

			document.join.email2.disabled = false;

			document.join.email2.value = "";

			document.join.email2.focus();

		} else {

			document.join.email2.disabled = true;

			document.join.email2.value = document.join.email3.options[document.join.email3.selectedIndex].value;

		}
	}
</script>

</head>

<body bgcolor="#FFFFFF" LEFTMARGIN=0 TOPMARGIN=0>

	<!-- 탑 메뉴 영역 삽입-->


	<table border="0" width="800">
		<tr>
			<td width="20%" bgcolor="#ecf1ef" valign="top"
				style="padding-left: 0;">
				<!--로그인 영역 삽입-->

			</td>
			<td width="80%" valign="top">&nbsp;<img src="./img/title1.gif"><br>
				<form name=join method=post>
					<table border=0 cellpadding=0 cellspacing=0 border=0 width=730
						valign=top>
						<tr>
							<td align=center><br>
								<table cellpadding=0 cellspacing=0 border=0 width=650
									align=center>
									<tr>
										<td bgcolor="#7AAAD5">
											<table cellpadding=0 cellspacing=0 border=0 width=100%>
												<tr bgcolor=#7AAAD5>
													<td align=left BORDER="0" HSPACE="0" VSPACE="0"><img
														src="./img/u_b02.gif"></td>
													<td align=center bgcolor="#7AAAD5"><FONT
														COLOR="#FFFFFF"><b>사용자등록&nbsp;</b><font color=black>(</font><font
															color=red>&nbsp;*&nbsp;</font><font color=black>표시항목은
																반드시 입력하십시요.)</font></FONT></td>
													<td align=right BORDER="0" HSPACE="0" VSPACE="0"><img
														src="./img/u_b03.gif"></td>
												</tr>
											</table>
											<table cellpadding=3 cellspacing=1 border=0 width=100%>
												<tr>
													<td width=110 bgcolor=#EFF4F8>&nbsp;회원 성명<font
														color=red>&nbsp;*</font></td>
													<TD BGCOLOR=WHITE><input type=text name=name size=16
														maxlength=20 value="">성명은 빈칸없이 입력하세요.</td>
												</tr>
												<tr>
													<TD BGCOLOR="#EFF4F8">&nbsp;회원 ID<font color=red>&nbsp;*</font></td>
													<TD BGCOLOR=WHITE>
														<table cellspacing=0 cellpadding=0>
															<tr>
																<td align=absmiddle><input type=text name=userid
																	size=12 maxlength=16 value="" style="width: 120">
																</td>
																<td><a href="javascript:idcheck();"><img
																		src="./img/u_bt01.gif" hspace=2 border=0 name=img1
																		align=absmiddle></a> 5~16자 이내의 영문이나 숫자만 가능합니다.</td>
															</tr>
														</table>
													</td>
												</tr>
												<tr>
													<TD BGCOLOR="#EFF4F8">&nbsp;비밀번호<font color=red>&nbsp;*</font></td>
													<TD BGCOLOR=WHITE><input type=password name=passwd
														size=8 maxlength=12 style="width: 80"> 6~12자 이내의
														영문이나 숫자만 가능합니다.</td>
												</tr>
												<tr>
													<TD BGCOLOR="#EFF4F8">&nbsp;비밀번호확인<font color=red>&nbsp;*</font></td>
													<TD BGCOLOR=WHITE><input type=password name=repasswd
														size=8 maxlength=12 value="" style="width: 80">비밀번호
														확인을 위해서 비밀번호를 한번 더 입력해주세요.</td>
												</tr>
												<tr>
													<TD BGCOLOR="#EFF4F8">&nbsp;성별<font color=red>&nbsp;*</font></td>
													<TD BGCOLOR=WHITE><input type=radio name=gender
														size=13 maxlength=13 value="M">남자 <input
														type=radio name=gender size=13 maxlength=13 value="F">여자

													</td>
												</tr>
												<tr>
													<TD BGCOLOR="#EFF4F8">&nbsp;전화번호<font color=red>&nbsp;*</font></td>
													<TD BGCOLOR=WHITE><input type=text name=tel size=13
														maxlength=13 value=""></td>
												</tr>
												<tr>
													<TD BGCOLOR="#EFF4F8">&nbsp;E-mail <font color=red>&nbsp;</font>
													</td>
													<td bgcolor=WHITE valign=middle><input type="text"
														name="email1" maxlength="15"> @ <input type="text"
														name="email2" maxlength="15" value="" disabled> <select
														name="email3" onchange="email_change()">
															<option value="0">선택하세요</option>
															<option value="9">직접입력</option>
															<option value="naver.com">naver.com</option>
															<option value="daum.net">daum.net</option>
															<option value="nate.com">nate.com</option>
															<option value="gmail.com">gmail.com</option>
													</select> <input type="button" value="인증하기"></td>
												</tr>
											</table>
											<table cellpadding=0 cellspacing=0 border=0 width=100%>
												<tr bgcolor=#7AAAD5>
													<td valign=bottom><img src="./img/u_b04.gif"
														align=left hspace=0 vspace=0 border=0></td>
													<td align=center></td>
													<td valign=bottom><img src="./img/u_b05.gif"
														align=right hspace=0 vspace=0 border=0></td>
												</tr>
												<tr bgcolor=#ffffff>
													<td colspan=3 align=center><a
														href="javascript:send();"><img src="./img/u_bt06.gif"
															vspace=3 border=0 name=img3></a> <img
														src="./img/u_bt05.gif" border=0 hspace=10 vspace=3
														name=img4></td>
												</tr>
											</table>
										</td>
									</tr>
									</td>
									</tr>
								</table>
								</form></td>
						</tr>
					</table>

					<!-- copyright 영역 삽입-->
</body>
</html>
