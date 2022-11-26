<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>InsertStudent</title>
</head>
<script type="text/javascript" src="./script/function.js">
</script>
<body>
	<%@ include file="header.jsp"%>
	<%
		sql = "";
		sql += "select NVL(max(studno),0)+1 nvl(min(syear),01) as syear from student_tbl";
		rs = stmt.executeQuery(sql);
		rs.next();
		String studno = rs.getString(1);
		// int studno = rs.getInt(1); // int로 받아도 되지만 String으로 빠르게 처리함
		String syear = rs.getString(2);
	%>
	<section>
		<form action="insertStudentPro.jsp" name="f" method="post">
			<div>
				<h2>학생등록</h2>
			</div>
			
			<table id="insertStudentTable">
				<tr>
					<th>학번</th>
					<td><!-- type="number"로 해도 무방함(모든 웹브라우저에서 지원함) html5에서 새롭게 추가된 속성값 
							※ request.getParameter("studno"); 리턴값은 무조건 String임 => number던 text던 상관없다 -->
					<input type="text" name="studno" value="<%=studno %>" size="20" readonly="readonly">(자동생성)</td>
				</tr>
				<tr>
					<th>학년</th>
					<td><input type="text" name="syear" value="<%=syear %>" size="20" readonly="readonly">(자동입력)</td>
				</tr>
				<tr>
					<th>학생이름</th>
					<td><input type="text" name="sname" value="" size="30" maxlength="20"></td>
				</tr>
				<tr>
					<th>학생주소</th>
					<td><input type="text" name="address" value="" size="40" maxlength="100"></td>
				</tr>
				<tr>
					<th>학생성별</th>
					<td>
					<label><input type="radio" name="gender" value="M">남자</label>
					<label><input type="radio" name="gender" value="F">여자</label>
					</td>

				</tr>
				<tr>
					<th>전화번호</th>
					<td><input type="text" name="tel" value="" size="30" maxlength="13"></td>
				</tr>
				<tr>
					<th>주민번호</th>
					<td><input type="text" name="idnum" value="" size="30" maxlength="14">(예)000000-0000000</td>
				</tr>
				<tr align="center">
					<td colspan="2">
						<input type="submit" name="submit" class="button1" value="학생등록" onclick="insertSubmit(); return false;"> 
						<!-- <input type="button" name="submit" class="button1" value="학생등록" onclick="insertSubmit();">  -->
						<input type="button" name="reset" class="button1" value="다시쓰기" onclick="rewrite();">
					</td>
				</tr>
			</table>
		</form>
	</section>
	<%@ include file="footer.jsp"%>
</body>
</html>