<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%--
[1] scriptlet   : <%  %>   => 여기서 선언된 변수는 지역변수
[2] declaration : <%! %>   => 여기서 선언된 변수는 멤버변수
[3] expression  : <%= %>
 --%>
 
<%!
int i;
String str="Hello JSP";
%> 
<%-- [1] for루프 이용해서 Hello JSP 5번 출력하기 --%>
<%
for(i=0;i<5;i++){
%>
	<h2><%=str%></h2>
<%}%>

<%-- [2] while루프 이용해서 구구단8단 출력하기 --%>
<% int dan=8;
	int i=1;
	while(i<10){
	%>
	<h3><%=dan%> x <%=i%> =<%= dan*i %> </h3>
	<%
		i++;
	}
	%>


<hr color='red'>
<%-- [3] 구구단 전체를 테이블 형태 출력하기 --%>
<!-- 먼저 테이블 태그를 짜고 이후에 로직을 짜는게 편하다. -->
<table border="1" style="width:90%;margin:auto">
	<tr>
		<% for(dan=2;dan<10;dan++){ %>
			<th bgcolor="#efefef"><%=dan%></th>
		<%} %>
	</tr>
	<% for(i=1;i<10;i++){%>
	<tr>
		<% for(int j=2;j<10;j++){%>
	
		<td style="padding-left:10px">
		<%=j%>*<%=i%>=<%=i*j%>
		</td>
		
		<%} %>
	</tr>
	<%} %>
</table>
