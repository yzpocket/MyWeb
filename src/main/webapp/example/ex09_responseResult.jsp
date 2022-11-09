<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- ex09_responseResult.jsp -->
<a href="ex09_response.jsp">로그인 폼으로 돌아가기</a>
<%
	//폼으로부터 req 아이디, 비번 받기
	String userid=request.getParameter("userid");
	String pwd=request.getParameter("pwd");
	out.println(userid+"/"+pwd+"<br>");
	//유효성 체크 널값
	if(userid==null||pwd==null){
		response.sendRedirect("ex09_response.jsp");
		//브라우저의 url을 ex09_response.jsp로 바꾸어서 새롭게 요청을 보내는 방식으로 이동한다
		return;
	}
	//유효성체크 빈문자열
	if("".equals(userid.trim())||pwd.trim().isEmpty()){
		response.sendError(HttpServletResponse.SC_BAD_REQUEST);
		//SC_BAD_REQUEST 에러 메세지 출력. 400에러
		return;
	}
	if(userid.equalsIgnoreCase("killer")){
		response.sendError(response.SC_FORBIDDEN);
		//접근금지에러 403에러
		return;
	}
%>
<h1 style='color:blue'><%=userid %>님 환영합니다.</h1>