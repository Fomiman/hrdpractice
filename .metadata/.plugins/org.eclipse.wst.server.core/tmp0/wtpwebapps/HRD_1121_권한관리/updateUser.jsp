<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@page import="java.util.Date"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자목록조회/수정</title>
</head>
<body>
	<%@ include file="header.jsp"%>



	<section>
	
		<div class="sectiontitle">사용자 조회/수정</div>
		
		<div class="insertUserMiddleDiv" >
		
			<form action="#" method="post" name="f">
				<table class="insertUserTBL">
					<tr>
						<th>사용자번호</th>
						<th>사용자명</th>
						<th>소속부서번호</th>
						<th>사용자구분</th>
						<th>등록일자</th>
					</tr>
					<%
						sql = "select user_no, user_name, ";
						sql += " nvl(decode(dept_no, 'A01', '인사', 'A02','개발','B01','총무','B02','회계' ), ' '), ";
						sql += " user_gbn, to_char(reg_date,'yyyy/MM/dd') from USER_TBL_08 ";
						try{
							pstmt = con.prepareStatement(sql);
							rs = pstmt.executeQuery();
							while(rs.next()){
								%>
					<tr>
						<td>
						 	<a href="updatePage.jsp?user_no=<%=rs.getInt(1) %>>"><%=rs.getInt(1) %></a>
						</td>
						<td>
						<%=rs.getString(2) %>
						</td>
						<td>
						<%=rs.getString(3).trim() %>
						</td>
						<td>
						<%=rs.getString(4) %>
						</td>
						<td>
						<%=rs.getString(5) %>
						</td>
					</tr>
								<%
							}
						}catch(Exception e){
							e.printStackTrace();
						}
					%>
					
				</table>
			</form>
		</div>
				
	</section>


	<%@ include file="footer.jsp"%>
</body>
</html>