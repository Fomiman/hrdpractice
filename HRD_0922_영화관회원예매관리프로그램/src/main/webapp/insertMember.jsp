<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="header.jsp" %>
	<section>
		<div>
			<h2>회원등록</h2>
		</div>
		
		<form action="insertMemberPro.jsp" name="f" method="post">
		
			<table width="400px"> <!-- 모든 항목 유효성체크 -->
				<tr>
					<th>회원아이디</th>
					<td>
						<input type="text" name="me_id" value="" size="20" maxlength="12">
					</td>
				</tr>
				<tr>
					<th>회원비밀번호</th>
					<td><input type="text" name="me_pass" value="" size="20" maxlength="15"></td>
				</tr>
				<tr>
					<th>회원이름</th>
					<td><input type="text" name="me_name" value="" size="20" maxlength="20"></td>
				</tr>
				<tr>
					<th>성별</th>
					<td>
					<label><input type="radio" name="gender" value="M">남자</label>
					<label><input type="radio" name="gender" value="F">여자</label>
					</td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td><input type="text" name="birth" value="" size="20" ></td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input type="text" name="address" value="" size="20" maxlength="100"></td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td><input type="text" name="tel" value="" size="20" maxlength="13"></td>
				</tr>
				<tr>
					<td colspan="2" class="buttonBox">
						<input type="submit" name="submitButton" value="회원등록" onclick="insertMember(); return false;">
						<input type="reset" name="rewrite" value="다시쓰기" onclick="rewrite();">
					</td>
				</tr>
			</table>
		
		</form>
		
	</section>
<%@ include file="footer.jsp" %>
</body>
</html>