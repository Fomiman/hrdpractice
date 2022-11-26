<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화관 회원&amp;예매 관리 프로그램</title>
<script type="text/javascript">
	//유효성 검사
	
	function check() {
		if(!insertForm.me_id.value) {
			alert("아이디를 입력해주세요.");
			return insertForm.me_id.focus();
		}
		if(!insertForm.me_pass.value) {
			alert("회원비밀번호를 입력해주세요.");
			return insertForm.me_pass.focus();
		}
		if(!insertForm.mo_name.value) {
			alert("영화제목을 선택해주세요.");
			return;
		}
		if(!insertForm.rm_date.value) {
			alert("예매일시를 입력해주세요.");
			return insertForm.rm_date.focus();
		}
		
		insertForm.submit(); //폼 제출
	}
	
</script>
</head>
<body>
<%@ include file = "header.jsp" %>
	<section>
		<div>
			<h2>영화예매</h2>
		</div>
		<form action="insertMovieBuyPro_multiple.jsp" method="post" name="insertForm">
			<table border="1" width="450">
				<tr>
					<th>회원아이디</th>
					<td>
						<label>
							<input type="text" name="me_id" value="" maxlength="12" size="20">
						</label>
					</td>
				</tr>
				<tr>
					<th>회원비밀번호</th>
					<td>
						<label>
							<input type="password" name="me_pass" value="" maxlength="15" size="20">
						</label>
					</td>
				</tr>
				<tr>
					<th>영화제목</th>
					<td>
						<!-- 과제1. DB로부터 영화이름을 조회하여 HTML로 출력 -->
						<%
						sql = "select mo_name from movie_3";	//영화제목 가져오기
						
						ps = con.prepareStatement(sql);
						rs = ps.executeQuery();
						
						%>
						<!-- 과제2. 한번에 영화를 여러 개 선택하여 예약가능하도록 -->
						<select name="mo_name" multiple>
							<optgroup label="영화제목을 선택하시오.">
							<%while(rs.next()) { %>
								<option value="<%=rs.getString("mo_name")%>"><%=rs.getString("mo_name")%></option>
							<%} %>
							</optgroup>
						</select>
					</td>
				</tr>
				<tr>
					<th>예매일시</th>
					<td>
						<%
						sql = "select to_char(sysdate, 'yyyy-mm-dd') from dual";
						
						ps = con.prepareStatement(sql);
						rs = ps.executeQuery();
						
						rs.next();
						
						String rm_date = rs.getString(1);
						%>
						<%-- <input type="text" name="rm_date" value = "<%=rm_date%>" size="20" readonly>자동입력 --%>
						<!--  type="date" 날짜 선택, required : 반드시 입력해야 submit가능함
						선택가능한 날짜 범위 제한하는 방법 min="시작날짜" min="종료날짜" -->
						<input type="date" min="<%=rm_date%>" max="2022-09-30" name="rm_date" required>
					</td>
				</tr>
				<tr>
					<th colspan="2">
						<input type="button" onclick="check();" value="영화예매">
						<input type="button" onclick="location.href='selectMovieBuyInfo.jsp'" value="조회">
					</th>
				</tr>
			</table>
		</form>
	</section>
<%@ include file = "footer.jsp" %>
</body>
</html>