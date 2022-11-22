<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원등록</title>
</head>
<body>
	<%@ include file="header.jsp"%>

<%
int custno = 0;
String today = null ;
try{
	sql = "select max(custno)+1 , to_char(sysdate,'yyyy-MM-dd') from member_tbl";
	pstmt =con.prepareStatement(sql);
	rs = pstmt.executeQuery();
	if(rs.next()){
		custno = rs.getInt(1);
		today = rs.getString(2);
	}
}catch(Exception e){
	e.printStackTrace();
}

%>
<section>
	<h2>회원등록</h2>
	<form action="#" method="post" name="f">
		<table class="inserttbl">
			<tr>
				<th>회원번호</th>
				<td>
				<input type="number" name="custno" value="<%=custno %>" readonly="readonly">
				</td>
			</tr>
			<tr>
				<th>회원성명</th>
				<td><input type="text" name="custname" value=""></td>
			</tr>
			<tr>
				<th>성별</th>
				<td>
				<label><input type="radio" name="gender" value="F" style="margin-left: 10px"> 여</label>&nbsp;&nbsp;
				<label><input type="radio" name="gender" value="M"> 남</label>
				</td>
			</tr>
			<tr>
				<th>회원전화</th>
				<td><input type="tel" name="phone" value="" maxlength="13"></td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input type="text" name="address" value=""></td>
			</tr>
			<tr>
				<th>가입일자</th>
				<td><input type="text" name="joindate" value="<%=today%>"></td>
			</tr>
			<tr>
				<th>고객등급(A:VIP,B:일반,C:직원)</th>
				<td><input type="text" name="grade" value="" maxlength="1"></td>
			</tr>
			<tr>
				<th>거주도시</th>
				<td><input type="text" name="city" value="" maxlength="2">숫자 두자리 입력 ex)20</td>	
			</tr>
		</table>

		<div class="btndiv" style=" text-align: center;">
			<input type="button" value="등록" onclick="insertCust();"/>
			<input type="button" value="다시쓰기" onclick="rewrite();">
		</div>
	</form>
</section>
	<%@ include file="footer.jsp"%>
</body>
</html>