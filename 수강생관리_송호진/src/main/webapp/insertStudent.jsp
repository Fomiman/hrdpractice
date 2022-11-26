<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수강생관리 프로그램</title>
<script type="text/javascript">
	//유효성 체크 (이름, 연락처, 생년월일)
	function check() {
		if(!f.student_name.value) {
			alert("수강생명이 입력되지 않았습니다.");
			return f.student_name.focus();
		}
		if(!f.student_phone.value) {
			alert("연럭처가 입력되지 않았습니다.");
			return f.student_phone.focus();
		}
		if(!f.student_birth.value) {
			alert("생년월일이 입력되지 않았습니다.");
			return f.student_birth.focus();
		}
		
		//유효성 검사에서 이메일 제외 (입력되지 않았을 때 처리하는 부분이 필요함)
		f.submit();
	}
</script>
</head>
<body>
<%@ include file = "header.jsp" %>
	<section>
		<div>
			<h2>수강생 등록</h2>
		</div>
		<%
		/* 방법1 : 수강생 등록을 하려면 PK키의 값(=수강생 번호)이 있어야 하므로 */
		/* sql = "select MAX(NVL(student_no, 201800)) + 1 from student_tbl_01";
			
		ps = con.prepareStatement(sql);
		rs = ps.executeQuery();
		
		rs.next();
		String student_no = rs.getString(1);
		 */
		
		%>
		<form action="insertStudentPro.jsp" name="f">
			<%-- <input type="hidden" value="<%=student_no%>" name="student_no" readonly> --%> <!-- 수강생번호 자동입력 [방법-1] -->
			<table width="600" border="1">
			
				<tr>
					<th>이름</th>
					<td>
						<input type="text" value="" name="student_name" maxlength="20" size="25">
					</td>
				</tr>
				<tr>
					<th>주소</th>
					<td>
						<input type="text" value="" name="student_addr" maxlength="100" size="70">
					</td>
				</tr>
				<tr>
					<th>연락처</th>
					<td>
						<input type="text" value="" name="student_phone" maxlength="14" size="25">
					</td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td>
						<input type="text" value="" name="student_birth" size="25">
					</td>
				</tr>
				<tr>
					<th>메일주소</th> <!-- 메일주소 입력안할 시 빈 칸 처리 -->
					<td>
						<input type="text" value="" name="student_email" maxlength="50" size="25">@
						<select name = "student_email_sub">
							<option value="naver.com">naver.com</option>
							<option value="chol.net">chol.net</option>
							<option value="hanmail.net">hanmail.net</option>
							<option value="gmail.com">gmail.com</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>아디</th>
					<td>
						<input type="text" value="" name="student_id" maxlength="12" size="25">
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td>
						<input type="password" value="" name="student_pw" maxlength="50" size="25">
					</td>
				</tr>
				<tr>
					<th colspan="2">
						<input type="button" value="등록" onclick="check();">
						<input type="button" value="조회" onclick="location.href='selectStudent.jsp';">
					</th>
				</tr>
			</table>
		</form>
	</section>
<%@ include file = "footer.jsp" %>
</body>
</html>