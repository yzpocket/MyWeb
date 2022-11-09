<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	//단일 값 받아오기. (name,pass,gender,photo,job,intro,hidden)
	//request : HttpServletRequest 타입.
	//String ??=request.getParameter("파라미터(==name)이름");
	String name=request.getParameter("userid");	
	String pass=request.getParameter("passwd");	
	String gender=request.getParameter("gender");	
	String photo=request.getParameter("photo");	
	String job=request.getParameter("job");	
	String intro=request.getParameter("intro");	
	String hidden=request.getParameter("secret");	
	
	
	//다중 값 받아오기 (hobby,lang)
	//String[] ##=request.getPrameterValues("파라미터(==name)이름")
	//배열로 오기때문에 출력할때 반복문 출력 해야한다.
	String[] hobbies=request.getParameterValues("hobby");
	String[] langs=request.getParameterValues("lang");
%>
<ul>
	<li>이름:<%=name%></li>
	<li>비밀번:<%=pass%></li>
	<li>성별:<%=gender%></li>
	<li>파일명:<%=photo%></li>
	<li>직업:<%=job%></li>
	<li>자기소개:<%=intro%></li>
	<li>비밀:<%=hidden%></li>
	
	
		<!-- 배열로 오기때문에 출력할때 반복문 출력 해야한다. -->
	
	<li>취미:
		<%if(hobbies!=null){
			for(String hobby:hobbies){
				out.println(hobby+", ");
			}
		}
		%>
	</li>
	<li>사용가능 언어:
		<%
			if(langs!=null){
				int i=0;
					for(String lang:langs){
						if(i<langs.length-1){
						%>
					<%=lang %>,
					<%
					}else{
						out.println(lang);
					}
				}
			}
		%>
	</li>
</ul>

<hr color='red'>
<h1>request의 getParameter말고도 다른 메서드들도 있다.</h1>
<h1>request의 주요 메서드</h1>
<%
	String server=request.getServerName(); //서버 도메인명을 알아내는 메서드 String타입
	int port=request.getServerPort(); //서버 포트번호를 알아내는 메서드 int타입
	
	StringBuffer buf=request.getRequestURL(); //서버 URL을 알아내는 메서드 StringBuffer타입
	String url=buf.toString(); //url은 StringBuffer타입이라 String으로 변환해줘야함.
	//URL : 전체 URL을 반환 : http://localhost:9090/MyWeb/example/ex08_requestResult.jsp

	String uri=request.getRequestURI(); //uri String타입
	//URI : 컨텍스트명 이후 경로를 반환 : /MyWeb/example/ex08_requestResult.jsp
	
	String myctx=request.getContextPath(); //"/MyWeb" 컨텍스트명을 반환 String타입
	
	String queryString=request.getQueryString(); //쿼리스트링(?) 물음표이후
	//?이후 전달되는 값들 : ? userid=&passwd=&photo=&gender=F&hobby=sports&job=Developer&lang=JavaScript&intro=&secret=Top+Secret
	
	String cip=request.getRemoteAddr();
	String protocol=request.getProtocol();
	
	//blue라인 이후 특정 경로들만 추출.
	int i=uri.indexOf(".jsp");
	int end=0;
	if(i>0)
		end=i;
	String str=uri.substring(myctx.length(), end);
	String str2=uri.replace(myctx="/","").replace(".jsp","");
	String str3=request.getServletPath();
%>
<h2>서버 도메인명 :<%=server %></h2>
<h2>서버 포트번호 :<%=port %></h2>
<h2>요청 URL :<%=url %></h2>
<h2>요청 URI :<%=uri %></h2>
<h2>컨텍스트명 :<%=myctx %></h2>
<h2>쿼리스트링 :<%=queryString %></h2>
<h2>클라이언트 IP :<%=cip %></h2>
<h2>프로토콜 :<%=protocol %></h2>

<hr color='blue'>
<h1><%=str %></h1>
<h1><%=str2 %></h1>
<h1><%=str3 %></h1>