<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- ex04_includeAction.jsp -->
<h1>include 액션을 이용해 ex03.jsp페이지를 포함 시켜 봅시다.</h1>
<h2>include액션은 소스를 포함시키는 방식이 아니라, 실행결과를 포함시키는 방식이다.</h2>
<h3>JSP흐름을 ex03.jsp로 이동시켜 그 ***실행 결과물***을 현재 위치에 포함시킨다</h3>
<hr color='blue'>

<jsp:include page="ex03.jsp"></jsp:include>
<!-- 공백, 엔터조차도 들어가면 안된다. -->
<!-- <jsp:include page="ex03.jsp"/>  이렇게 아예 시작하자마자 닫아도 된다.-->
<%--
	RequestDispatcher disp=request.getRequestDispatcher("ex03.jsp");
	disp.include(request, response);
	와 동일한 코드다.
--%>

<!-- Servlet 경로에 해당 ex04파일을 보면 ex03의 소스는 삽입되지 않고 참조만 된 것을 볼 수 있다.
/Users/inyongkim/Documents/myjava/Workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/work/Catalina/localhost/MyWeb/org/apache/jsp/example
 -->