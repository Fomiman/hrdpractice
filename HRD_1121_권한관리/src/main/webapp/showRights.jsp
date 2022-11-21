<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@page import="java.util.Date"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>권한조회</title>
</head>
<body>
	<%@ include file="header.jsp"%>



	<section>
	
		<div class="sectiontitle">권한조회</div>
		
		<div class="insertUserMiddleDiv" >
		
			<form action="#" method="post" name="f">
				<table class="insertUserTBL">
					<tr>
						<th>사용자번호</th>
						<th>사용자명</th>
						<th>메뉴번호</th>
						<th>메뉴명</th>
					</tr>
					<%
						sql = "select u.user_no, u.user_name, d.menu_no, ";
						sql+="	nvl(decode(d.menu_no, 10,'부서관리',11,'사원관리',12,'기초정보관리',13,'급여계산'), ' ') as menu_name ";
						sql+="	from USER_TBL_08 u join dept_auth_tbl_08 d ";
						sql+="	on (u.dept_no = d.dept_no)  ";
						sql+="	union ";
						sql+="	select u.user_no, u.user_name, a.menu_no,  ";
						sql+="	nvl(decode(a.menu_no, 10,'부서관리',11,'사원관리',12,'기초정보관리',13,'급여계산'), ' ') as menu_name ";
						sql+="	from USER_TBL_08 u join user_auth_tbl_08 a ";
						sql+="	on (u.user_no = a.user_no)";
						try{
							pstmt = con.prepareStatement(sql);
							rs = pstmt.executeQuery();
							
							int r1 = 0;
							int r2 = 0;
							while(rs.next()){
								int a =rs.getInt(1);
								
								if(r1 != a && r2 != a){
									r1 = a ;
									r2 = a;
								}else if(r2 == a && r1 ==a){
									r1 = 0;
								}
								%>
					<tr>
						<td>
						 <%=r1==0?"":r1 %>
						</td>
						<td>
						<%=rs.getString(2) %>
						</td>
						<td>
						<%=rs.getInt(3) %>
						</td>
						<td>
						<%=rs.getString(4) %>
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