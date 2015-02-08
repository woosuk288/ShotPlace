<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="Keywords" content="메인페이지" />
<meta name="Description" content="메인페이지" />
<link rel="stylesheet" href="resources/css/screen.css" type="text/css" media="screen" />
<title>Insert title here</title>
</head>
<body>

<div id="wrap">

	<div id="header">
		<%@ include file="./inc/header.jsp" %>
	</div>
		
	<div id="main-menu">
		<%@ include file="./inc/main-menu.jsp" %>
	</div>

	<div id="container">

		<div id="content">

			<div id="url-navi">url-navi &gt; 소개</div>
			
			
<!--본문시작  -->			
<h1>여기가 메인이다!!</h1>
<!--본문끝  -->			

		</div><!-- content 끝 -->

	</div><!--  container 끝 -->
	
	<div id="sidebar">
		<h1>Main</h1>
	</div>
	
	<div id="extra">
		<%@ include file="./inc/extra.jsp" %>
	</div>

	<div id="footer">
		<%@ include file="./inc/footer.jsp" %>
	</div>

</div>

</body>
</html>