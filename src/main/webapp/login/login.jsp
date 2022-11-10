<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/top.jsp"/>

<style> 
	.container{
		padding: 8px;
	}
	#btnLogin{
		padding:4px;
		background-color: bisque;
		width:20%;
		border: 1px solid silver;
	}
</style>

<!-- 여기선 form(loginF)에서의 button의 기본 submit을 이용해보자. -->
<script>
	let login_check=function(){
		if(!loginF.userid.value){
			alert('아이디를 입력하세요');
			loginF.userid.focus();
			return false;
		}
		if(!loginF.pwd.value){
			alert('패스워드를 입력하세요')
			loginF.pwd.focus();
			return false;
		}
		return true;
	};
	
</script>

<div class="container">
	<br>
	<h1>Login</h1>
	<br>
	<div class="container">
												<!-- onsubmit은 form이 전송 될 때 실행된다.
												(이전에 일반버튼타입을 주고 submit을 함수에서 따로 처리하는 방법과 같지만 개발자마다 스타일이 다름)
												- onsubmit에서 호출하는 함수의 반환값에 따라 전송 여부를 결정한다.
												- true를 반환하면 전송, false를 반환하면 전송안함.
												 -->
		<form name="loginF" action="loginEnd.jsp" method="post" onsubmit="return login_check()">
			<table border="1" style="width:60%;margin:auto;">
				<tr>
					<td witdth="20%" class="m1"><b>아이디</b></td>
					<td witdth="80%" class="m2">
						<input type="text" name="userid" id="userid" placeholder="User ID">
					</td>
				</tr>
				<tr>
					<td witdth="20%" class="m1"><b>비밀번호</b></td>
					<td witdth="80%" class="m2">
						<input type="password" name="pwd" id="pwd" placeholder="Password">
					</td>
				</tr>
				<tr>
					<td colspan="2" class="container">
						<label for="saveId">
							<input type="checkbox" name="saveId" id="saveId"> 아이디 저장
						</label>
						<button id="btnLogin">로그인</button>
						<!-- default가 submit 버튼  -->
						<br><a href="../member/join.jsp">..join a member</a>
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>
<jsp:include page="/foot.jsp"/>