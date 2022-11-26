// 유효성 체크
function check() {
	if (!f.studno.value) {
		alert("학번을 입력해주세요.");
		
		return f.studno.select();
	}
	if (!f.syear.value) {
		alert("학년을 입력해주세요.");
		
		return f.syear.select();
	}
	if (!f.sname.value) {
		alert("학생이름을 입력해주세요.");
		
		return f.sname.select();
	}
	if (!f.address.value) {
		alert("주소를 입력해주세요.");
		
		return f.address.select();
	}
	if (f.gender[0].checked == false && f.gender[1].checked == false) {
		alert("성별을 선택해주세요.");
		return ;
	}
	if (!f.tel.value) {
		alert("전화번호를 입력해주세요.");
		
		return f.tel.select();
	}
	if (!f.idnum.value) {
		alert("주민번호를 입력해주세요.");
		
		return f.idnum.select();
	}
	
	f.submit();

} // check();

function check2() { // 성적등록 확인용 
	if (!f.studno.value) {
		alert("학번을 입력해주세요.");
		
		return f.studno.select();
	}
	if (!f.syear.value) {
		alert("학년을 입력해주세요.");
		
		return f.syear.select();
	}
	if (!f.m_subject1.value) {
		alert("전공1 점수를 입력해주세요.");
		
		return f.m_subject1.select();
	}
	if (!f.m_subject2.value) {
		alert("전공2 점수를 입력해주세요.");
		
		return f.m_subject2.select();
	}
	if (!f.m_subject3.value) {
		alert("전공3 점수를 입력해주세요.");
		
		return f.m_subject3.select();
	}
	if (!f.s_subject1.value) {
		alert("교양1 점수를 입력해주세요.");
		
		return f.s_subject1.select();
	}
	if (!f.s_subject2.value) {
		alert("교양2 점수를 입력해주세요.");
		
		return f.s_subject2.select();
	}
	
	f.submit();

} // check();


function insertSubmit() {
	if(confirm("등록하시겠습니까?")){
		return check();
	}
} 

function scoreSubmit() {
	if(confirm("등록하시겠습니까?")){
		return check2();
	}
} 

function rewrite() {
	return f.reset() ;
}

function inquire() {
	if(confirm("성적조회 화면으로 이동하시겠습니까?")){
		return location.href="selectScore.jsp";
	}
}