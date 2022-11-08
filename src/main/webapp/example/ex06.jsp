<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/top.jsp"/>
<h1>성적입력</h1>
<!-- save()유효성 체크 -->
<script type="text/javascript">
	function save(){
		//유효성 체크 (window.document. 이부분 생략)
		if(!frm.empno.value){
			alert('사번을 입력하세요');
			frm.empno.focus();//입력 포커스
			return;
		}
		//!이렇게 하면  == , = 잘못입력하는 실수 잡을수있음. 
		if(!frm.javascore.value){
			alert('JAVA 점수를 입력하세요');
			frm.javascore.focus();
			return;
		}
		if(!frm.dscore.value){
			alert('DB 점수를 입력하세요');
			frm.dscore.focus();
			return;
		}
		if(!frm.jspscore.value){
			alert('JSP 점수를 입력하세요');
			frm.jspscore.focus();
			return;
		}

		//위 사항들 체크 문제없으면 서브밋.
		frm.submit();
	}
</script>

<!-- CSS style -->
<style>
	input{
		width:100%;
	}
	form,table{
		text-align:center;
		margin:auto;
	}
	
	td{
		padding:5px;
	}
</style>


<!-- HTML MAIN -->

<form name="frm" action="ex06_result.jsp" method="post">
	<table border="1" style="width:90%;margin:auto">
		<tr>
			<td colspan=2 style="width:40%;margin:auto">사번</td>
			<td><input type="text" name="empno"></td>
		</tr>
		<tr>
			<td rowspan=3>과목</td>
			<td>JAVA</td>
			<td><input type="text" name="javascore"></td>
		</tr>
		<tr>
			<td>DataBase</td>
			<td><input type="text" name="dscore"></td>
		</tr>
		<tr>
			<td>JSP</td>
			<td><input type="text" name="jspscore"></td>
		</tr>
		<tr>
			<td colspan=4><button type="button" onclick="save()">저장하기</button></td>
		</tr>
	</table>
</form>

<jsp:include page="/foot.jsp"/>