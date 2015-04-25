<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="Keywords" content="게시판 수정하기 폼" />
<meta name="Description" content="게시판 수정하기 폼" />
<link rel="stylesheet" href="../resources/css/screen.css" type="text/css" media="screen" />
<title>${boardNm }</title>
<script type="text/javascript">
//<![CDATA[
	function check() {
		var form = document.getElementById("modifyForm");
		//TODO 유효성 검사
		return true;
	}
	
	function goList() {
		var form = document.getElementById("listForm");
		form.submit();
	}
	
	function goView() {
		var form = document.getElementById("viewForm");
		form.submit();
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
			<div id="url-navi">BBS</div>
			
<!-- 본문 시작 -->
<h1>${boardNm }${param }</h1>
<div id="bbs">
<h2>수정</h2>
<form id="modifyForm" action="modify" method="post" enctype="multipart/form-data" onsubmit="return check()">
<p style="margin: 0;padding: 0;">
	<input type="hidden"  name="articleNo" value="${param.articleNo }" />
	<input type="hidden"  name="boardCd" value="${param.boardCd }" />
	<input type="hidden" name="curPage" value="${param.curPage }" />
	<input type="hidden" name="searchWord" value="${param.searchWord }" />
</p>
<table id="write-form">
<tr>
	<td>제목</td>
	<td><input type="text" name="title" size="50" value="${thisArticle.title }" /></td>
</tr>
<tr>
	<td colspan="2">
		<textarea name="content" rows="17">${thisArticle.content }</textarea>
	</td>
</tr>
<tr>
	<td>파일첨부</td>
	<td><input type="file" name="upload" multiple/></td>
</tr>

</table>
<div style="text-align: center;padding-bottom: 15px;">
	<input type="submit" value="전송" />
	<input type="button" value="상세보기" onclick="goView()" />
	<input type="button" value="목록" onclick="goList()" />
</div>
</form>
	
</div><!-- bbs 끝 -->
<!--  본문 끝 -->
		</div><!-- content 끝 -->
	</div><!--  container 끝 -->
	
	<div id="sidebar">
		<%@ include file="bbs-menu.jsp" %>
	</div>
	
	<div id="extra">
		<%@ include file="../inc/extra.jsp" %>
	</div>

	<div id="footer">
		<%@ include file="../inc/footer.jsp" %>
	</div>

</div>

<div id="form-group" style="display: none;">
	<form id="listForm" action="list" method="get">
		<p>
		<input type="hidden" name="boardCd" value="${param.boardCd }" />
		<input type="hidden" name="curPage" value="${param.curPage }" />
		<input type="hidden" name="searchWord" value="${param.searchWord }" />
		</p>
	</form>
	<form id="viewForm" action="view" method="get">
		<p>
		<input type="hidden" name="articleNo" value="${param.articleNo }"/>
		<input type="hidden" name="boardCd" value="${param.boardCd }" />
		<input type="hidden" name="curPage" value="${param.curPage }" />
		<input type="hidden" name="searchWord" value="${param.searchWord }" />
		</p>
	</form>
</div>

</body>
</html>