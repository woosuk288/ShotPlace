<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="Keywords" content="게시판 상세보기" />
<meta name="Description" content="게시판 상세보기" />
<link rel="stylesheet" href="../resources/css/screen.css" type="text/css" media="screen" />
<title>${boardNm }</title>
<script type="text/javascript">
//<![CDATA[

	function goWrite() {
		var form = document.getElementById("writeForm");
		form.submit();
	}
	
	function goView(articleNo) {
		var form = document.getElementById("viewForm");
		form.articleNo.value = articleNo;
		form.submit();
		
	}
	function goModify(){
		var form = document.getElementById("modifyForm");
		form.submit();
		
	}
	function goDelete(){
		var form = document.getElementById("deleteForm");
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
<h1>${boardNm }</h1>
<div id="bbs">
	<table>
	<tr>
		<th style="width: 50px;">TITLE</th>
		<th style="text-align: left;color: #555;">${thisArticle.title }</th>
		<th style="width: 50px;">DATE</th>
		<th style="width: 130px;color: #555;">${thisArticle.writeDateTime }</th>
	</tr>	
	</table>
	
	<div id="gul-content">
		<h6>작성자 ${thisArticle.email }, 조회수 ${thisArticle.hit }</h6>
		<p>${thisArticle.htmlContent }</p>

	</div>
	
	<div id="next-prev">
		<c:if test="${nextArticle != null }">
			<p>다음글 : <a href="javascript:goView('${nextArticle.articleNo }')">${nextArticle.title }</a></p>
		</c:if>
		<c:if test="${prevArticle != null }">
			<p>이전글 : <a href="javascript:goView('${prevArticle.articleNo }')">${prevArticle.title }</a></p>
		</c:if>
	</div>
	
	<div id="view-menu">
		<div class="fl">
			<input type="button" value="수정" onclick="goModify()" />
			<input type="button" value="삭제" onclick="goDelete()" />
		</div>
		<div class="fr">			
			<input type="button" value="목록" onclick="goList()" />
			<input type="button" value="새글쓰기" onclick="goWrite()" />
		</div>		
	</div>
		
	<table>
	<tr>
		<th style="width: 60px;">NO</th>
		<th>TITLE</th>
		<th style="width: 84px;">DATE</th>
		<th style="width: 60px;">HIT</th>
	</tr>
	<!--  반복 구간 시작 -->
	<c:forEach var="article" items="${list }" varStatus="status">	
	<tr>
		<td style="text-align: center;">${article.articleNo }</td>
		<td>
			<a href="javascript:goView('${article.articleNo }')">${article.title }</a>
		</td>
		<td style="text-align: center;">${article.writeDate }</td>
		<td style="text-align: center;">${article.hit }</td>
	</tr>
	</c:forEach>
	<!--  반복 구간 끝 -->
	</table>
	<div id="list-menu" style="text-align:  right;">
		<input type="button" value="새글쓰기" onclick="goWrite()" />
	</div>
</div>
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

	<form id="writeForm" action="./write" method="get">
	<p>
		<input type="hidden" name="boardCd" value="${boardCd }" />
	</p>
	</form>
	<form id="viewForm" action="./view" method="get">
	<p>
		<input type="hidden" name="articleNo" />
		<input type="hidden" name="boardCd" value="${boardCd }" />
	</p>
	</form>
	<form id="modifyForm" action="./modify" method="get">
	<p>
		<input type="hidden" name="articleNo" value="${thisArticle.articleNo }"/>
		<input type="hidden" name="boardCd" value="${boardCd }" />
	</p>
	</form>
	<form id="deleteForm" action="./delete" method="post">
	<p>
		<input type="hidden" name="articleNo" value="${thisArticle.articleNo }"/> />
		<input type="hidden" name="boardCd" value="${boardCd }" />
	</p>
	</form>	
</div>

</body>
</html>