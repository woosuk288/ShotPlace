<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="Keywords" content="내정보수정" />
<meta name="Description" content="내정보수정" />
<link rel="stylesheet" href="../resources/css/screen.css" type="text/css" media="screen" />
<title>내정보수정</title>
<script type="text/javascript">
//<![CDATA[ 
	function check() {
		var form = document.getElementById("editAccountForm");
		//TODO 유효성 검사
		return true;
	} 
//]]> 
</script>           
</head>
<body>

<div id="wrap">

	<div id="header">
		<%@ include file="../inc/header.jsp" %>
	</div>

	<div id="main-menu">
		<%@ include file="../inc/main-menu.jsp" %>
	</div>

	<div id="container">
		<div id="content" style="min-height: 800px;">
			<div id="url-navi">회원</div>

<!-- 본문 시작 -->
<h1>내정보수정</h1>
<p>
이름과 손전화만 변경할 수 있습니다.<br />
비밀번호는 <a href="changePasswd">비밀번호 변경</a>을 이용하세요.<br />
</p>
<form id="editAccountForm" action="editAccount" method="post" onsubmit="return check()">
<table>
<tr>
	<td>이름(Full Name)</td>
	<td><input type="text" name="name" value="${check.name }" /></td>
</tr>
<tr>
	<td>손전화</td>
	<td><input type="text" name="mobile" value="${check.mobile }" /></td>
</tr>
<tr>
	<td>현재 비밀번호(Password)</td>
	<td><input type="password" name="passwd" /></td>
</tr>
<tr>
	<td colspan="2"><input type="submit" value="확인" /></td>
</tr>
</table>
</form>
<!--  본문 끝 -->

		</div><!-- content 끝 -->
	</div><!--  container 끝 -->
	
	<div id="sidebar">
		<%@ include file="loginUsers-menu.jsp" %>
	</div>
	
	<div id="extra">
		<%@ include file="../inc/extra.jsp" %>
	</div>

	<div id="footer">
		<%@ include file="../inc/footer.jsp" %>
	</div>

</div>

</body>
</html>