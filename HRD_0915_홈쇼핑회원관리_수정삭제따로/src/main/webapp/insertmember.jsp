<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>홈쇼핑 회원관리</title>
</head>
<!-- <script type="text/javascript" src="check.js">
	
</script> -->
 <script type="text/javascript">
	//유효성 검사
	function check() {
		if (f.custno.value == null) {
			alert("회원번호를 입력해주세요");
			return f.custno.focus();
		}
		if (!f.custname.value) {
			alert("회원이름를 입력해주세요");
			return f.custname.focus();
		}
		if (!f.phone.value) {
			alert("회원전화를 입력해주세요");
			return f.phone.focus();
		}
		if (!f.address.value) {
			alert("회원주소를 입력해주세요");
			return f.address.focus();
		}
		if (!f.joindate.value) {
			alert("가입일자를 입력해주세요");
			return f.joindate.focus();
		}
		/* if (!f.grade.value) {
			alert("회원등급을 입력해주세요");
			return f.grade.focus();
		} */
		//if (!(f.grade.value.toUpperCase() == "A" || f.grade.value.toUpperCase() == "B" || f.grade.value.toUpperCase() == "C" )) {
		//	alert("고객등급이 잘못 입력되었습니다.");
		//	return f.grade.focus();
		// if (!(f.grade.value == "A" || f.grade.value == "B" || f.grade.value == "C" || f.grade.value == "a" || f.grade.value == "b" || f.grade.value == "c")) {
		//	alert("고객등급이 잘못 입력되었습니다.");
		//	return f.grade.focus();
		//	}
		const gradeLimit = ['A','B','C']; //회원등급
		if(gradeLimit.indexOf(f.grade.value.toUpperCase()) == -1){
			alert("회원등급이 잘못 입력되었습니다.");
			return f.grade.select();
		}
		
		
		if (!f.city.value) {
			alert("도시코드를 입력해주세요");
			return f.city.focus();
		}
		
		f.submit();
	}//check() end
</script> 

<body>
	<%@ include file="header.jsp"%>
	<%
	/* sql = "select NVL(max(custno),0)+1 from member_tbl_02";
	rs = stmt.executeQuery(sql);
	rs.next();
	String custno = rs.getString(1);

	sql = "select to_char(sysdate , 'yyyy-mm-dd') as joindate from dual";
	rs = stmt.executeQuery(sql);
	rs.next();
	String joindate = rs.getString(1); */

	sql = "select NVL(max(custno),0)+1 ,to_char(sysdate , 'yyyy-mm-dd') as joindate from member_tbl_02";
	rs = stmt.executeQuery(sql);
	rs.next();
	String custno = rs.getString(1);
	String joindate = rs.getString("joindate");
	%>
	<section>
		<div>
			<h2>홈쇼핑 회원등록</h2>
		</div>
		<form action="insertPro.jsp" name="f" method="post">
			<table id="inserttable">
				<tr>
					<th>회원번호(자동발생)</th>
					<td>
						<%-- <%='변수' 또는 '리턴값이 있는 메서드' 또는 '수식(변수 또는 리턴값이 있는 메서드를 포함할 수 있음)' --%>
						<input type="text" name="custno" value="<%=custno%>" size="10"
						maxlength="6" readonly="readonly">
					</td>
				</tr>
				<tr>
					<th>회원성명</th>
					<td><input type="text" name="custname" value="" size="10"
						maxlength="20"></td>
				</tr>
				<tr>
					<th>회원전화</th>
					<td><input type="text" name="phone" value="" size="13"
						maxlength="13"></td>
				</tr>
				<tr>
					<th>회원주소</th>
					<td><input type="text" name="address" value="" size="20"
						maxlength="60"></td>
				</tr>
				<tr>
					<th>가입일자</th>
					<td><input type="date" name="joindate" value="<%=joindate%>"
						size="10" readonly="readonly"></td>
				</tr>
				<tr>
					<th>고객등급(A:VIP,B:일반,C:직원)</th>
					<td><input type="text" name="grade" value="" size="10"
						maxlength="1"></td>
				</tr>
				<tr>
					<th>도시코드</th>
					<td>
						<input type="text" name="city" value="" size="10" maxlength="2">
					</td>
				</tr>
				<tr>
					<th colspan="2">
						<input type="submit" value="등록" onclick="check(); return false;">
						<input type="reset" value="다시쓰기">
						<a href="selectmemberlist.jsp">
							<input type="button" value="조회">
						</a>
					</th>
				</tr>
			</table>
		</form>
	</section>
	<%@ include file="footer.jsp"%>
</body>
</html>