/**
 *  공정관리 프로그램용 js 파일
 */

function insertCheck() { // 작업공정등록 페이지 공정등록 버튼 유효성체크
	if (confirm("등록하시겠습니까?")) {
		if (!insertForm.w_workno.value) {
			alert("작업지시번호를 입력해주세요.")
			insertForm.w_workno.focus();
			return;
		}
		if (!insertForm.p_p1[0].checked && !insertForm.p_p1[1].checked) {
			alert("재료준비현황을 선택해주세요.")
			return;
		}
		if (!insertForm.p_p2[0].checked && !insertForm.p_p2[1].checked) {
			alert("인쇄공정현황을 선택해주세요.")
			return;
		}
		if (!insertForm.p_p3[0].checked && !insertForm.p_p3[1].checked) {
			alert("코팅공정현황을 선택해주세요.")
			return;
		}
		if (!insertForm.p_p4[0].checked && !insertForm.p_p4[1].checked) {
			alert("합지공정현황을 선택해주세요.")
			return;
		}
		if (!insertForm.p_p5[0].checked && !insertForm.p_p5[1].checked) {
			alert("접합공정현황을 선택해주세요.")
			return;
		}

		if (!insertForm.p_p6[0].checked && !insertForm.p_p6[1].checked) {
			alert("포장적재현황을 선택해주세요.")
			return;
		}
		if (!insertForm.w_lastdate.value) {
			alert("최종작업일자를 입력해주세요.")
			insertForm.w_lastdate.focus();
			return;
		}
		if (!insertForm.w_lasttime.value) {
			alert("최종작업시간을 입력해주세요.")
			insertForm.w_lasttime.focus();
			return;
		}

		insertForm.submit();
	} else {
		history.back();
	}
}

function updateCheck(insertForm) { // 작업공정등록 페이지 공정수정 버튼 유효성체크 등록 + form action 경로 변경
	if (confirm("수정하시겠습니까?")) {
		if (!insertForm.w_workno.value) {
			alert("작업지시번호를 입력해주세요1.")
			insertForm.w_workno.focus();
			return;
		}
		if (!insertForm.p_p1[0].checked && !insertForm.p_p1[1].checked) {
			alert("재료준비현황을 선택해주세요.")
			return;
		}
		if (!insertForm.p_p2[0].checked && !insertForm.p_p2[1].checked) {
			alert("인쇄공정현황을 선택해주세요.")
			return;
		}
		if (!insertForm.p_p3[0].checked && !insertForm.p_p3[1].checked) {
			alert("코팅공정현황을 선택해주세요.")
			return;
		}
		if (!insertForm.p_p4[0].checked && !insertForm.p_p4[1].checked) {
			alert("합지공정현황을 선택해주세요.")
			return;
		}
		if (!insertForm.p_p5[0].checked && !insertForm.p_p5[1].checked) {
			alert("접합공정현황을 선택해주세요.")
			return;
		}

		if (!insertForm.p_p6[0].checked && !insertForm.p_p6[1].checked) {
			alert("포장적재현황을 선택해주세요.")
			return;
		}
		if (!insertForm.w_lastdate.value) {
			alert("최종작업일자를 입력해주세요.")
			insertForm.w_lastdate.focus();
			return;
		}
		if (!insertForm.w_lasttime.value) {
			alert("최종작업시간을 입력해주세요.")
			insertForm.w_lasttime.focus();
			return;
		}

		insertForm.action = "updateProcessPro.jsp";
		insertForm.submit();

	} else {
		history.back();
	}

}

/* rewrite로 이름 넣어두면 펑션 작동안됨 어디선가 내장객체로 사용하는거 같음*/
function rewrite1() { 
	if(confirm("다시쓰겠습니까?")){
		alert("다시 작성합니다.");
		insertForm.reset();
		return;
	}else {
		return;
	}
}
