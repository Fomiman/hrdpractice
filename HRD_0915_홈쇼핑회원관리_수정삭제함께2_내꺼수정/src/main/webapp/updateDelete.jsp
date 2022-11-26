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

	/* function reWrite() {
		var x = confirm("다시 쓰시겠습니까?"); // [확인]==true, [취소]==false
		if(x==true) f.reset();		
		//f.name.focus();
		f.name.select();
		
		//f.reset();  
		//f.name.focus(); //글자는 그대로 있고 커서 깜빡거림
		//f.name.select(); // 글자에 블럭 설정됨 -> 입력하면 바로 덮어쓰기
	} */
	
	//check.js로 이동시킴
	/* function forUpdate() {
		return f.hiddenButton.value = "update";
	}
	function forDelete() {
		return f.hiddenButton.value = "delete";
	} */
	
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
		<form action="updateDeletePro.jsp" name="f" method="post">
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
					<input type="submit" value="수정" name="submitButton1" onclick="forUpdate(); check(); return false;">
					<input type="reset" value="다시쓰기">
				 	<input type="submit" value="삭제" name="submitButton2" onclick="forDelete(); ">
				 	<input type="hidden" name="hiddenButton" value="">
				 	<!-- 보이지 않는 히든 버튼을 이용해서 펑션으로 벨류값을 바꿔주고 이 값을 Pro에서 받는다. -->
				 	
				 	<!-- input type이 submit일 때, 반드시 return false;로 유효성 체크 끝까지 하도록 함 -->
					<input type="submit" value="수정-2" name="submitButton1" onclick="forUpdate(); check(); return false;"> 
				 	<input type="submit" value="삭제-2" name="submitButton2" onclick="forDelete(); ">
				 	
				 	 <!-- forUpdate(); 안에 check(); 넣음. input type이 button일 때 return false; 안넣어도 됨 -->
				 	<input type="button" value="수정-2" name="submitButton1" onclick="forUpdate(); ">
				 	<input type="button" value="삭제-2" name="submitButton2" onclick="forDelete(); ">
					</th>
				</tr>
			</table>
		</form>
	</section>
	<%@ include file="footer.jsp" %> <!-- DB 연결 해제 -->
</body>
</html>




