<%@page import="java.util.Iterator"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<%@include file="Header.jsp" %>
	
	<%
		sql  = "select mo_name from movie_3 order by mo_no";
		rs = stmt.executeQuery(sql);
		
		
	%>
	<section>
		<h1>영화 티켓 예매</h1>
		<form action="InsertMoviePro.jsp" name="f" method="post">
			<table>
				<tr>
					<th>회원아이디</th>
					<td><input name = me_id size="20" maxlength="12"></td>
				</tr>
				<tr>
					<th>회원비밀번호</th>
					<td><input type="password" name = me_pass size="20" maxlength="15"></td>
				</tr>
				<tr>
					<th>영화제목</th>
					<td>
						<select name="mo_name">
							<option value="">영화제목을 선택하세요</option>
						<%while(rs.next()){
							%>
							<option value="<%=rs.getString(1)%>"><%=rs.getString(1) %></option>
							<%
						}
						%>
						</select>
						<span id="movid" ></span>
					</td>
				</tr>
				<tr>
					<th>예매일시</th>
					<td>
						<input name="rm_date" size="20"><br>
						<span id="checker" ></span>
					</td>
				</tr>
				<tr>
					<th colspan="2">
						<button type="button" onclick="checkMovie();">영화예매</button>
						<button type="button" onclick="location.href = 'SelectMember.jsp'">조회</button>
					</th>
				</tr>
			</table>
		</form>
		
	</section>
	<%@include file="Footer.jsp" %>
</body>
</html>