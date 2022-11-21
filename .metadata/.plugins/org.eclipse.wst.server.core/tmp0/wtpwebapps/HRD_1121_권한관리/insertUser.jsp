<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@page import="java.util.Date"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자등록</title>
</head>
<body>
	<%@ include file="header.jsp"%>

<%
Date date = new Date();
SimpleDateFormat newdate = new SimpleDateFormat("yyyy/MM/dd");

String today = newdate.format(date);

int user_no = 0 ;
sql= "select max(user_no)+1 from USER_TBL_08 ";
try{
	pstmt = con.prepareStatement(sql);
	rs = pstmt.executeQuery();
	if(rs.next()){
		user_no = rs.getInt(1);
	}
}catch(Exception e){
	e.printStackTrace();
}

%>

	<section>
	
		<div class="sectiontitle">수강생등록</div>
		
		<div class="insertUserMiddleDiv" >
		
			<form action="#" method="post" name="f">
				<table class="insertUserTBL">
					<tr>
						<th>사용자번호</th>
						<td>
						 <input type="text" name="user_no" value="<%=user_no%>" readonly="readonly">
						</td>
					</tr>
					<tr>
						<th>사용자명</th>
						<td>
						<input type="text" name="user_name">
						</td>
					</tr>
					<tr>
						<th>암호</th>
						<td>
						<input type="password" name="user_pw">
						</td>
					</tr>
					<tr>
						<th>암호확인</th>
						<td>
						<input type="password" name="user_pw2">
						</td>
					</tr>
					<tr>
						<th>소속부서번호</th>
						<td>
						<input type="text" name="dept_no">
						</td>
					</tr>
					<tr>
						<th>사용자구분</th>
						<td>
						<input type="text" name="user_gbn">
						</td>
					</tr>
					<tr>
						<th>등록일자</th>
						<td>
						<input type="text" name="reg_date" value="<%=today%>" readonly="readonly">
						</td>
					</tr>
				</table>
				
				<div class="btndiv">
					<input type="button" value="등록" onclick="insertUser(); return false;" />
					<input type="button" value="조회" onclick="location.href='updateUser.jsp';" />
				</div>
			</form>
		</div>
				
	</section>


	<%@ include file="footer.jsp"%>
</body>
</html>