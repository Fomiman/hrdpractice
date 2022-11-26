<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고교성적관리 프로그램</title>
</head>
<script type="text/javascript">
function check() {
	if (!f.syear.value){
		alert("학년을 입력해주세요.");
		return f.syear.focus();
	}
	if (!f.sclass.value){
		alert("반을 입력해주세요.");
		return f.sclass.focus();
	}
	if (!f.sno.value){
		alert("학생번호를 입력해주세요.");
		return f.sno.focus();
	}
	if (!f.kor.value){
		alert("국어점수를 입력해주세요.");
		return f.kor.focus();
	}
	if (!f.eng.value){
		alert("영어점수를 입력해주세요.");
		return f.eng.focus();
	}
	
	if (!f.math.value){
		alert("수학점수를 입력해주세요.");
		return f.math.focus();
	}
	
	f.submit();
}
</script>

<body>
	<%@ include file="header.jsp"%>
	<!-- dbconn.jsp(DB 연결) + style.css -->
	<section>
		<div >
			<h2>성적등록</h2>
		</div>
		
		<form action="insertPro2.jsp" method="post" name="f">
			<table id="insert2table">
				<tr>
					<th>학년</th>
					<td><input type="text" name="syear" value="" size="10" maxlength="1">(예)1</td>
				</tr>
				<tr>
					<th>반</th>
					<td><input type="text" name="sclass" value=""  size="10" maxlength="2">(예)01</td>
				</tr>
				<tr>
					<th>번호</th>
					<td><input type="text" name="sno" value="" size="10" maxlength="2">(예)01</td>
				</tr>
				<tr>
					<th>국어점수</th>
					<td><input type="text" name="kor" value="" size="10" maxlength="3">성적범위(0~100)</td>
				</tr>
				<tr>
					<th>영어점수</th>
					<td><input type="text" name="eng" value="" size="10" maxlength="3">성적범위(0~100)</td>
				</tr>
				<tr>
					<th>수학점수</th>
					<td><input type="text" name="math" value="" size="10" maxlength="3">성적범위(0~100)</td>
				</tr>
				
			<tr>
				<th colspan="2">
					<input type="submit" value="성적등록" onclick="chech(); return false;">
					<input type="reset" value="다시쓰기">
				</th>
			</tr>
			</table>
		</form>
		
	</section>
	<%@ include file="footer.jsp"%>
	<!-- DB 연결 해제 -->
</body>
</html>