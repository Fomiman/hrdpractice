//유효성 검사
	function check() {
		if (!f.custno.value) {
			alert("회원번호를 입력해주세요");
			return f.custno.focus();
		}
		if (!f.custname.value) {
			alert("회원이름를 입력해주세요");
			return f.custname.focus();
		}
		if (!f.phone.value) {
			alert("회원전화를 입력해주세요");
			return f.phone.focus();
		}
		if (!f.address.value) {
			alert("회원주소를 입력해주세요");
			return f.address.focus();
		}
		if (!f.joindate.value) {
			alert("가입일자를 입력해주세요");
			return f.joindate.focus();
		}
		if (!f.grade.value) {
			alert("고객등급을 입력해주세요");
			return f.grade.focus();
		}
		if (!(f.grade.value.toUpperCase() == "A" || f.grade.value.toUpperCase() == "B" || f.grade.value.toUpperCase() == "C" )) {
			alert("고객등급이 잘못 입력되었습니다.");
			return f.grade.focus();
		/* if (!(f.grade.value == "A" || f.grade.value == "B" || f.grade.value == "C" || f.grade.value == "a" || f.grade.value == "b" || f.grade.value == "c")) {
			alert("고객등급이 잘못 입력되었습니다.");
			return f.grade.focus();
		} */
		}
		if (!f.city.value) {
			alert("도시코드를 입력해주세요");
			return f.city.focus();
		}
		
		f.submit();
		
	}//check() end