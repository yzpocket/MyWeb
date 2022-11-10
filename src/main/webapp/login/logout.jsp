<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//로그아웃 처리방법
	//[1] 세션에서 특정변수(키)를 제거하는 방법
	//session.removeAttribute("loginUser");  //남는것이 있을 수 있어 이것은 권장하지 않음
	//[2] 세션에 저장된 모든 변수를 제거하는 방법 => 권장
	session.invalidate();
	//변수제거하고 홈으로 리다이렉트
	response.sendRedirect("../index.jsp");
%>