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
		
		if(!f.register_seq.value) {
			alert("수강신청번호가 입력되지 않았습니다.");
			return;
		}
		if(!f.student_no.value) {
			alert("수강생번호가 입력되지 않았습니다.");
			return f.student_no.focus();
		}
		if(!f.subject_seq.value) {
			alert("수강과목이 입력되지 않았습니다.");
			return;
		}
		if(!f.register_date.value) {
			alert("신청일자가 입력되지 않았습니다.");
			return f.register_date.focus();
		}
		if(!f.register_status.value) {
			alert("수강상태가 입력되지 않았습니다.");
			return;
		}
		
		f.submit();
	}
</script>
</head>
<body>
<%@ include file = "header.jsp" %> <!-- 이 구문 뒤에서 SQL 관련 구문 사용가능 -->
	<section>
		<div>
			<h2>수강신청</h2>
		</div>
		<%
		sql = "select MAX(NVL(register_seq, 0)) + 1, to_char(sysdate, 'yyyy/mm/dd') from register_tbl_01 ";
			
		ps = con.prepareStatement(sql);
		rs = ps.executeQuery();
		
		rs.next(); //결과셋 다음 행 이동
		String register_seq = rs.getString(1);
		String register_date = rs.getString(2);
		
		%>
		<form action="insertRegisterPro.jsp" name="f">
			<input type="hidden" value="<%=register_seq%>" name="register_seq" readonly>
			<table width="600" border="1">
			
				<tr>
					<th>수강생번호</th>
					<td>
						<input type="text" value="" name="student_no" maxlength="20" size="25">
					</td>
				</tr>
				<tr>
					<th>신청과목</th>
					<td>
						<select name = "subject_seq">
							<option value="">수강과목</option>
							<%
							sql = "select subject_seq, subject_name";
							sql += " from subject_tbl_01";
							
							ps = con.prepareStatement(sql);
							rs = ps.executeQuery();
							
							while(rs.next()) { %>
							<option value="<%=rs.getString(1)%>"><%=rs.getString(2)%></option>
							<!-- <option value="C001">자바프로그래밍</option> -->
							<%} %>
						</select>
					</td>
				</tr>
				<tr>
					<th>신청일자</th>
					<td>
						<input type="text" value="<%=register_date%>" name="register_date" maxlength="14" size="25" readonly>
					</td>
				</tr>
				<tr>
					<th>수강상태</th>
					<td>
						<select name = "register_status">
							<option value="0" selected>신청</option>
							<option value="1">완료</option>
							<option value="2">취소</option>
						</select>
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