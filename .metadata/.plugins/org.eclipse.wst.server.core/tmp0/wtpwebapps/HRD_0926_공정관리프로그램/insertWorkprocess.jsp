<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작업공정등록</title>
	
	<!-- <script src="http://code.jquery.com/jquery-latest.js"></script>
        jquery 사용 type="reset" 버튼 눌렀을때 이벤트 생성
        <script>
            $(function(){
                $("#rewriteButton").click(function(){
                    if(!confirm("정보를 지우고 처음부터 다시 입력 합니다!")){
                    	return false;/* 취소 선택시 reset 취소, 확인 선택시 reset 진행*/
                    }
                })
            })
		</script> -->
</head>
<body>
	<%@ include file="header.jsp" %>
	<h1>작업공정등록</h1>
	<form action="insertProcessPro.jsp" method="post" name="insertForm">
		<table class="insert1table">
			<tr>
				<th>작업지시번호</th>
				<td>
					<input type="text" name="w_workno" value="" />예)20190001
				</td>
			</tr>
			<tr>
				<th>재료준비</th>
				<td>
					<input type="radio" value="Y" name="p_p1" />완료
					<input type="radio" value="N" name="p_p1" />작업중
				</td>
			</tr>
			<tr>
				<th>인쇄공정</th>
				<td>
					<input type="radio" value="Y" name="p_p2" />완료
					<input type="radio" value="N" name="p_p2" />작업중
				</td>
			</tr>
			<tr>
				<th>코팅공정</th>
				<td>
					<input type="radio" value="Y" name="p_p3" />완료
					<input type="radio" value="N" name="p_p3" />작업중
				</td>
			</tr>
			<tr>
				<th>합지공정</th>
				<td>
					<input type="radio" value="Y" name="p_p4" />완료
					<input type="radio" value="N" name="p_p4" />작업중
				</td>
			</tr>
			<tr>
				<th>접합공정</th>
				<td>
					<input type="radio" value="Y" name="p_p5" />완료
					<input type="radio" value="N" name="p_p5" />작업중
				</td>
			</tr>
			<tr>
				<th>포장적재</th>
				<td>
					<input type="radio" value="Y" name="p_p6" />완료
					<input type="radio" value="N" name="p_p6" />작업중
				</td>
			</tr>
			<tr>
				<th>최종작업일자</th>
				<td>
					<input type="text" name="w_lastdate" value="">예)20190101
					<!-- 입력형태 및 오라클에서 타입이 char이라서 text 타입으로 입력받음 -->
				</td>
			</tr>
			<tr>
				<th>최종작업시간</th>
				<td>
					<input type="text" name="w_lasttime" value="">예)1300
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" name="insertSubmit" value="공정등록" onclick="insertCheck(); return false;"/>
					
					<input type="button" name="insertUpdate" value="공정수정" onclick="return updateCheck(this.form);"/><!-- 펑션에서 form action 경로 변경 -->
					
					<input type="button" name="rewrite" value="다시쓰기" id="rewriteButton" onclick="rewrite1();"></input>
				</td>
			</tr>
		</table>
	</form>
	
	<%@ include file="footer.jsp" %>
</body>
</html>