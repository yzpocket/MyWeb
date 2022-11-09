<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  isErrorPage="true" %>
<%-- myerror.jsp페이지에서는 ****반드시 isErrorPage속성값을 true로 주어야 한다.**** --%>
<%
	//IE의 경우 브라우저가 자체적으로 에러처리 페이지를 출력해서 처리하려고한다. 그래서
	//에러가 발생한 것이 아니게끔 인식하도록 아래 코드를 기술하자.
	response.setStatus(200); //200 OK 은 응답 성공.
%>
<div class="container err">
	<h1> Server Error: <%=exception.getMessage() --%></h1>
	<%
		exception.printStackTrace(); //디버깅용 => 톰캣 콘솔에 출력함.
	%>
	<a href="history.back()">이전 페이지로 돌아감.(이건 단순 링크로 잘못보게 된다.)</a><br>
	<a href="javascript:history.back()">이전 페이지로 돌아감.(javascript:~로 붙여줘야 한다.)</a><br>
	<!--  href에 자바스크립트 코드를 기술하려면 "javascript:" 프로토콜을 붙여야 한다.  -->
	<button onclick="history.back()">이전 페이지로 돌아감(버튼은 온클릭으로 바로된다.)</button>
</div>