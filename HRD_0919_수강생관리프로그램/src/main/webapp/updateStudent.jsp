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
<%	String student_no = request.getParameter("student_no");

	sql = "select student_no , student_name , student_addr , student_phone , ";
	sql += " to_char(student_birth, 'yyyy/mm/dd') ,";
	sql += " student_email , student_id , student_pw ";
	sql += " from student_tbl_01 where student_no ='"+student_no+"'";
	
	rs = stmt.executeQuery(sql);
	rs.next();
	%>

	<section>
		<div><h2>수강생 등록</h2></div>
		<form action="insertStudentPro.jsp" name="f" method="post">
		<table id="insertTable">
			<input type="hidden" name="student_no" value="<%=rs.getString(1) %>">
			<tr>
				<th>이름</th>
				<td>
					<input type="text" name="student_name" value="<%=rs.getString(2)==null?"":rs.getString(2) %>" size="20" maxlength="20">
				</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>
					<input type="text" name="student_addr" value="<%=rs.getString(3)==null?"":rs.getString(3) %>" size="40" maxlength="100">
				</td>
			</tr>
			<tr>
				<th>연락처</th>
				<td>
					<input type="tel" name="student_phone" value="<%=rs.getString(4)==null?"":rs.getString(4) %>" size="20" maxlength="14">
				</td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td>
					<input type="date" name="student_birth" value="<%=rs.getString(5)==null?"":rs.getString(5) %>" size="20" >
				</td>
			</tr>
			<tr>
				<th>메일주소</th>
				<td>
					<input type="text" name="student_email" value="<%=rs.getString(6)==null?"":rs.getString(6) %>" size="20" maxlength="50">@
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
					<input type="text" name="student_id" value="<%=rs.getString(7)==null?"":rs.getString(7) %>" size="20" maxlength="12">
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td>
					<input type="password" name="student_pw" value="<%=rs.getString(8)==null?"":rs.getString(8) %>" size="20" maxlength="50">
				</td>
			</tr>
		</table>
		<div class="buttonZone">	
		<input type="submit" value="수정" onclick="insertStudent(); return false;">
		<input type="button" value="조회" onclick="inquire();">	
		</div>
		</form>
	</section>
<%@include file="footer.jsp" %>
</body>
</html>