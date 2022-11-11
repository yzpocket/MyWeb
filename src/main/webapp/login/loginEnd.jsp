<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="user.model.*"  errorPage="/login/errorAlert.jsp"  %>
<%
	request.setCharacterEncoding("utf-8");
	//1. 아이디, 비번값 받기
	String userid=request.getParameter("userid");
	String pwd=request.getParameter("pwd");
	
	//[추가부분] Cookie 활용 - 아이디 저장 값 받기   -- 아래 쿠키 생성부분과 연결.
	String saveId=request.getParameter("saveId");
	System.out.println("saveId: "+saveId); //체크하면 on, 체크안하면 null이 뜬다.
	
	//2. 유효성 체크=>login.jsp
	if(userid==null||pwd==null||userid.trim().isEmpty()||pwd.trim().isEmpty()){
		response.sendRedirect("login.jsp");
		return;
	}
	
	//3. UserDAO빈 생성해서  UserVO loginCheck(userid,pwd) 호출
	/*
		1) 아이디와 비번이 일치하는지 db에서 확인해서 일치하면 해당 회원정보를 UserVO에 담아서
			반환해줌
		2) 일치하지 않으면 사용자정의 예외(NotUserException)를 발생시킨다.
	*/
%>
<jsp:useBean id="userDao" class="user.model.UserDAO" scope="session"/>
<% 
	UserVO loginUser=userDao.loginCheck(userid, pwd);  
	if(loginUser!=null){
		//out.println("<h1>로그인 성공</h1>");
		//회원인증을 받았다면 인증받은 회원정보를 session저장하자. 
		/* session 내장객체 : HttpSession 타입
			- setAttribute(String key, Object value)
			- Object getAttribute(String key)
		*/
		session.setAttribute("loginUser", loginUser);
		//session은 서버쪽에 저장, cookie는 클라이언트쪽에 저장
		
		//------쿠키 생성 및 전송 부분------------------
		//saveId에 체크를 했다면 쿠키를 생성해서 사용자 아이디를 저장하고 유효시간을 설정하자.
		Cookie ck= new Cookie("uid", userid);
		if(saveId!=null){
			ck.setMaxAge(60*60*24*7); 
		}
		else{//saveId에 체크를 안했다면 ==>쿠키 삭제
			ck.setMaxAge(0); // <-- 쿠키 즉시 삭제
		}
		ck.setPath("/");
		//response에 쿠키를 추가.
		response.addCookie(ck);
		//------쿠키 생성 및 전송 부분------------------
		
		
		
		response.sendRedirect("../index.jsp");
	}
	
%>








