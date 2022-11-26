/**
 * 
 */
 
 function insertMember() {
	if(!f.me_id.value){
		alert("회원아이디를 입력해주세요.")
		f.me_id.focus();
		return;
	}
	if(!f.me_pass.value){
		alert("회원비밀번호를 입력해주세요.")
		f.me_pass.focus();
		return;
	}
	if(!f.me_name.value){
		alert("회원이름을 입력해주세요.")
		f.me_name.focus();
		return;
	}
	/*if(!f.gender.value){
		alert("성별을 선택해주세요.")
		f.gender.focus();
		return;
	}*/
	
	if(!f.gender[0].checked && !f.gender[1].checked){
		alert("성별을 선택해주세요.")
		return;
	}
		
	if(!f.birth.value){
		alert("생년월일을 입력해주세요.")
		f.birth.focus();
		return;
	}
	if(!f.address.value){
		alert("주소를 입력해주세요.")
		f.address.focus();
		return;
	}
	if(!f.tel.value){
		alert("전화번호를 입력해주세요.")
		f.tel.focus();
		return;
	}
	
	f.submit();
}

function ticketing() {
	if(!ft.me_id.value){
		alert("회원아이디를 입력해주세요.")
		ft.me_id.focus();
		return;
	}
	if(!ft.me_pass.value){
		alert("회원비밀번호를 입력해주세요.")
		ft.me_pass.focus();
		return;
	}
	if(!ft.mo_name.value){
		alert("영화제목을 선택해주세요.")
		ft.mo_name.focus();
		return;
	}
	if(!ft.rm_date.value){
		alert("예매일을 입력해주세요.")
		ft.rm_date.focus();
		return;
	}
	
	f.submit();
}

function ticketingSelect() {
	location.href="inquireMember.jsp";
	return;
}



