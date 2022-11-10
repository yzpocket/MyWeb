/**
 * 
 */
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
	mf.submit();
}//------


/**
한글 체크 정규식 쓰는 방법.
^ : 시작 의미
[ - ] : 범위 
가-힣 : 한글을 의미
$ : 끝 의미
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

function isUserid(input){
	let val=input.value;
	//let pattern=/^[abc]$/; //a or b or c 라는 의미
	let pattern=/^[a-zA-Z0-9_!]+$/ //영문 or 숫자 or _ or ! 라는 의미 
	let b=pattern.test(val);
	alert(b);
	return b;
}