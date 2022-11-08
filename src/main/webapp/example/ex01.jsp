<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*, java.text.*" %>
<!-- jsp 는 page directive (page지시어) 부터 나와야 한다. -->
<!-- 1. HTML 주석 c+/ -->
<h1>처음 해보는 JSP</h1>
<% //scriptlet 태그 : 이 안에서는 자바 코드를 기술한다.
	/* 자바 주석 */
	//자바 주석
	Date today=new Date();
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
	String str=sdf.format(today);
	//out: JspWriter타입
	out.println("<h2>"+str+"</h2>");
%>

<%-- JSP 주석 %-->
 
<%-- <%= %> : 출력식(expression) => out.println(변수)와 동일한것.
--%>
<h2 style="color:tomato"><%=str%></h2>