<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화관 회원&amp;예매 관리 프로그램</title>
<script type="text/javascript">
//웹페이지 로딩 시 현재날짜 구하기
window.onload = function() {
	//https://dororongju.tistory.com/116
	var date = new Date(); // 현재 날짜를 시스템으로부터 가져옴
	//월 - getMonth() : 0~11 -> 1월~12월
	var nowMonth = date.getMonth().length < 2 ? "0"+String(date.getMonth()+1) : String(date.getMonth()+1);
	// true (한 자리수 : 1~9 -> "01"~"09"), false(두자리수 "10"~"30"/"31");
	var nowDay = date.getDate().length < 2 ? "0" + date.getDate() : String(date.getDate());
	var nowDate = String(date.getFullYear()) + "-" + nowMonth + "-" + nowDay;
	
	insertForm.rm_date.value = nowDate;
};
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
		<form action="insertMovieBuyPro.jsp" method="post" name="insertForm">
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
						<%
						sql = "select mo_name from movie_3";	//영화제목 가져오기
						
						ps = con.prepareStatement(sql);
						rs = ps.executeQuery();
						
						%>
						<select name="mo_name" multiple="multiple">
						<!-- 멀티플 과제 2. -->
							<option value="" disabled="disabled">영화제목을 선택하시오.</option>
							<%while(rs.next()) { %>
								<option value="<%=rs.getString("mo_name")%>"><%=rs.getString("mo_name")%></option>
							<%} %>
						</select>
					</td>
				</tr>
				<tr>
					<th>예매일시</th>
					<td>
						<label>
							<input type="text" name="rm_date" value = "" size="20" readonly>자동입력
						</label>
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