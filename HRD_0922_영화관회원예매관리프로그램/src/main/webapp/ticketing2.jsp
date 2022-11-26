<%@page import="javax.print.DocFlavor.INPUT_STREAM"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="header.jsp" %>
	<section>
		<div>
			<h2>회원등록</h2>
		</div>
		
		<form action="insertMemberPro.jsp" name="f" method="post">
		
			<table> <!-- 모든 항목 유효성체크 -->
				<tr>
					<th>회원아이디</th>
					<td>
						<input type="text" name="me_id" value="" size="20" maxlength="12">
					</td>
				</tr>
				<tr>
					<th>회원비밀번호</th>
					<td><input type="text" name="me_pass" value="" size="20" maxlength="15"></td>
				</tr>
				<tr>
					<th>영화제목</th>
					<td>
						<select name = "mo_name" size="4">
							<option value="">영화제목을 선택하세요.</option>
							<%
							sql = "select mo_name from movie_3";
							
							ps = con.prepareStatement(sql);
							rs = ps.executeQuery();
							
							int selectBoxSize = 0;
							while(rs.next()) { %>
							<option value="<%=rs.getString(1)%>"><%=rs.getString(1)%></option>
							<!-- <option value="1">겨울왕국2</option> -->
							<% selectBoxSize++;
							} %>
						</select >
					</td>
				</tr>
				<tr>
					<th>예매일시</th> 
					<%
							sql = "select to_char(sysdate,'yyyy-mm-dd') from dual";
							
							ps = con.prepareStatement(sql);
							rs = ps.executeQuery();
							rs.next();
							String today = rs.getString(1);
							%>
					<td><input type="date" name="rm_date" value="<%=today %>" size="20" readonly="readonly">자동입력</td>
					<!-- type="date" 날짜 선택, required : 반드시 입력해야 submit 가능함 
					선택가능한 날짜 범위 제한하는 방법 min="시작날짜" max="종료날짜"-->
				</tr>
				<tr>
					<td colspan="2" class="buttonBox">
						<input type="submit" name="submitButton" value="영화예매" onclick="ticketing(); return false;">
						<input type="button" name="select" value="조회" onclick="ticketingSelect();">
					</td>
				</tr>
			</table>
		</form>
		
	</section>
<%@ include file="footer.jsp" %>
</body>
</html>