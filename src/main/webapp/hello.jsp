<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>Hello MyWeb</h1>
	<h2>안녕 MyWeb</h2>
	<hr color="red">
	<%
	//이안에서는 자바 코드를 자유자재로 작성해도 되요
		java.util.Date today=new java.util.Date();
		String str=today.toString();
		
		out.println("<h2 class='time'>"+str+"</h2>");
		//out: PrintWriter타입의 내장 객체. 브라우저와 노드 연결됨.
	%>


</body>
</html>