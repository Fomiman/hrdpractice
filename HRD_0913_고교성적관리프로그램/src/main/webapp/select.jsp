<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고교성적관리 프로그램</title>
</head>
<body>
	<%@ include file="header.jsp"%>
	<!-- dbconn.jsp(DB 연결) + style.css -->
	<section>
		<div>
			<h2>성적조회</h2>
		</div>
		<table class="selecttable">
			<tr>
				<th>학년-반-번호</th>
				<th>이름</th>
				<th>성별</th>
				<th>국어</th>
				<th>영어</th>
				<th>수학</th>
				<TH>총점</TH>
				<TH>평균</TH>

			</tr>
			<%
			/* sql = "select  e1.syear||'-'||e1.sclass||'-'||e1.sno as id ,sname,"; 
			sql += " decode(gender, 'M', '남','F','여'),";
			sql += " kor, eng, math,";
			sql += " (kor+eng+math) as totalscore,";
			sql += " round((kor+eng+math)/3,1) as avgScore";
			sql += " from examtbl_1 e1 full join examtbl_3 e3";
			sql += " on (e1.syear=e3.syear and e1.sclass = e3.sclass and e1.sno =e3.sno)"; */
			
			//[2] (+) 이용 외부조인 : 빠르게 해결가능, left와 right만 가능 (*full 안됨)
			//null처리 => NVL()함수 이용 - [이 방법의 문제점 : 커서가 한칸 떨어져있음. 그러나 결과를 출력하는 페이지이므로 상관없음]
			sql = "select  e1.syear||'-'||e1.sclass||'-'||e1.sno as id, sname, ";
			sql += " decode(gender, 'M', '남', 'F', '여') as decodeGender, ";
			sql += " NVL(to_char(kor),' '), NVL(to_char(eng),' '), 	NVL(to_char(math),' '),"; //chr(32) == ' ',(아스키코드 32 == SP,스페이스바)
			sql += " SUM(NVL(kor,0)+NVL(eng,0)+NVL(math,0)) as totalSum,";
			sql += " round(SUM(NVL(kor,0)+NVL(eng,0)+NVL(math,0))/3, 1) as totalAvg";
			sql += " from examtbl_1 e1 , examtbl_3 e3";
			sql += " where (e1.syear=e3.syear(+) and e1.sclass = e3.sclass(+) and e1.sno =e3.sno(+))";
			sql += " GROUP BY  e1.syear, e1.sclass, e1.sno, sname, gender , kor, eng, math";
			sql += " order by e1.syear, e1.sclass, e1.sno";
			
			
			rs = stmt.executeQuery(sql);
			
		
			while(rs.next()){
			%>

			<tr align="center">
				<%-- <td><%=rs.getString(1) %></td> --%>
				<td><a href="update.jsp?id=<%=rs.getString(1) %>"><%=rs.getString(1) %></a>
				<td><%=rs.getString(2) %></td>
				<td><%=rs.getString(3) %></td>
				<!-- [java로 null 처리] -->
				<td><%=rs.getString(4)==null?" ":rs.getString(4) %></td>
				<td><%=rs.getString(5)==null?" ":rs.getString(5) %></td>
				<td><%=rs.getString(6)==null?" ":rs.getString(6) %></td>
				<td><%=rs.getString(7)==null?" ":rs.getString(7) %></td>
				<td><%=rs.getString(8)==null?" ":rs.getString(8) %></td>

			</tr>

			<%} 
			

			sql = "select  sum(NVL(kor,0)), sum(NVL(eng,0)), sum(NVL(math,0)),";
			sql += " round(avg(NVL(kor,0)),1),round(avg(NVL(eng,0)),1), round(avg(NVL(math,0)),1)";
			sql += " from examtbl_3 ";

			rs = stmt.executeQuery(sql);
			while(rs.next()){
			%>


			<tr align="center">
				<td></td>
				<td></td>
				<td>총점수합계</td>
				<td><%=rs.getString(1) %></td>
				<td><%=rs.getString(2) %></td>
				<td><%=rs.getString(3) %></td>
				<td></td>
				<td></td>
			</tr>
			<tr align="center">
				<td></td>
				<td></td>
				<td>총점수평균</td>
				<td><%=rs.getString(4) %></td>
				<td><%=rs.getString(5) %></td>
				<td><%=rs.getString(6) %></td>
				<td></td>
				<td></td>
			</tr>
			<%}%>
		</table>
	</section>
	<%@ include file="footer.jsp"%>
	<!-- DB 연결 해제 -->
</body>
</html>