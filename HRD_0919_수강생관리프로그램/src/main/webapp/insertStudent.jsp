<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수강생 등록</title>
</head>
<body>
<%@include file="header.jsp" %>
<%
	sql = "select nvl(max(student_no),0)+1 from STUDENT_TBL_01";
	rs = stmt.executeQuery(sql);
	rs.next();
	%>

	<section>
		<div><h2>수강생 등록</h2></div>
		<form action="insertStudentPro.jsp" name="f" method="post">
		<table id="insertStudentTable">
			<input type="hidden" name="student_no" value="<%=rs.getString(1) %>">
			<!-- 수강생번호 입력받지 않고 보이지도 않게 자동,순차적으로 설정되어 부여됨 -->
			<tr>
				<th>이름</th>
				<td>
					<input type="text" name="student_name" value="" size="20" maxlength="20">
				</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>
					<input type="text" name="student_addr" value="" size="40" maxlength="100">
				</td>
			</tr>
			<tr>
				<th>연락처</th>
				<td>
					<input type="tel" name="student_phone" value="" size="20" maxlength="14">
				</td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td>
					<input type="text" name="student_birth" value="" size="20" >
				</td>
			</tr>
			<tr>
				<th>메일주소</th>
				<td>
					<input type="email" name="student_email" value="" size="20" maxlength="50">@
					<select name="emailAddr">
						<option value="@naver.com">naver.com</option>
						<option value="@gmail.com">gmail.com</option>
						<option value="@daum.net">daum.net</option>
						<option value="@chol.net">chol.net</option>
					</select> 
				</td>
			</tr>
			<tr>
				<th>아이디</th>
				<td>
					<input type="text" name="student_id" value="" size="20" maxlength="12">
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td>
					<input type="password" name="student_pw" value="" size="20" maxlength="50">
				</td>
			</tr>
		</table>	
		<div class="buttonZone">
			<input type="submit" value="등록" onclick="insertStudent(); return false;">
			<input type="button" value="조회" onclick="inquire();">	
		</div>
		</form>
	</section>
<%@include file="footer.jsp" %>
</body>
</html>