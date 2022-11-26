<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SelectScore</title>
</head>
<script type="text/javascript" src="function.js"></script>
<body>
	<%@ include file="header.jsp"%>
	
	<section>
		<form action="selectScorePro.jsp" name="f" method="post">
			<div>
				<h2>재수강대상자</h2>
			</div>
			
			<table id="selectScoreTable" width="800px">
				<tr>
					<th>학번</th>
					<th>이름</th>
					<th>전공1</th>
					<th>전공2</th>
					<th>전공3</th>
					<th>교양1</th>
					<th>교양2</th>
					<th>학생총점</th>
					<th>학생평균</th>
				</tr>
				
				<tr align="center">
					<th>성적 우수자</th>
					<%
						//ps = con.prepareStatement("select * from score_tbl");
						//rs = ps.executeQuery();
						rs = stmt.executeQuery("select * from score_tbl");
						
						//1. ResultSetMetaData객체를 얻어와
						ResultSetMetaData rsmd = rs.getMetaData();
						
						//2. 컬럼의 총수를 얻어와 numberOfColumns변수에 저장(3.에서 배열의 length의 값과 같아진다.)
						int numberOfColumns = rsmd.getColumnCount(); // score_tbl의 컬럼수 : 7
						
						//3. 컬럼의 총수로 배열객체 생성함
						String[] sub = new String[numberOfColumns];
						
						//4. 각 컬럼 이름을 주요메서드로 가져와 배열에 저장
						// 배열의 index는 0부터 시작, SQL의 index는 1부터 시작[기준]//배열엔 뭐다? for문이지
						//for(int i=1; i<= sub.length ;i++){ //[방법-1]
						for(int i=1; i<=numberOfColumns ;i++){ //[방법-2] 
							sub[i-1] = rsmd.getCatalogName(i); //각 컬럼이름을 얻어와 배열에 저장 // [i-1]인 이유는 java의 index에 맞추기 위해서	 
						}
						
						int hi = 0;
						// 배열의 index는 0부터 시작[기준], SQL의 index는 1부터 시작
						//i가 2부터 시작하는 이유? sub는 배열이고 score_tbl테이블에서 3번째 컬럼부터 점수에 관련된 컬럼이므로
						for(int i = 2; i<=sub.length;){ 
							sql = "select count(*)";
							sql += " from score_tbl join grade_tbl"; //비등가조인
							sql += " ON( `"+ sub[i] +" BETWEEN loscore and hiscore)"; //m_subject1 변경되면서 화면에 출력
							sql += " where grade='A' "; 
							
							rs = stmt.executeQuery(sql);
							rs.next();
							hi = rs.getInt("count(*)"); // 성적 우수자 수 //컬럼이름 그대로 쓰고 가져옴 이름이니까 ""큰따옴표필수
						
					%>
					<td><%=hi %></td>
					<%} //for문 끝 %>
				</tr>
				
				<tr align="center">
					<th>재수강 대상자</th>
					<%
						int low = 0;
						// 배열의 index는 0부터 시작[기준], SQL의 index는 1부터 시작
						//i가 2부터 시작하는 이유? sub는 배열이고 score_tbl테이블에서 3번째 컬럼부터 점수에 관련된 컬럼이므로
						for(int i = 2; i<=sub.length;){ 
							sql = "select count(*)";
							sql += " from score_tbl join grade_tbl"; //비등가조인
							sql += " ON("+ sub[i] +" BETWEEN loscore and hiscore)"; //m_subject1 변경되면서 화면에 출력
							sql += " where grade='F' "; 
							
							rs = stmt.executeQuery(sql);
							rs.next();
							low = rs.getInt("count(*)"); // 성적 우수자 수 //컬럼이름 그대로 쓰고 가져옴 이름이니까 ""큰따옴표필수
						
					%>
					<td><%=low %></td>
					<%} //for문 끝 %>
				</tr>
				
			</table>
		</form>
	</section>
	<%@ include file="footer.jsp"%>
</body>
</html>