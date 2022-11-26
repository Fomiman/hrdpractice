<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑몰관리 프로그램</title>

</head>
<body>
	<%@ include file="header.jsp"%>
	<!-- dbconn.jsp(DB 연결) + style.css -->

	<%
	//빈 구문객체-1. statment 구문객체 사용 : select => 반드시 결과로 ResultSet 받음
	//DB연결된곳 보다는 아래에, 사용되는 곳(현재 value에 사용하려고 한다.) 보다는 위에 존재해야한다.
	/*
	NVL(max(memno), 1000) : 회원번호의 가장 큰 값이 null이면 = 등록된 회원이 없으면 1000으로 값을 주고 아래 식에서 +1을 해주어 1001부터 등록되게 한다.
	*/
	// [방법-1] 반드시 회원번호 4자리로 1001부터 시작한다면
	// sql= "select NVL(max(memno), 1000)+1 from member";

	// [방법-2] 회원번호 4자리라는 말이 없다면
	/* sql = "select NVL(max(memno), 0)+1 AS memno from member";
	rs = stmt.executeQuery(sql); */
	//+) ResultSet rs2 = stmt.executeQuery("select NVL(max(memno), 0)+1 AS memno from member");

	//[빠른 방법] :
	/* rs.next();
	String bringMemno = rs.getString(1); */ // 인덱스 번호 이용하여 "1010" 가져옴
	//변수 이름을 jsp에서 사용하려면 <%=변수이름 으로 사용

	//[정석적인 방법]
	/*
		String bringMemno = null;
	if(rs.next()) {
		// bringMemno = rs.getString(1); // 인덱스 번호 이용하여 "1010" 가져옴
		bringMemno = rs.getString("memno"); // "별칭" 이용하여 가져온다
	}
	*/

	// 가입일을 오늘 날짜로 자동입력
	/* sql = "select TO_CHAR(SYSDATE ,'yyyy-mm-dd') AS hiredate from dual";
	rs = stmt.executeQuery(sql);
	rs.next();
	String bringDate = rs.getString(1); */

	/* 가장 빠른 방법 : 회원번호와 가입일을 동시에  +)별칭도 제거하면 더 짧고 빨라짐 */
	//sql = "select NVL(max(memno), 0)+1 AS memno, TO_CHAR(SYSDATE ,'yyyy/mm/dd') AS hiredate from member";
	sql = "select NVL(max(memno), 0)+1 AS memno,";
	sql += "TO_CHAR(SYSDATE ,'yyyy/mm/dd') AS hiredate from member";
	rs = stmt.executeQuery(sql);
	rs.next();
	String bringMemno = rs.getString(1);
	String bringDate = rs.getString(2);
	%>

	<section>
		<div>
			<h2>회원등록</h2>

		</div>
		<div>
			<table>
				<tr>
					<th>회원번호</th>
					<%-- <td><input type="text" name="memno" value="<%=bringMemno%>"
						size="10" maxlength="4" readonly="readonly">자동입력</td> --%>
					<td><input type="text" name="memno" value="<%=rs.getString(1)%>"
						size="10" maxlength="4" readonly="readonly">자동입력</td>
				</tr>
				<tr>
					<th>회원이름</th>
					<td><input type="text" name="name" value="" size="10"
						maxlength="30"></td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input type="text" name="address" value="" size="10"
						maxlength="100"></td>
				</tr>
				<tr>
					<th>가입일</th>
					<td><input type="text" name="hiredate"
						value="<%=bringDate /* out.print(bringDate); // 서블릿 형태*/ %>"
						size="10" maxlength="15">자동입력</td>
				</tr>
				<tr>
					<th>성별</th>
					<td><label><input type="radio" name="gender" value="M"
							size="10">남자</label> <label><input type="radio"
							name="gender" value="F" size="10">여자</label></td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td><input type="tel" class="tell" name="tel1" value=""
						size="5" maxlength="3">- <input type="tel" class="tell"
						name="tel2" value="" size="5" maxlength="4">- <input
						type="tel" class="tell" name="tel3" value="" size="5"
						maxlength="4"></td>
				</tr>
				<tr>
					<td colspan="2" class="button1"><input type="submit"
						value="회원등록"> <input type="button" value="조회"></td>
				</tr>
			</table>
		</div>
	</section>
	<%@ include file="footer.jsp"%>
	<!-- DB 연결 해제 -->
</body>
</html>