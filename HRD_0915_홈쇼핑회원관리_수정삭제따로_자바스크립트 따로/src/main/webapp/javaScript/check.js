//유효성 검사
	
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
		
		const gradeLimit = ["A", "B", "C"];		//회원등급
		
		if(gradeLimit.indexOf(f.grade.value.toUpperCase()) == -1) {	//지정된 회원등급으로 입력하지 않은 경우
			alert("회원등급이 정상적으로 입력되지 않았습니다.");
			return f.grade.focus();
		}
		
		if(!f.city.value) {
			alert("도시코드가 입력되지 않았습니다.");
			return f.city.focus();
		}
		
		f.submit(); //모두 입력됐다면 submit함
	}
	
	function updateCheck() {
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
		
		const gradeLimit = ["A", "B", "C"];		//회원등급	//const == final
		if(gradeLimit.indexOf(f.grade.value.toUpperCase()) == -1) {	//지정된 회원등급으로 입력하지 않은 경우
			alert("회원등급이 정상적으로 입력되지 않았습니다.");
			return f.grade.focus();
		}
		
		if(!f.city.value) {
			alert("도시코드가 입력되지 않았습니다.");
			return f.city.focus();
		}
		
		//f.action = "updatePro.jsp"; // [따로 방법 -2]
		
		f.pro1.value = "수정"; // [함께 방법-1]
		
		f.submit(); //모두 입력됐다면 submit함
	}
	
	function deleteCheck() {
		if(f.custno.value == ""){
			alert('회원번호가 입력되지 않았습니다.');
			return f.custno.focus();
		}
		if(confirm("이 회원을 삭제하시겠습니까?")) {
			// location.href = "deletePro.jsp?custno=" + f.custno.value; // [방법-1]
			f.action = "deletePro.jsp";
			f.submit();
		}else return ;
		
	}
	
	//[함께 : 방법-1]
	function updateDeleteCheck(btnId) {
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
		
		const gradeLimit = ["A", "B", "C"];		//회원등급
		
		if(gradeLimit.indexOf(f.grade.value.toUpperCase()) == -1) {	//지정된 회원등급으로 입력하지 않은 경우
			alert("회원등급이 정상적으로 입력되지 않았습니다.");
			return f.grade.focus();
		}
		
		if(!f.city.value) {
			alert("도시코드가 입력되지 않았습니다.");
			return f.city.focus();
		}
		
		if(btnId == "update"){
			if(confirm("회원정보를 수정하시겠습니까?")){ // confirm => 창하나 새로뜨고 뭘 누르는지에 따라 true, false리턴
				f.pro2.value ="수정";
			}else return;
			
		}else if(btnId == "delete"){
			if(confirm("회원정보를 삭제하시겠습니까?")){
				f.pro2.value ="삭제";
			}else return;
		}
		
		//f.action = "";
		
		f.submit(); //모두 입력됐다면 submit함
	}