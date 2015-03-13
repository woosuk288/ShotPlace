<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="Keywords" content="게시판 새글쓰기" />
<meta name="Description" content="게시판 새글쓰기" />
<link rel="stylesheet" href="resources/css/screen.css" type="text/css" media="screen" />
<title>${boardNm }</title>
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

<h1>${boardNm }</h1>
<div id="bbs">
<h2>글쓰기</h2>
<form id="writeForm" action="write" method="post" onsubmit="return check()">
<p style="margin: 0;padding: 0;">
<input type="hidden" name="boardCd" value="${param.boardCd }" />
</p>
<table id="write-form">
<tr>
	<td>제목</td>
	<td><input type="text" name="title" size="50" /></td>
</tr>
<tr>
	<td colspan="2">
		<textarea name="content" rows="17"></textarea>
	</td>
</tr>
</table>
<div style="text-align: center;padding-bottom: 15px;">
	<input type="submit" value="전송" />
	<c:if test="${!empty param.articleNo }">
	<input type="button" value="상세보기" onclick="goView()" />
	</c:if>
	<input type="button" value="목록" onclick="goList()" />
</div>
</form>
</div><!-- bbs 끝 -->
<!--  본문 끝 -->

		</div><!-- content 끝 -->
	</div><!--  container 끝 -->
	
	<div id="sidebar">
		
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