<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>InsertScore</title>
</head>
<script type="text/javascript" src="function.js"></script>
<body>
	<%@ include file="header.jsp"%>
	
	<section>
		<form action="insertScorePro.jsp" name="f" method="post">
			<div>
				<h2>성적등록</h2>
			</div>
			
			<table id="insertScoreTable">
				<tr>
					<th>학번</th>
					<td><input type="number" name="studno" value="" size="20"></td>
				</tr>
				<tr>
					<th>학년</th>
					<td><input type="text" name="syear" value="" size="20"></td>
				</tr>
				<tr>
					<th>전공1</th>
					<td><input type="text" name="m_subject1" value="" size="30" maxlength="20"></td>
				</tr>
				<tr>
					<th>전공2</th>
					<td><input type="text" name="m_subject2" value="" size="30" maxlength="20"></td>
				</tr>
				<tr>
					<th>전공3</th>
					<td><input type="text" name="m_subject3" value="" size="30" maxlength="20"></td>
				</tr>
				<tr>
					<th>교양1</th>
					<td><input type="text" name="s_subject1" value="" size="30" maxlength="20"></td>
				</tr>
				<tr>
					<th>교양2</th>
					<td><input type="text" name="s_subject2" value="" size="30" maxlength="20"></td>
				</tr>
				<tr align="center">
					<td colspan="2">
						<input type="submit" class="button1" value="성적등록" onclick="scoreSubmit(); return false;"> 
						<input type="button" class="button1" value="조회" onclick="inquire();">
					</td>
				</tr>
			</table>
		</form>
	</section>
	<%@ include file="footer.jsp"%>
</body>
</html>