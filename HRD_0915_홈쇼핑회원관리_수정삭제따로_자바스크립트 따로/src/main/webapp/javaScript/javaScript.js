//유효성 체크
function checkUpdate() {
	if(!f.custno.value) {
		alert("회원번호가 입력되지 않았습니다.");
		return f.custno.focus();
	}
	if(!f.custname.value) {
		alert("회원성명이 입력되지 않았습니다.");
		return f.custname.focus();
	}
	if(!f.phone.value) {
		alert("회원전화가 입력되지 않았습니다.");
		return f.phone.focus();
	}
	if(!f.address.value) {
		alert("회원주소가 입력되지 않았습니다.");
		return f.address.focus();
	}
	if(!f.joindate.value) {
		alert("가입일자가 입력되지 않았습니다.");
		return f.joindate.focus();
	}
	
	//대문자 "A" "B" "C" 이외는 알림창이 뜸
	/* 회원등급 유효성 검사 다른 방법들
	if(f.grade.value != "A" && f.grade.value != "B" && f.grade.value != "C") {
		alert("회원등급이 정상적으로 입력되지 않았습니다.");
		return f.grade.select();
	}
	if(!(f.grade.value == "A" || f.grade.value == "B" || f.grade.value == "C")) {
		alert("회원등급이 정상적으로 입력되지 않았습니다.");
		return f.grade.select();
	}
	*/
	
	/* 대문자 "A" "B" "C" 와 소문자 "a" "b" "c" 이외는 알림창이 뜸 
      따라서 소문자 "a" "b" "c" 때문에 SQL에서 insert할 때 UPPER(?)로 대문자로 변경하여 추가해야 함 
	*/
	const gradeLimit = ["A", "B", "C"];		//회원등급
	
	if(gradeLimit.indexOf(f.grade.value.toUpperCase()) == -1) {	//지정된 회원등급으로 입력하지 않은 경우
		alert("회원등급이 정상적으로 입력되지 않았습니다.");
		return f.grade.select();
	}
	
	if(!f.city.value) {
		alert("도시코드가 입력되지 않았습니다.");
		return f.city.focus();
	}
	
	//f.action = "updatePro.jsp"; // [따로 : 방법-2]
	
	f.pro1.value = "수정"; //[함께 : 방법-1]
	
	f.submit(); //모두 입력됐다면 submit함
}//checkUpdate의 끝

function checkDelete() {
	if(!f.custno.value) {
		alert("회원번호가 입력되지 않았습니다.");
		return f.custno.focus();
	}
	
	if(confirm("이 회원을 정말 삭제하시겠습니까?")) {
		//location.href = "deletePro.jsp?custno=" + f.custno.value; //[따로 : 방법-1]
		
		//f.action = "deletePro.jsp" //[따로 : 방법-2]
		
		f.pro1.value ="삭제"; //[함께 : 방법-1]
		f.submit();
	} else return;
	
}

