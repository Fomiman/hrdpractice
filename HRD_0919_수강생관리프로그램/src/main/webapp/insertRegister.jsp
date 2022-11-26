<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수강생목록조회/수정</title>
</head>
<body>
	<%@include file="header.jsp"%>
	
	<%
	//수강생 테이블 가져와서 수강생번호 제대로 입력되는지 확인을 여기서 하는지 펑션에 만들어서 할지
	//과목정보 테이블을 가져와서 오늘 날짜랑 과목명 들고 와서 테이블에 넣기 과목명은 value랑 그 옆에 두번 넣어줘야됨 그리고 과목수만큼 for문으로 자동으로 만들기
	//일단 과목정보랑 오늘 날짜부터
	sql = "";
	sql += " select to_char(sysdate, 'yyyy-mm-dd') from dual";
	String sql2 = " select nvl(max(register_seq),0)+1 from REGISTER_TBL_01";
	rs = stmt.executeQuery(sql);
	rs.next();
	String today = rs.getString(1);
	rs = stmt.executeQuery(sql2);
	rs.next();
	String register_seq = rs.getString(1);
	%>
	<section>
		<form action="insertRegisterPro.jsp" name="f" method="post">
			<div>
				<h2>수강생신청</h2>
			</div>
			<table id="insertRegisterTable">
				<input type="hidden" name="register_seq" value="<%=register_seq%>"> <!-- 수강신청번호 : 입력받지 않고 테이블에 저장시 자동증가하도록한다. -->
				<tr>
					<th>수강생번호</th> <!-- 수강생 정보 테이블에 있는 수강생번호만 입력 가능 -->
					<td><input type="text" name="student_no" value="" size="20"
						maxlength="6"></td>
				</tr>
				<tr>
					<th>신청과목</th><!-- 과목정보 테이블에 있는 과목명을 표시 -->
					<td>
						<select name="subject_seq" >
						<%
						sql ="select subject_seq, subject_name from SUBJECT_TBL_01";
						rs = stmt.executeQuery(sql); 
						// for문 이용해서 conut(*) 만큼 반복하면서 rs.next();로 다음 값을 바로 option의 value에 넣는다. 
						%>
							<option value="">수강과목</option>
							<%while(rs.next()){ %>
							<option value="<%=rs.getString(1)%>"><%=rs.getString(2)%></option>
							<%} %>
						</select>
					</td>
				</tr>
				<tr>
					<th>신청일자</th><!-- 오늘날짜 자동표시 -->
					<td>
						<input type="text" name="register_date" value="<%=today %>" size="20" readonly="readonly">
					</td>
				</tr>
				<tr>
					<th>수강상태</th> <!-- [0:신청 1:완료 2:취소]로 표시하고 기본값:신청 -->
					<td>
						<select name="register_status" >
							<option value="0">신청</option>
							<option value="1">완료</option>
							<option value="2">취소</option>
						</select>
					</td>
				</tr>
			</table>
			<div align="center">
				<input type="submit" value="등록" onclick="toRegister(); return false;">
				<input type="button" value="조회" onclick="moveToRegiserTable();">
			</div>
		</form>
	</section>
	<%@include file="footer.jsp"%>
</body>
</html>