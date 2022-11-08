<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="memo.model.*" %> <!-- import로 MemoVO 받아와야함. -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>한줄 메모장 수정</title>

<!-- CSS 임포트 -->
<link rel="stylesheet" type="text/css" href="css/memo.css">

<script type="text/javascript">
	function check(){
		//유효성 체크 (window.document. 이부분 생략가능)
		if(window.document.frm.name.value==""){
			alert('이름을 입력하세요');
			frm.name.focus();//입력 포커스
			return;
		}
		//!이렇게 하면  == , = 잘못입력하는 실수 잡을수있음. 
		if(!frm.msg.value){
			alert('메모 내용을 입력하세요');
			frm.msg.focus();
			return;
		}
		if(frm.msg.value.length>100){
			alert('메모 내용은 100자까지만 가능해요');
			frm.msg.select();
			return;
		}
		//위 사항들 체크 문제없으면 서브밋.
		frm.submit();
	}
</script>

</head>
<body>
<div id="wrap">
<%
	MemoVO vo=(MemoVO) request.getAttribute("memo");//<<<"memo"가 edit서블릿의 키값임. 객체로 받아오기.
	//out.println("vo: "+vo);
	//view단 유효성체크 
	if(vo==null){
		%>
		<script>
			alert('존재하지 않는 글입니다.');
			history.back();
		</script>
		<%
		return;
	}
%>

<!-- /MyWeb/memo/input.html => 현재 디렉토리
action쪽에 servlet경로를 상대경로로 MemoEdit를 찾게 하는게 좋다. -->
	<form name="frm" action="MemoEdit" method="post">
		<table border="1">
			<tr>
				<th colspan="2"><h1>::한줄 메모장 수정::</h1></th>
			</tr>
			<!-- 수정할때는 글번호가 form태그 안에 있어야 한다. 수정 못하게 readonly 
			%=vo.getIdx()%>.. 속성들 추가해서 원본이 보여지게-->
			<tr>
				<td width="20%"><b>글번호</b></td>
				<td width="80%">
					<input type="text" name="idx" value="<%=vo.getIdx()%>" readonly placeholder="idx" style="width:40%; background-color:silver;">
				</td>
			</tr>
			<!------------------------------------------>
			<tr>
				<td width="20%"><b>작성자</b></td>
				<td width="80%">
					<input type="text" name="name" value="<%=vo.getName()%>" placeholder="Name" style="">
				</td>
			</tr>
			<tr>
				<td width="20%"><b>메모 내용</b></td>
				<td width="80%">
					<input type="text" name="msg" value="<%=vo.getMsg()%>" placeholder="Message" style="">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="button" onclick="check()">글 수정하기</button>
					<!-- button에 type을 기술하지 않으면 기본이 submit버튼 그래서 일반 button으로 하고
					 submit을 따로 javascript로 유효성 체크 후 처리 -->
					<button type="reset">다시 쓰기</button>
				</td>
				
			</tr>
		</table>
	</form>
</div>
</body>
</html>