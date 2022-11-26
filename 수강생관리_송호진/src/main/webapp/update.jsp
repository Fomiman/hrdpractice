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
		
		f.submit();
	}
	
</script>
</head>
<body>
<%@ include file = "header.jsp" %>
	<section>
		<div>
			<h2>수강생 수정</h2>
		</div>
		<%
		String student_no = request.getParameter("student_no");
		
		sql = "select student_name, student_addr, student_phone,";
		sql += " to_char(student_birth, 'yymmdd') as student_birth, student_email, student_id, student_pw";
		sql += " from STUDENT_TBL_01";
		sql += " where student_no = ?";
	
		ps = con.prepareStatement(sql);
		
		ps.setString(1, student_no);
		
		rs = ps.executeQuery();
		
		rs.next();
		
		String student_email = null;
		String student_email_sub = "";
		
		if(rs.getString("student_email") != null) { //메일주소를 입력한 경우(null이 아닌 경우)
			student_email = rs.getString("student_email").split("@")[0]; //@를 중심으로 앞 뒤를 나눠서 앞에거만 출력되게
			student_email_sub = rs.getString("student_email").split("@")[1];
		}
		%>
		<form action="updateStudentPro.jsp" name="f">
			<input type="hidden" value="<%=student_no%>" name="student_no" readonly>
			<table width="600" border="1">
			
				<tr>
					<th>이름</th>
					<td>
						<input type="text" value="<%=rs.getString("student_name")%>" name="student_name" maxlength="20" size="25">
					</td>
				</tr>
				<tr>
					<th>주소</th>
					<td>
						<input type="text" value="<%=rs.getString("student_addr") == null ? "" : rs.getString("student_addr")%>" name="student_addr" maxlength="100" size="70">
					</td>
				</tr>
				<tr>
					<th>연락처</th>
					<td>
						<input type="text" value="<%=rs.getString("student_phone")%>" name="student_phone" maxlength="14" size="25">
					</td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td>
						<input type="text" value="<%=rs.getString("student_birth")%>" name="student_birth" size="25">
					</td>
				</tr>
				<tr>
					<th>메일주소</th> <!-- 메일주소 입력안했을 경우 빈 칸 처리 -->
					<td>
						<input type="text" value="<%=student_email == null ? "" : student_email%>" name="student_email" maxlength="50" size="25">@
						<select name = "student_email_sub">		
							<option <%=student_email_sub.equals("naver.com") ? "selected" : "" %> value="naver.com">naver.com</option>
							<option <%=student_email_sub.equals("chol.net") ? "selected" : "" %> value="chol.net">chol.net</option>
							<option <%=student_email_sub.equals("hanmail.net") ? "selected" : "" %> value="hanmail.net">hanmail.net</option>
							<option <%=student_email_sub.equals("gmail.com") ? "selected" : "" %> value="gmail.com">gmail.com</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>아디</th>
					<td>
						<input type="text" value="<%=rs.getString("student_id") == null ? "" : rs.getString("student_id")%>" name="student_id" maxlength="12" size="25">
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td>
						<input type="password" value="<%=rs.getString("student_pw") == null ? "" : rs.getString("student_pw")%>" name="student_pw" maxlength="50" size="25">
					</td>
				</tr>
				<tr>
					<th colspan="2">
						<input type="button" value="수정" onclick="check();">
						<input type="button" value="조회" onclick="location.href='selectStudent.jsp';">
					</th>
				</tr>
			</table>
		</form>
	</section>
<%@ include file = "footer.jsp" %>
</body>
</html>