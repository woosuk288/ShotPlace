<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<h1 style="float: left;width: 150px;"><a href="/ShotPlace"><img src="/ShotPlace/resources/images/ci.gif" alt="java-school logo" /></a></h1>

<div id="memberMenu" style="float: right;position: relative;top: 7px;">
<c:choose>
	<c:when test="${empty check}">
		<input type="button" value="로그인" onclick="location.href='#'" />
		<input type="button" value="회원가입" onclick="location.href='/ShotPlace/users/signUp'" />
	</c:when>
	<c:otherwise>
		<input type="button" value="로그아웃" onclick="location.href='#'" />
		<input type="button" value="내정보수정" onclick="location.href='#'" />
	</c:otherwise>
</c:choose>
</div>