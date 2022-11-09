<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
    <html lang="en">
        <head>
            <meta charset="UTF-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>ex08_request.jsp</title>
        </head>
        <body style="padding-left:5em;">
            <!-- form태그의 속성
	1) name, id : 폼을 식별할 수 있는 이름
	2) action : 폼 양식을 처리해줄 서버 페이지를 기술한다.
	3) method : 데이터 전송방식을 기술한다. 주로 get아니면 post를 기술한다. put, delete,..
			get방식은 간단한 데이터 전송시 사용한다.=> 사용자가 입력한 값이 url부분에 노출됨
			post방식은 대용량의 데이터 전송시 사용 => 데이터가 노출되지 않는다.
    4) enctype : 인코딩 방식을 지정한다.
				파일 업로드시는 multipart/form-data를 지정해야 한다.
                application/x-www-form-urlencoded==>디폴트 (파일첨부시 파일명만 전송됨)

        http://localhost:8080/join.jsp?name=test&userid=aaa&pwd=1111&photo=&gender=Male
		&hobby=sports&hobby=movie

        http://127.0.0.1:5500/join?userid=sdfsdfs&pwd=123 =>GET방식의 요청일 때
        get방식 요청일 때는 입력 데이터를 query string으로 url부분에 포함시켜서 서버에 전송한다.
        ?userid=sdfsdfs&pwd=123 => Query String

        http://127.0.0.1:5500/join ===> POST 방식 요청일 때
	-->

            <h1>form양식</h1>
            <p>
            form태그는 사용자가 입력한 값들을 웹서버에
            <br>form태그 안에는 다양한 입력양식들이 올 수 있다
            </p>
            <hr color="red">
            <!-- mothod : get(디폴트), post, put, delete, options -->
            <!-- get은 url에 입력정보가 노출 -->
             <!--  method "GET" 일경우에 사용 enctype="application/x-www-form-urlencoded" -->
             <!-- method "post" 일경우에 사용       enctype="multipart/form-data" -->
            <!-- put은 action만 보여 노출되지않음 -->
            <form name="frm" id="frm" action="ex08_requestResult.jsp" method="post">
                <!-- 파일 업로드시 enctype="multipart/form-data"  -->
                아이디: <input type="text" name="userid"><br>
                비밀번호: <input type="password" name="passwd"><br>
                회원사진: <input type="file" name="photo"><br>
                성별: <input type="radio" name="gender" value="M">남자
                <input type="radio" name="gender" value="F" checked="checked">여자<br>
                
                <!-- checked속성을 주면 시작선택위치 지정 가능 -->
                <!-- 단일선택일때는 타입 radio, 이때 동일한 !!!name!!!일 경우에 그 중에 1개만 선택함 -->
                취미: 체크박스
                <input type="checkbox" name="hobby" value="sports">운동
                <input type="checkbox" name="hobby" value="reading">독서
                <input type="checkbox" name="hobby" value="music">음악
                <input type="checkbox" name="hobby" value="movie">영화<br>
                <!-- 드롭다운은 select 태그와 option 자식태그사용 
                    - multiple 속성을 주면 다중선택이 가능함
                    - size 속성을 주면 펼친형태가 된다
                -->
                드롭다운리스트
                <select name="job">
                    <!-- ""값이없으면 전송되지않도록함 
                        selected 속성을 주면 시작선택위치 선택 가능-->
                    <option value="">::직업을 선택하세요::</option>
                    <option value="Developer" selected>개발자</option>
                    <option value="Designer">디자이너</option>
                    <option value="Manager">매니저</option>
                </select><br>

                드롭다운리스트2
                <!-- multiple 속성으로 기본 펼쳐놓기 가능
                    multiple size 속성으로 몇개까지 펼쳐놓을지 가능 -->
                <select name="lang" multiple size="6">
                    <option value="">::사용 가능 언어::</option>
                    <option value="Java" selected>Java</option>
                    <option value="JavaScript">JavaScript</option>
                    <option value="SQL">SQL</option>
                </select><br>
             

                <!-- ="5"></text 이렇게 닫는 태그 거리만큼 들여쓰기가 될 수 있으니 붙여쓰도록 -->
                자기소개:
                <textarea name="intro" cols="70" rows="5"
                placeholder="자기소개를 100자이내로 하세요."></textarea><br>

                히든필드:
                <input type="hidden" name="secret" value="Top Secret"><br>
                
                <input type="submit" value="회원가입"> <!-- 전송버튼 -->
                <input type="button" value="일반버튼" onclick="alert('안녕하세요')"> 
                <!-- 일반버튼 전송기능없음, 하지만 +JavaScript를 통해서 메서드를 만들어 submit처리 등 할수 있음.. -->
                <input type="reset" value="다시쓰기"> <!-- 입력값들을 초기화함-->
                <input type="image" src="../images/login.jpg">
                 <!-- image 버튼은 기본적으로 submit 전송버튼이 있다 
                    submit 기능이 없는 이미지를 올리려면 아래와 같이 <img src태그사용+ 스크립트 -->
                <img src="../images/login.jpg" onclick="alert('이미지입니다')">   
            </form>

        </body>
    </html>