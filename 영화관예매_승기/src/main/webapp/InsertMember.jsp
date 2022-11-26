<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<%@include file="Header.jsp" %>
	<section>
		<h1>회원등록</h1>
		<form action="InsertMemberPro.jsp" name="f" method="post">
			<table>
				<tr>
					<th>회원아이디</th>
					<td><input name = me_id size="20" maxlength="12"></td>
				</tr>
				<tr>
					<th>회원비밀번호</th>
					<td><input type="password" name = me_pass size="20" maxlength="15"></td>
				</tr>
				<tr>
					<th>회원이름</th>
					<td><input name = me_name size="20" maxlength="20"></td>
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
					<td><input name = birth size="20"></td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input name = address size="20" maxlength="100"></td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td><input name = tel size="20" maxlength="13"></td>
				</tr>
				<tr>
					<th colspan="2">
						<button type="button" onclick="checkMember();">회원등록</button>
						<button type="reset" >다시쓰기</button>
					</th>
				</tr>
			</table>
		</form>
		
	</section>
	<%@include file="Footer.jsp" %>
</body>
</html>