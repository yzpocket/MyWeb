<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="user" class="user.model.UserVO" scope="page"/>
<jsp:useBean id="userDao" class="user.model.UserDAO" scope="session"/>

<jsp:include page="/top.jsp"/>
<div class="container">
	<h1>회원 목록 페이지[Admin Page]</h1>
	
</div>
<jsp:include page="/foot.jsp"/>