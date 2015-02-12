<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="Keywords" content="비밀번호 변경" />
<meta name="Description" content="비빌번호 변경" />
<link rel="stylesheet" href="../resources/css/screen.css" type="text/css" media="screen" />
<title>비밀번호 변경</title>
<script type="text/javascript">
//<![CDATA[ 
	function check() {
		var form = document.getElementById("changePasswordForm");
		if (form.passwd.value == form.confirm.value) {
			return true;	
		} else {
			alert("[변경 비밀번호]와 [변경 비밀번호 확인]값이 같지 않습니다.");
			return false;
		}
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
<h1>비밀번호 변경</h1>
${check.name}님은 로그인 상태입니다.<br />
이메일 ${check.email}<br />
손전화 ${check.mobile}<br />
<form id="changePasswordForm" action="changePasswd" method="post" onsubmit="return check()">
<table>
<tr>
	<td>변경 비밀번호</td>
	<td><input type="password" name="passwd" /></td>	
</tr>
<tr>
	<td>변경 비밀번호 확인</td>
	<td><input type="password" name="confirm" /></td>	
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