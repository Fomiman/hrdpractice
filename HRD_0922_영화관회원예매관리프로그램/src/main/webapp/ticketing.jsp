<%@page import="java.util.ArrayList"%>
<%@page import="javax.print.DocFlavor.INPUT_STREAM"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<!-- <script type="text/javascript">
		var MovieName = new Array(); //영화 이름을 저장할 배열
		var MovieDate = new Array(); //
		
		while()
	
		
		function select1(value) {
			for(var i =0; i< mo_NameDate.length; i++){
				if(value == mo_NameDate[i][0]){
					ft.rm_date.min = mo_NameDate[i][1];
					ft.rm_date.value = mo_NameDate[i][1];
					return;
				}
			}
		}

</script> -->
<body>
	<%@ include file="header.jsp"%>
	
<script type="text/javascript">
		var MovieName = new Array(); //영화 이름을 저장할 배열
		var MovieDate = new Array(); //
		
		<%
		sql = "select mo_name, to_char(mo_date, 'yyyy-mm-dd')  from movie_3";

		ps = con.prepareStatement(sql);
		rs = ps.executeQuery();

		while (rs.next()) {
		%>
		MovieName.push("<%=rs.getString(1)%>");
		MovieDate.push("<%=rs.getString(2)%>");
		<%
		}
		%>
	
	
	
		
		function select1(value) {
			for(var i = 0; i< MovieName.length ; i++){
				if(value == MovieName[i]){
					ft.rm_date.min = MovieDate[i];
					ft.rm_date.value = MovieDate[i];
					return;
				}
			}
		}
		
		function dateCheck(value, min) {
			
			if(value < min){
				alert("개봉일 전 날짜입니다.");
				ft.rm_date.focus();
				return;
			}
		} 

</script>

	<section>
		<div>
			<h2>회원등록</h2>
		</div>

		<form action="ticketingPro.jsp" name="ft" method="post">

			<table width="400px">
				<!-- 모든 항목 유효성체크 -->

				<tr>
					<th>회원아이디</th>
					<td><input type="text" name="me_id" value="" size="20"
						maxlength="12"></td>
				</tr>
				<tr>
					<th>회원비밀번호</th>
					<td><input type="text" name="me_pass" value="" size="20"
						maxlength="15"></td>
				</tr>
				<tr>
					<th>영화제목</th>
					<td><select name="mo_name" size="4" onchange="select1(this.value);">
							<option value="">영화제목을 선택하세요.</option>
							<%
							sql = "select mo_name from movie_3";

							ps = con.prepareStatement(sql);
							rs = ps.executeQuery();

							int selectBoxSize = 0;
							while (rs.next()) {
							%>
							<option value="<%=rs.getString(1)%>"><%=rs.getString(1)%></option>
							<!-- <option value="1">겨울왕국2</option> -->
							<%
							}
							%>
					</select></td>
				</tr>
				<tr>
					<th>예매일시</th>

					<td><input type="text" name="rm_date" value="" min="" size="20" onchange=""></td>
					<!-- type="date" 날짜 선택, required : 반드시 입력해야 submit 가능함 
					선택가능한 날짜 범위 제한하는 방법 min="시작날짜" max="종료날짜"-->
					<!-- 개봉일자 사용하여 개봉일자 전은 선택할 수 없도록한다. -->
				</tr>
				<tr>
					<td colspan="2" class="buttonBox">
					<input type="submit" name="submitButton" value="영화예매" onclick="dateCheck(ft.rm_date.value, ft.rm_date.min); ticketing(); return false;"> 
					<input type="button" name="select" value="조회" onclick="ticketingSelect();">
					</td>
				</tr>
			</table>
		</form>

	</section>
	<%@ include file="footer.jsp"%>
</body>
</html>