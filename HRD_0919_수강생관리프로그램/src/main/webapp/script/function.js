// 유효성 체크
function check() {
	if (!f.student_name.value) {
		alert("이름을 입력해주세요.");
		
		return f.student_name.focus();
	}
	if (!f.student_phone.value) {
		alert("연락처를 입력해주세요.");
		
		return f.student_phone.focus();
	}
	if (!f.student_birth.value) {
		alert("생년월일을 입력해주세요.");
		
		return f.student_birth.focus();
	}
	
	f.submit();

} // check();


function insertStudent() {
	if(confirm("등록하시겠습니까?")){
		return check();
	}
} 

function toRegister() {
	if(confirm("신청하시겠습니까?")){
		
		if(!f.student_no.value) {
			alert("수강생번호를 입력해주세요");	
			return  f.student_no.focus();
		}
	
		if(!f.subject_seq.value){
			alert("수강과목을 선택해주세요.")
			return f.subject_seq.focus();
		}
		
	 f.submit();
	
	} 
}

function checkRegisterID(){
	
	if(!f.student_no.value) {
		alert("수강생번호를 입력해주세요");	
		return  f.student_no.focus();
	}
	
	if(!f.subject_seq.value){
		alert("수강과목을 선택해주세요.")
		return f.subject_seq.focus();
	}
}


function rewrite() {
	return f.reset() ;
}

function inquire() {
	if(confirm("수강생조회/수정 화면으로 이동하시겠습니까?")){
		return location.href="inquireStudent.jsp";
	}
}

function moveToRegiserTable() {
	if(confirm("수강조회 화면으로 이동하시겠습니까?")){
		return location.href="inquireClass.jsp";
	}
}