//[함께-방법-2]-----------------------------------------------------------------------
function checkUpdateDelete(btnId) {
	if(!f.custno.value) {
		alert("회원번호가 입력되지 않았습니다.");
		return f.custno.focus();
	}
	if(!f.custname.value) {
		alert("회원성명이 입력되지 않았습니다.");
		return f.custname.focus();
	}
	if(!f.phone.value) {
		alert("회원전화가 입력되지 않았습니다.");
		return f.phone.focus();
	}
	if(!f.address.value) {
		alert("회원주소가 입력되지 않았습니다.");
		return f.address.focus();
	}
	if(!f.joindate.value) {
		alert("가입일자가 입력되지 않았습니다.");
		return f.joindate.focus();
	}
	
	//대문자 "A" "B" "C" 이외는 알림창이 뜸
	/* 회원등급 유효성 검사 다른 방법들
	if(f.grade.value != "A" && f.grade.value != "B" && f.grade.value != "C") {
		alert("회원등급이 정상적으로 입력되지 않았습니다.");
		return f.grade.select();
	}
	if(!(f.grade.value == "A" || f.grade.value == "B" || f.grade.value == "C")) {
		alert("회원등급이 정상적으로 입력되지 않았습니다.");
		return f.grade.select();
	}
	*/
	
	/* 대문자 "A" "B" "C" 와 소문자 "a" "b" "c" 이외는 알림창이 뜸 
      따라서 소문자 "a" "b" "c" 때문에 SQL에서 insert할 때 UPPER(?)로 대문자로 변경하여 추가해야 함 
	*/
	const gradeLimit = ["A", "B", "C"];		//회원등급
	
	if(gradeLimit.indexOf(f.grade.value.toUpperCase()) == -1) {	//지정된 회원등급으로 입력하지 않은 경우
		alert("회원등급이 정상적으로 입력되지 않았습니다.");
		return f.grade.select();
	}
	
	if(!f.city.value) {
		alert("도시코드가 입력되지 않았습니다.");
		return f.city.focus();
	}
	
	if(btnId == 'update') {
		if(confirm("회원정보를 수정하시겠습니까?")) {
			f.pro2.value ="수정";
			f.submit(); //모두 입력됐다면 submit함
		}else return;
	}else if(btnId == 'delete') {
		if(confirm("회원정보를 삭제하시겠습니까?")) {
			f.pro2.value ="삭제";
			f.submit(); //모두 입력됐다면 submit함
		}else return;
	}

	//f.submit();
}
//[함께 : 방법-3]---------------------------------------------------------
function checkUpdate3() {
	f.pro3.value = "수정";
	check(); //유효성 체크
	//return false; 	//메서드 종료 방법-1
	return;				//메서드 종료 방법-2
	
	//return f.pro3.value = "수정";
}

function checkDelete3() {
	if(!f.custno.value) {
		alert("회원번호가 입력되지 않았습니다.");
		return f.custno.focus();
	}
	
	f.pro3.value = "삭제";
	f.submit();
	return;
}

function check() {
		if(!f.custno.value) {
			alert("회원번호가 입력되지 않았습니다.");
			return f.custno.focus();
		}
		if(!f.custname.value) {
			alert("회원성명이 입력되지 않았습니다.");
			return f.custname.focus();
		}
		if(!f.phone.value) {
			alert("회원전화가 입력되지 않았습니다.");
			return f.phone.focus();
		}
		if(!f.address.value) {
			alert("회원주소가 입력되지 않았습니다.");
			return f.address.focus();
		}
		if(!f.joindate.value) {
			alert("가입일자가 입력되지 않았습니다.");
			return f.joindate.focus();
		}
		
		/* 대문자 "A" "B" "C" 와 소문자 "a" "b" "c" 이외는 알림창이 뜸 
      	따라서 소문자 "a" "b" "c" 때문에 SQL에서 insert할 때 UPPER(?)로 대문자로 변경하여 추가해야 함 
		*/
		const gradeLimit = ["A", "B", "C"];		//회원등급 배열객체
		if(gradeLimit.indexOf(f.grade.value.toUpperCase()) == -1) {	//지정된 회원등급으로 입력하지 않은 경우
			alert("회원등급이 정상적으로 입력되지 않았습니다.");
			return f.grade.focus();
		}
		
		//대문자 "A" "B" "C" 이외는 알림창이 뜸
		/* 회원등급 유효성 검사 다른 방법들
		if(f.grade.value != "A" && f.grade.value != "B" && f.grade.value != "C") {
			alert("회원등급이 정상적으로 입력되지 않았습니다.");
			return f.grade.select();
		}
		if(!(f.grade.value == "A" || f.grade.value == "B" || f.grade.value == "C")) {
			alert("회원등급이 정상적으로 입력되지 않았습니다.");
			return f.grade.select();
		}
		*/
		
		if(!f.city.value) {
			alert("도시코드가 입력되지 않았습니다.");
			return f.city.focus();
		}
		
		f.submit(); //모두 입력됐다면 submit함
	}