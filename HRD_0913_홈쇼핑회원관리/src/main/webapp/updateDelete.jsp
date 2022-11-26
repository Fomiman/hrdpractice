<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑몰관리 프로그램</title>
</head>
<script type="text/javascript" src="check.js">
	
</script>
<script type="text/javascript">
<!-- //유효성 검사 - 값이 비어있는지
	function check2() {
		if (!f.custno.value) {
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
		if (!f.grade.value) {
			alert("고객등급을 입력해주세요");
			return f.grade.focus();
		}
		if (!(f.grade.value.toUpperCase() == "A" || f.grade.value.toUpperCase() == "B" || f.grade.value.toUpperCase() == "C" )) {
			alert("고객등급이 잘못 입력되었습니다.");
			return f.grade.focus();
		if (!f.city.value) {
			alert("도시코드를 입력해주세요");
			return f.city.focus();
		}
		
		f.submit();
	}//check() end
	 -->
	function reWrite() {
		var x = confirm("다시 쓰시겠습니까?"); // [확인]==true, [취소]==false
		if(x==true) f.reset();		
		//f.name.focus();
		f.name.select();
		
		//f.reset();  
		//f.name.focus(); //글자는 그대로 있고 커서 깜빡거림
		//f.name.select(); // 글자에 블럭 설정됨 -> 입력하면 바로 덮어쓰기
	}
</script>

<body>
	<%@ include file="header.jsp" %> <!-- dbcon.jsp(DB 연결) + style.css -->
	
	<% //회원번호로 회원 조회
	String custno = request.getParameter("custno"); // "100001"
	sql = "";
	sql += "select custno, custname, phone,address,";
	sql += "		TO_CHAR(joindate, 'yyyy-mm-dd') as joindate,";
	sql += "		GRADE,";
	sql += "		city";
	sql += "		from member_tbl_02 ";
	sql += "	where custno = "+custno;
	
	rs = stmt.executeQuery(sql);
	String custname = null;
	String phone = null;
	String address = null;
	String joindate = null;
	String grade = null;
	String city = null;
	
	if(rs.next()){
		custname = rs.getString("custname"); // custno는 위에서 파라미터 값으로 가져왔기때문에 가져올 필요가 없다.
		phone = rs.getString("phone");
		address = rs.getString("address");
		joindate = rs.getString("joindate");
		grade = rs.getString("grade");
		city = rs.getString("city");
	}
	
	%>
	
	<section>
		<div>
			<h2>회원수정/삭제</h2>
		</div>
		<form action="updatePro.jsp" name="f" method="post">
			<table class="updatetable">
				<tr>
					<th>회원번호</th>
					<td><input type="text" name="custno" value="<%=custno%>"
						size="10" maxlength="6" ></td>
				</tr>
				<tr>
					<th>회원성명</th>
					<td><input type="text" name="custname" value="<%=custname%>" size="10"
						maxlength="4"></td>
				</tr>
				<tr>
					<th>회원전화</th>
					<td><input type="text" name="phone" value="<%=phone%>" size="13"
						maxlength="13"></td>
				</tr>
				<tr>
					<th>회원주소</th>
					<td><input type="text" name="address" value="<%=address%>" size="25"
						maxlength="60"></td>
				</tr>
				<tr>
					<th>가입일자</th>
					<td><input type="date" name="joindate" value="<%=joindate%>" size="10">
					</td>
				</tr>
				<tr>
					<th>고객등급(A:VIP,B:일반,C:직원)</th>
					<td><input type="text" name="grade" value="<%=grade%>" size="10"
						maxlength="1"></td>
				</tr>
				<tr>
					<th>도시코드</th>
					<td><input type="text" name="city" value="<%=city%>" size="10"
						maxlength="2"></td>
				</tr>
				<tr>
					<th colspan="2">
					<input type="submit" value="수정" onclick="check(); return false;">
					<input type="reset" value="다시쓰기">
				 	<a href="deletePro.jsp?custno=<%=rs.getString("custno") %>" class="linkToUpdate"><input type="button" value="삭제"></a>
					</th>
				</tr>
			</table>
		</form>
	</section>
	<%@ include file="footer.jsp" %> <!-- DB 연결 해제 -->
</body>
</html>




