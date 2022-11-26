/**
 * 
 */
 
 function checkMember() {
	if(f.me_id.value == ""){
		alert("회원 아이디를 입력해주세요");
		return f.me_id.focus();
	}
	if(f.me_pass.value == ""){
		alert("비밀번호를 입력해주세요");
		return f.me_pass.focus();
	}
	if(f.me_name.value == ""){
		alert("회원 이름를 입력해주세요");
		return f.me_name.focus();
	}
	if(f.gender.value == ""){
		alert("회원 성별을 선택해주세요");
		return f.gender.focus();
	}
	if(f.birth.value == ""){
		alert("생년월일을 입력해주세요");
		return f.birth.focus();
	}
	if(f.address.value == ""){
		alert("주소를 입력해주세요");
		return f.address.focus();
	}
	if(f.tel.value == ""){
		alert("전화번호를 입력해주세요");
		return f.tel.focus();
	}
	f.submit();
}

function checkMovie() {
	if(f.me_id.value == "") {
		alert("회원 아이디를 입력해주세요");
		return f.me_id.focus();
	}
	if(f.me_pass.value == ""){
		alert("비밀번호를 입력해주세요");
		return f.me_pass.focus();
	}
	if(f.mo_name.value == ""){
		alert("영화제목을 선택하세요");
		return f.mo_name.focus();
	}
	if(f.rm_date.value == ""){
		alert("예매날짜를 입력해주세요");
		return f.rm_date.focus();
	}
	f.submit();
}




