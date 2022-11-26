<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화관 회원&amp;예매 관리 프로그램</title>
<script type="text/javascript">
	//유효성 검사
	function check() {
		// 아이디와 패스워드 값 데이터 정규화 공식
		const regIdPass = /^[a-zA-Z0-9]{3,12}$/; // 반드시 슬래시(/)로 시작
		
		// 이름 정규화 공식
		const regName = /^[가-힣a-zA-Z]{2,12}$/;
		
		// 전화번호 정규화 공식
		const regTel = /^\d{3}-\d{3,4}-\d{4}$/;
		
		// 회원 아이디 유효성 검사 - 정규화 공식 이용
		if(insertForm.me_id.value=="") { //if(!insertForm.me_id.value) {
			alert("아이디를 입력해주세요.");
			return insertForm.me_id.focus(); // 커서두기
			// 입력한 데이터를 검사하는 test(값) : 입력한 값이 정규화 데이터를 사용햇다면 true를 반환
		}else if(!regIdPass.test(insertForm.me_id.value)){
			alert("아이디는 3~12자의 영어 대소문자와 숫자로만 입력 가능합니다.");
			return insertForm.me_id.select(); // 블럭설정
		}
		
		// 회원 비밀번호 유효성 검사 - 정규화 공식 이용
		if(insertForm.me_pass.value=="") { //if(!insertForm.me_id.value) {
			alert("비밀번호를 입력해주세요.");
			return insertForm.me_id.focus(); // 커서두기
			// 입력한 데이터를 검사하는 test(값) : 입력한 값이 정규화 데이터를 사용햇다면 true를 반환
		}else if(!regIdPass.test(insertForm.me_pass.value)){
			alert("비밀번호는 3~12자의 영어 대소문자와 숫자로만 입력 가능합니다.");
			return insertForm.me_id.select(); // 블럭설정
		}
		
	/* 	if(!insertForm.me_pass.value) {
			alert("회원비밀번호를 입력해주세요.");
			return insertForm.me_pass.focus();
		} */
		if(!insertForm.me_name.value) {
			alert("회원이름을 입력해주세요.");
			return insertForm.me_name.focus();
		}
		if(insertForm.gender[0].checked == false && insertForm.gender[1].checked == false) {
			alert("성별을 입력해주세요.");
			return;
		}
		if(!insertForm.birth.value) {
			alert("생년월일을 입력해주세요.");
			return insertForm.birth.focus();
		}
		if(!insertForm.address.value) {
			alert("주소를 입력해주세요.");
			return insertForm.address.focus();
		}
		if(!insertForm.tel.value) {
			alert("전화번호를 입력해주세요.");
			return insertForm.tel.focus();
		}
		
		insertForm.submit(); //폼 제출
	}
	
	//다시 쓰기
	function reWrite() {
		insertForm.reset();
	}
</script>
</head>
<body>
<%@ include file = "header.jsp" %>
	<section>
		<div>
			<h2>회원등록</h2>
		</div>
		<form action="insertMemberPro.jsp" method="post" name="insertForm">
			<table border="1" width="450">
				<tr>
					<th>회원아이디</th>
					<td>
						<label>
							<input type="text" name="me_id" value="" maxlength="12" size="20">
						</label>
					</td>
				</tr>
				<tr>
					<th>회원비밀번호</th>
					<td>
						<label>
							<input type="password" name="me_pass" value="" maxlength="15" size="20">
						</label>
					</td>
				</tr>
				<tr>
					<th>회원이름</th>
					<td>
						<label>
							<input type="text" name="me_name" value="" maxlength="20" size="20">
						</label>
					</td>
				</tr>
				<tr>
					<th>성별</th>
					<td>
						&nbsp;&nbsp;<label><input type="radio" name="gender" value="M">남자</label>
						&nbsp;&nbsp;<label><input type="radio" name="gender" value="F">여자</label>
						
					</td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td>
						<label>
							<input type="text" name="birth" value="" size="20">
						</label>
					</td>
				</tr>
				<tr>
					<th>주소</th>
					<td>
						<label>
							<input type="text" name="address" value="" maxlength="100" size="20">
						</label>
					</td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td>
						<label>
							<input type="text" name="tel" value="" maxlength="13" size="20">
						</label>
					</td>
				</tr>
				<tr>
					<th colspan="2">
						<input type="button" onclick="check();" value="회원등록">
						<input type="button" onclick="reWrite();" value="다시쓰기">
					</th>
				</tr>
			</table>
		</form>
	</section>
<%@ include file = "footer.jsp" %>
</body>
</html>