<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="user.model.*" errorPage="/example/myerror.jsp"%>

<%
/* ------- MODEL 1 방식 ------- */
	//0. 한글 인코딩 부터 맞춘다.
	request.setCharacterEncoding("UTF-8");

/* joinEnd_old와 다르게 useBean 액션을 이용해서 UserVO객체와 UserDAO객체를 생성해보자 */
%>
<jsp:useBean id="user" class="user.model.UserVO" scope="page"/>
<%-- UserVO user=new UserVO(); 와 동일한 코드임 --%>
<jsp:setProperty property="*" name="user"/>
<%--
	user.setName(request.getParameter("name"));
	user.setUserid(request.getParameter("userid"));
	...
	이것들을 * 하나로 모두 하는것과 동일함.
 --%>
<%
	if(user.getUserid()==null||user.getName()==null){
		response.sendRedirect("join.jsp");
		return;
	}
%>
<jsp:useBean id="userDao" class="user.model.UserDAO" scope="session"/>
<%
	int n=userDao.insertUser(user);
	String str=(n>0)?"회원가입 처리 완료":"회원가입 실패";
	String loc=(n>0)?"../login/login.jsp":"javascript:history.go(-1)";
%>								<!-- history.go(-1) 는 한단계 이전으로 이동시키는것 -->
<script>
	alert('<%=str%>');
	location.href='<%=loc%>';
</script>
	