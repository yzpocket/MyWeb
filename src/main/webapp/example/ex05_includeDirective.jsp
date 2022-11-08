<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- ex05_includeDirective.jsp -->
<h1>include 지시어에 대해 살펴봅시다.</h1>
<h2>현재 페이지는 ex05_includeDirective.jsp 페이지입니다. </h2>
<h3>include지시어는 특정 페이지를 포함시키고자 할 때 사용합니다.</h3>
<h3>include지시어를 이용하면 포함시킬 페이지의 ***소스 코드를 삽입하는 형태***로 포함시킵니다.</h3>
<hr color='red'>

<%@ include file="ex03.jsp" %>

<!-- Servlet 경로에 해당 ex05파일을 보면 ex03의 소스 자체가 삽입된것을 볼 수 있다.
/Users/inyongkim/Documents/myjava/Workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/work/Catalina/localhost/MyWeb/org/apache/jsp/example
 -->