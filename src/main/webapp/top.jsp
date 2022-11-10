<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="user.model.*"%>
<!-- top.jsp -->
<%
	//Context명을 동적으로 알아내자 "/MyWeb" ==> Context
	//절대경로방식 : 컨텍스트를 기준으로 경로 잡는 방식 "/MyWeb/memo/list.jsp" 처럼..
	//top.jsp, foot.jsp는 공통 모듈이므로 ==> 절대 경로를 잡아줘야 한다.
	String myctx=request.getContextPath();
	//System.out.println("myctx(절대경로기준): "+myctx);
	
	//세션에서 저장한 로그인 유저를 불러온다.
	UserVO loginUser=(UserVO)session.getAttribute("loginUser");
	boolean isLogin=(loginUser!=null)? true:false;
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Webpage</title>
    <link rel="stylesheet" type="text/css" href="<%=myctx%>/css/layout.css"> <!-- absolute direction would be better -->
</head>
                <!-- Standard Webpage Form -->
<body> 
    <div id="wrap" class="container">
        
        <!-- Header: Logo Image, Searching, etc ------>
        <header> <!-- Head Section -->
            <a href="<%=myctx%>/index.jsp"><img src="<%=myctx%>/images/main_logo.png" alt="main_logo"></a>
        </header>
        <div class="clear"></div> <!-- div float clear blank-->
        <!-- Navigation bar : Menu--------------------->
        <nav> <!-- Nav section -->
            <ul>
                <li><a href="<%=myctx%>/index.jsp">Home</a></li>
                <li><a href="<%=myctx%>/member/join.jsp">Signup</a></li>
                <% if(!isLogin){ %>
                <li><a href="<%=myctx%>/login/login.jsp">Signin</a></li>
                <%}else{ %>
                <li><a href="<%=myctx%>/login/logout.jsp">Logout</a></li>
                <%} %>
                <li><a href="<%=myctx%>/member/list.jsp">Users</a></li>
                <li><a href="#">Board</a></li>
                <% if(isLogin){ %>
                <li style="background:navy; border-radius:5px;"><a href="#" style="color:white;"><%=loginUser.getUserid() %>님 로그인 중..</a></li>
                <%} %>
            </ul>
        </nav>
        <div class="clear"></div> <!-- div float clear blank-->
        <!-- Content----------------------------------->
        <article> <!-- Content section -->