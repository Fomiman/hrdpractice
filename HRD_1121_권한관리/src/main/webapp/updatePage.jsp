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




	<section>
	
		<div class="sectiontitle">수강생등록</div>
		
		<div class="insertUserMiddleDiv" >
		
			<form action="#" method="post" name="f">
				<table class="insertUserTBL">
					<tr>
					<%
					sql = "select user_no, user_name, user_pw, ";
					sql += " nvl(dept_no, ' '), ";
					sql += " user_gbn, to_char(reg_date,'yyyy/MM/dd') from USER_TBL_08 ";
					try{
						pstmt = con.prepareStatement(sql);
						rs = pstmt.executeQuery();
						if(rs.next()){
					%>
						<th>사용자번호</th>
						<td>
						 <input type="text" name="user_no" value="<%=rs.getInt(1)%>" readonly="readonly">
						</td>
					</tr>
					<tr>
						<th>사용자명</th>
						<td>
						<input type="text" name="user_name" value="<%=rs.getString(2)%>">
						</td>
					</tr>
					<tr>
						<th>암호</th>
						<td>
						<input type="password" name="user_pw" value="<%=rs.getInt(3)%>">
						</td>
					</tr>
					<tr>
						<th>암호확인</th>
						<td>
						<input type="password" name="user_pw2" value="<%=rs.getInt(3)%>">
						</td>
					</tr>
					<tr>
						<th>소속부서번호</th>
						<td>
						<input type="text" name="dept_no" value="<%=rs.getString(4)%>">
						</td>
					</tr>
					<tr>
						<th>사용자구분</th>
						<td>
						<input type="text" name="user_gbn" value="<%=rs.getString(5)%>">
						</td>
					</tr>
					<tr>
						<th>등록일자</th>
						<td>
						<input type="text" name="reg_date" value="<%=rs.getString(6)%>" readonly="readonly">
						</td>
					<%
						}
					}catch(Exception e){
						e.printStackTrace();
					}
					%>
					</tr>
				</table>
				
				<div class="btndiv">
					<input type="button" value="등록" onclick="updateUser(); return false;" />
					<input type="button" value="조회" onclick="location.href='updateUser.jsp';" />
				</div>
			</form>
		</div>
				
	</section>


	<%@ include file="footer.jsp"%>
</body>
</html>