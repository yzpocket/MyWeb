<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/top.jsp"/>
<h1>처리 결과</h1>
<%
	request.setCharacterEncoding("UTF-8");

	String empnoStr=request.getParameter("empno");
	String javaStr=request.getParameter("javascore");
	String databaseStr=request.getParameter("dscore");
	String jspStr=request.getParameter("jspscore");
	int empno=0,java=0,database=0,jsp=0;
	
	if(empnoStr==null||javaStr==null||databaseStr==null||jspStr==null
			||empnoStr.trim().isEmpty() || javaStr.trim().isEmpty()
			||databaseStr.trim().isEmpty() || jspStr.trim().isEmpty())
	{
		response.sendRedirect("ex06.jsp");
		return;
	}
	empno=Integer.parseInt(empnoStr);
	java=Integer.parseInt(javaStr);
	database=Integer.parseInt(databaseStr);
	jsp=Integer.parseInt(jspStr);
		
	float avg=(java+database+jsp)/(float)3;
	String rs=String.format("%.2f",avg);
%>
<style>
	input{
		width:100%;
	}
	table{
		text-align:center;
		margin:auto;
	}
	td{
		padding:5px;
	}
</style>

<table border="1" style="width:80%">
	<tr>
		<td colspan="2">사번</td>
		<td><%=empno %></td>
	</tr>
	<tr>
		<td rowspan="3">과목</td>
		<td>JAVA</td>
		<td><%=java%></td>
	</tr>
	<tr>
		<td>Database</td>
		<td><%=database%></td>
	</tr>
	<tr>
		<td>JSP</td>
		<td><%=jsp%></td>
	</tr>
		<tr>
		<td colspan="2">평균</td>
		<td><%=rs%></td>
	</tr>
	<tr>
		<td colspan="3"><button  onclick="location.href='ex06.jsp'">입력화면</button></td>
	</tr>
	
</table>


<jsp:include page="/foot.jsp"/> 