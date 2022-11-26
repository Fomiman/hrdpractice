<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑몰 회원 관리</title>
<script type="text/javascript">
	//유효성 체크
	function check() {
		if(!f.custno.value) {
			alert("회원번호가 입력되지 않았습니다.");
			return f.custno.focus();
		}
		if(!f.custname.value) {
			alert("회원성명이 입력되지 않았습니다.");
			return f.custname.focus();
		}
		if(!f.phone.value) {
			alert("회원전화가 입력되지 않았습니다.");
			return f.phone.focus();
		}
		if(!f.address.value) {
			alert("회원주소가 입력되지 않았습니다.");
			return f.address.focus();
		}
		if(!f.joindate.value) {
			alert("가입일자가 입력되지 않았습니다.");
			return f.joindate.focus();
		}
		
		const gradeLimit = ["A", "B", "C"];		//회원등급
		
		if(gradeLimit.indexOf(f.grade.value.toUpperCase()) == -1) {	//지정된 회원등급으로 입력하지 않은 경우
			alert("회원등급이 정상적으로 입력되지 않았습니다.");
			return f.grade.focus();
		}
		
		if(!f.city.value) {
			alert("도시코드가 입력되지 않았습니다.");
			return f.city.focus();
		}
		
		f.submit(); //모두 입력됐다면 submit함
	}
	
	function deleteCheck() {
		if(f.custno.value == ""){
			alert('회원번호가 입력되지 않았습니다.');
			return f.custno.focus();
		}
		if(confirm("이 회원을 삭제하시겠습니까?")) {
			// location.href = "deletePro.jsp?custno=" + f.custno.value; // [방법-1]
			f.action = "deletePro_hojin.jsp";
			f.submit();
		}else return ;
		
	}
</script>
</head>
<body>
	<%@ include file = "header.jsp" %>
	<%
	
	String custno = request.getParameter("custno"); //get방식으로 날아온 custno값 읽음
	
	sql = "select custname, phone, address, TO_CHAR(joindate, 'yyyy-mm-dd'), grade, city";
	sql += " from member_tbl_02";
	sql += " where custno = ?";
	
	ps = con.prepareStatement(sql);
	ps.setString(1, custno);
	rs = ps.executeQuery();
	rs.next();
	
	
	%>
	<section>
		<div>
		<h2>홈쇼핑 회원 정보 수정/삭제</h2>
		</div>
		
		<form action="updatePro_hojin.jsp" method="post" name="f">
			<table width="600" border="1">
				<tr>
					<th>회원번호</th>
					<td><input type="text" name="custno" size="10" value="<%=custno%>" readonly></td>
				</tr>
				<tr>
					<th>회원성명</th>
					<td><input type="text" name="custname" size="10" value="<%=rs.getString(1)%>" maxlength="20"></td>
				</tr>
				<tr>
					<th>회원전화</th>
					<td><input type="text" name="phone" size="20" value="<%=rs.getString(2)%>" maxlength="13"></td>
				</tr>
				<tr>
					<th>회원주소</th>
					<td><input type="text" name="address" size="25" value="<%=rs.getString(3)%>" maxlength="60"></td>
				</tr>
				<tr>
					<th>가입일자</th>
					<td><input type="text" name="joindate" size="10" value="<%=rs.getString(4)%>" readonly></td>
				</tr>
				<tr>
					<th>고객등급[A:VIP,B:일반,C:직원]</th>
					<td><input type="text" name="grade" size="10" value="<%=rs.getString(5)%>" maxlength="1"></td>
				</tr>
				<tr>
					<th>도시코드</th>
					<td><input type="text" name="city" size="10" value="<%=rs.getString(6)%>" maxlength="2"></td>
				</tr>
				<tr>
					<th colspan="2">
						<input type="submit" value="수 정" onclick="check(); return false;">
						<input type="button" value="조 회" onclick="location.href = 'select_hojin.jsp';">
						<input type="reset" value="다시쓰기">
						<input type="button" value="삭 제" onclick="deleteCheck();">
					</th>
				</tr>
			</table>
		</form>
	</section>

<%@ include file = "footer.jsp" %>
</body>
</html>