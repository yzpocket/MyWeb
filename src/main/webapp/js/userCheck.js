
//idCheck.jsp의 아이디 중복 검사에서의 유효성 검사------------------START----------------------<<<<<<<<<<
//팝업 부분
let win=null;
function open_idcheck(){
	win=window.open("idCheck.jsp","idCheck", "width=400, height=400, left=200, top=200");
}//----------------
function setId(uid){
	//uid값을 부모창(window)의 userid의 value값에 전달해야 한다.
	//부모창을 참조할수있는 방법 (opener==> window객체)
	//opener(window) > document > forms > ... 
	opener.document.mf.userid.value=uid;
	
	//팝업창 닫기 ==>self(window객체)
	self.close();
}//----------------

function id_check(){
	if(!idf.userid.value){
		alert('아이디를 입력해야 해요')
		idf.userid.focus();
		return;	
	}
	if(!isUserid(idf.userid)){ //유효성체크와 동일하니 함수를 빌려 쓰자. 
		alert('아이디는 영문자,숫자,_,!로 4~8자까지 가능해요')
		idf.userid.select();
		return;
	}
	idf.submit();
}
//idCheck.jsp의 아이디 중복 검사에서의 유효성 검사------------------End----------------------<<<<<<<<<<






//join.jsp (메인 폼mf)에서의 유효성 검사------------------START----------------------<<<<<<<<<<
function member_check(){
	if(!isKor(mf.name)){ //isKor()는 아래 별도 함수 만듦
		alert('이름은 한글 이름만 가능합니다.')
		mf.name.select();
		return;
	}
	if(!isUserid(mf.userid)){
		alert('아이디는 영문자,숫자,_,!로 4~8자까지 가능해요')
		mf.userid.select();
		return;
	}	
	if(!isPasswd(mf.pwd)){
		alert('비밀번호는 영문자,숫자,!,.로 4~8자까지 가능해요')
		mf.pwd.select();
		return;
	}
	if(mf.pwd.value!=mf.pwd2.value){
		alert('비밀번호와 비밀번호 확인이 달라요');
		mf.pwd2.select();
		return;
	}
	if(!isMobile(mf.hp1, mf.hp2, mf.hp3)){
		alert('핸드폰 번호 형식에 맞지 않아요, 앞자리(010|011)중에 하나-(숫자3~4자리)-(숫자4자리)');
		mf.hp1.select();
		return;
	}
/*
	//날짜 테스트용 (테스트만하고 주석처리 예정)
	if(!isDate(mf.birth)){
		alert('날짜 형식에 맞아야 합니다');
		mf.birth.select();
		return;		
	}
*/
/*
	//이메일 테스트용 (테스트만하고 주석처리 예정)
	if(isEmail(mf.email)){
		alert('이메일 형식에 맞아야 합니다');
		mf.email.select();
		return;
	}
*/
	mf.submit();
}//------
//join.jsp (메인 폼mf)에서의 유효성 검사------------------END----------------------<<<<<<<<<<


//위 유효성 검사의 실질적인 각 function 함수 정의 (=메서드와 비슷)------------------------<<<<<<<<<
/**
한글 이름 체크 정규식 쓰는 방법.
^ : 시작 의미
$ : 끝 의미
[?-?] : 범위 
가-힣 : 한글을 의미
+ : 패턴이 한번 이상 반복된다는 의미
 */
function isKor(input){
	let val=input.value;
	//let pattern=new RegExp(/multi/g); // multi문자열이 있는지 여부를 체크하는 패턴
	//let pattern=/multi/g //이렇게 줄여서 쓴다.
	let pattern=/^[가-힣]+$/; //한글 체크 정규식
	let b=pattern.test(val); // test.() : 정규식 패턴에 맞으면 true를 반환하고, 틀리면 false를 반환한다.
	//alert(b);
	return b;
}
/**
영문 아이디 체크 정규
^ : 시작 의미
$ : 끝 의미

[?-?] : 범위 
a-z : 알파벳 소문자
A-Z : 알파벳 대문자
0-9 : 아라비아 숫자

_ : _ 허용
! : ! 허용
+ : 패턴이 한번 이상 반복된다는 의미	

{ } : 자릿수 범위
{4} : 허용되는 자릿수 4개까지만
{4,8} :허용되는 자릿수 4~8자리만 가능
 */
function isUserid(input){
	let val=input.value;
	//let pattern=/^[abc]$/; //a or b or c 라는 의미
	let pattern=/^[a-zA-Z0-9_!]{4,8}$/; //영문 or 숫자 or _ or ! 라는 4~8자릿수의미 
	let b=pattern.test(val);
	//alert(b);
	return b;
}

/** https://regexr.com/에서 참고 
영문 비밀번호 체크 정규식
^ : 시작 의미
$ : 끝 의미

[?-?] : 범위 
\w : a-zA-Z0-9를 포함.
\. : .허용
! : ! 허용

{ } : 자릿수 범위
{4} : 허용되는 자릿수 4개까지만
{4,8} :허용되는 자릿수 4~8자리만 가능
 */
function isPasswd(input){
	let val=input.value;
	let pattern=/^[\w!\.]{4,8}$/;
	let b=pattern.test(val);
	//alert('pwd'+b);
	return b;
}

/** https://regexr.com/에서 참고 
영문 비밀번호 체크 정규식
\b : 단어의 경계를 나타내며 해당 패턴이 정확하게 일치해야 함을 의미
(010|011) : 010 또는 011이 와야 함.
\d{3,4} : 숫자가 3개이상 4개이하 나와야 함.
\d{4} : 숫자가 4개 나와야 함. */
function isMobile(input1, input2, input3){
	let val=input1.value+"-"+input2.value+"-"+input3.value;
	//alert(val);
	let pattern=/\b(010|011)[-]\d{3,4}[-]\d{4}\b/;
	let b=pattern.test(val);
	//alert('hp'+b);
	return b;
}

/*
 //날짜 형식 정규식() 주석처리
function isDate(input){
	let val=input.value;
	let pattern=/^(19|20)[0-9]{2}[/.-](0[1-9]|1[0-2])[/.-](0[1-9]|[1-2][0-9]|3[0-1])$/;
	let b=pattern.test(val);
	alert(b);
	return b;
}
 */
/*
function isEmail(input){
	let val=input.value;
	let pattern=/^[\w\_\-\.]*\@[\w\-\_\.]*\.[\w\-\_]$/;
	let b=pattern.text(val);
	alert(b);
	return b;
}
*/

//위 유효성 검사의 실질적인 각 function 함수 정의 (=메서드와 비슷)------------------------<<<<<<<<<