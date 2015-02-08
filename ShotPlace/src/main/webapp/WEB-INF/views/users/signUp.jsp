<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="Keywords" content="회원가입" />
<meta name="Description" content="회원가입" />
<link rel="stylesheet" href="../resources/css/screen.css" type="text/css" media="screen" />
<title>회원가입</title>
<script type="text/javascript">
//<![CDATA[ 
	function check() {
		var form = document.getElementById("signUpForm");
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
<h1>회원가입</h1>
<form id="signUpForm" action="signUp" method="post" onsubmit="return check()">
<table>
<tr>
	<td style="width: 200px;">이름(Full Name)</td>
	<td style="width: 390px"><input type="text" name="name" style="width: 99%;" /></td>
</tr>
<tr>
	<td>비밀번호(Password)</td>
	<td><input type="password" name="passwd" style="width: 99%;" /></td>
</tr>
<tr>
	<td colspan="2" style="text-align: center;font-weight: bold;">
	Email이 아이디로 사용됩니다. 따라서 비밀번호는 Email 계정 비밀번호와 같게 하지 마세요.
	</td>
</tr>
<tr>
	<td>비밀번호 확인(Confirm)</td>
	<td><input type="password" name="confirm" style="width: 99%;" /></td>
</tr>
<tr>
	<td>Email</td>
	<td><input type="text" name="email" style="width: 99%;" /></td>
</tr>
<tr>
	<td>손전화(Mobile)</td>
	<td><input type="text" name="mobile" style="width: 99%;" /></td>
</tr>
</table>
<div style="text-align: center;padding-bottom: 15px;">
	<input type="submit" value="확인" />
</div>
</form>
<!--  본문 끝 -->

		</div><!-- content 끝 -->
	</div><!--  container 끝 -->
	
	<div id="sidebar">
		<%@ include file="notLoginUsers-menu.jsp" %>
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