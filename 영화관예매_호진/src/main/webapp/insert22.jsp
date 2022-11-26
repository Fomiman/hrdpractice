<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	function check(){
		if(f.me_id.value==""){
			alert("회원아이디를 입력해주세요");
			return f.me_id.focus();
	}
		if(f.me_pass.value==""){
			alert("회원비밀번호를 입력해주세요");
			return f.me_pass.focus();
	}
		if(f.mo_name.value==""){
			alert("영화를 선택해주세요");
			return;
	}
		if(f.rm_date.value==""){
			alert("날짜를 입력해주세요");
			return f.rm_date.focus();
			
	}
	
		f.submit();
	
	}
</script>
<body>
	<%@include file="header.jsp" %>
	<section>
	
	<div>
		<h2>
			영화예매
		</h2>
	</div>
	
	<form action="reservationPro.jsp" name="f" method="post">
		<table border="2" width="500">
			<tr>
				<th>회원아이디</th>
				<td>
					<input type="text" name="me_id" value="" size="15"  maxlength="12">
				</td>
			</tr>
			<tr>
				<th>회원비밀번호</th>
				<td>
					<input type="text" name="me_pass" value="" size="15"  maxlength="15">
				</td>
			</tr>
			<tr>
				<th>영화제목</th>
				<td>
					<select name="mo_name" multiple>
					<option value="" disabled >영화제목을 선택하시오</option>
					<%
					sql="select mo_name from movie_3";
					rs=stmt.executeQuery(sql);
					while(rs.next()){%>
						<option value="<%=rs.getString(1)%>"><%=rs.getString(1)%></option>
					<%}%> 
					
					
					 <!-- 
					<option value="겨울왕국2">겨울왕국2</option>
					<option value="늑대아이">늑대아이</option>
					<option value="김복동">김복동</option>
					<option value="시간을 달리는 소녀">시간을 달리는 소녀</option>
					<option value="썸머 워즈">썸머 워즈</option>
					<option value="눈의 여왕4">눈의 여왕4</option> -->
						
						
					
					</select>
				</td>
			</tr>
			<tr>
				<th>예매일시</th>
				<td>
				<!-- type="date" 날짜 선택, required: 반드시 입력해야 submit 가능함 
				선택가능한 날짜 범위 제한방법 min="시작날짜" max="종료날짜"-->
				<%sql="select to_char(sysdate,'YYYY-MM-DD') from dual";
				rs=stmt.executeQuery(sql);
				rs.next();
				String rm_date=rs.getString(1); %>
					<input type="date" min="<%=rm_date%>" max="2022-09-30" name="rm_date" required>
					
				</td>
			</tr>

			<tr>
				<th colspan="2">
					<input type="submit" value="영화예매" onclick="check(); return false;">
					<input type="button" value="조회" onclick="location.href='select.jsp'">
				</th>
			</tr>
		</table>
	
	</form>
	
	</section>
	<%@include file="footer.jsp" %>
</body>
</html>