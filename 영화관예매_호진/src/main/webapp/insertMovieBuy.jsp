<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
     <%-- <%@ page import="java.util.Date, java.text.SimpleDateFormat"%> --%>
    <%@ page import="java.util.Date" %>
	<%@page import="java.text.SimpleDateFormat"%>

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
<%
Date date = new Date();
//아래에서 input type="date"에 활용하려면 반드시 "yyyy-MM-dd"로 (소문자 mm 인식못함)
SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd") ;
String time = format.format(date);


%>
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
						<select name="mo_name">
							<option value="">영화제목을 선택하시오.</option>
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
						<!-- 브라우저가 date 입력칸을 지원하지 않으면 text 입력 칸으로 저하된다.
						하지만 저하된 입력 칸은 사용자 인터페이스의 일관성을 깨고, 데이터 처리방식에 차이를 만든다는 문제가 있다.
						더 심각한 문제는 date 입력칸이 지원되는 브라우저에서는 입력칸의 값을 반드시 yyyy-MM-dd 형식으로 정규화한다. 
						하지만 일반 text 입력 칸에는 날짜 형식 제한 같은 것이 존재하지 않기때문에 정규화 할 수도 없는데,
						사람들이 입력하는 날짜 형식이 다양하다.
						yyyy/mm/dd, yy/mm/dd, yymmdd 등등
						이 문제를 우회하는 방법 중 하나는ㄴ date 입력 칸에 "pattern" 특성을 지정하는 것이다. 
						date 입력 칸은 pattern 특성을 따르지 않지만, 저하된 text 입력 칸은 유효성 검증에 패턴을 활용한다.-->
							<input type="date" name="rm_date" value = "" min="<%=time %>" max="2022-09-30" required="required" 
							pattern="\d{4}-\d{2}-\d{2}">
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