<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%> <!-- <<--에러 전용 페이지로 쓸 곳이라 true로 바꿔야함 -->
<%
	response.setStatus(200); //브라우저 자체 에러해결 막기.
%>
<script>
	alert('<%=exception.getMessage()%>');
	history.back();
</script>