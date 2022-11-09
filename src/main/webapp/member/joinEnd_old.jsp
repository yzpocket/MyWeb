<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="user.model.*" errorPage="/example/myerror.jsp"%>

<%
/* ------- MODEL 1 방식 ------- */
/* 장점 : 코드 작성이 쉬운편이다. 간단한 페이지, 앱은 이것이 수월 할 수 있다. */


	//0. 한글 인코딩 부터 맞춘다.
	request.setCharacterEncoding("UTF-8");
	//아래부터는 MemoAddServlet 에서 하던 코드와 같다.
	//[1] 사용자가 입력한 값 받기
	//jsp에는 내장객체 : request를 가지고 있다. => HttpServletRequest타입
	String name=request.getParameter("name");
	String userid=request.getParameter("userid");
	String pwd=request.getParameter("pwd");
	String hp1=request.getParameter("hp1");
	String hp2=request.getParameter("hp2");
	String hp3=request.getParameter("hp3");
	String post=request.getParameter("post");
	String addr1=request.getParameter("addr1");
	String addr2=request.getParameter("addr2");
	//2. 유효성체크 (name,userid,pwd,hp1,hp2,hp3)
	if(name==null||userid==null||pwd==null||hp1==null||hp2==null||hp3==null){
		response.sendRedirect("join.jsp");
		return;
	}
	//3. 1==> UserVO에 담아주기
	UserVO user=new UserVO(0,name,userid,pwd,hp1,hp2,hp3,post,addr1,addr2,null,1000,0);
	
	//4. UserDAO생성해서 insertUser()호출하기.
	UserDAO dao=new UserDAO();
	int n=dao.insertUser(user);
	//JSP에서는 MemoAddServlet 서블릿과 다르게 try, catch를 하지 않는다. 다만 errorPage를 지정한다. [차이점]
		
	//5. 그 결과 메시지 처리 및 페이지 이동
	String str=(n>0)?"회원가입 처리 완료-로그인 페이지로 이동합니다":"회원가입 실패";
	String loc=(n>0)?"../login/login.jsp":"javascript:history.back()";
%>
<script>
	alert('<%=str%>');
	location.href='<%=loc%>';
</script>
	