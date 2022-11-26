<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑몰관리 프로그램</title>
</head>

<script type="text/javascript" src="check.js">
	
</script>

<body>
	<%@ include file="header.jsp" %> <!-- dbcon.jsp(DB 연결) + style.css -->
	
	<%
	/** 빈 구문객체-1. Statment 구문객체 사용 : select => 반드시 결과로 ResultSet**/
	
	/*
	NVL(max(memno), 0) : max(memno)이 NULL이 아니면 max(memno),
	                                  NULL이면 0
	NVL(max(memno), 0)+1  = 그 다음 회원번호  (예)1009 + 1 = 1010                             
	*/
	
	//[방법-1] 반드시 '회원번호 4자리'로 1001부터 시작하다면
	//sql = "select NVL(max(memno), 1000)+1 from member";
	
	//[방법-2] 회원번호 4자리라는 말이 없으면
	//rs = stmt.executeQuery("select NVL(max(memno), 0)+1 AS memno from member");
	//sql = "select NVL(max(memno), 0)+1 AS memno from member";
	//rs = stmt.executeQuery(sql);
	
	//[빠른 방법]
	//rs.next();
	//String memno = rs.getString(1);//index 번호 => "1010"
	//String memno = rs.getString("memno");//"별칭" => "1010"
	
	//[정석]
	/*
	String memno = null;
	if(rs.next()) {
		//memno = rs.getString(1);//index 번호 => "1010"
		memno = rs.getString("memno");//"별칭" => "1010"
	}
	*/
	
	//가입일을 오늘날짜로 자동입력
	/* sql = "select TO_CHAR(sysdate,'yyyy-mm-dd') AS hiredate from dual";
	rs = stmt.executeQuery(sql);
	rs.next();
	//String hiredate = rs.getString(1);
	String hiredate = rs.getString("hiredate"); */
	
	/*------------가장 빠른 방법 : 회원번호 + 가입일-----------------------------------------*/
	//insert_fast.jsp에 정리됨
	sql = "select NVL(MAX(memno),0)+1, TO_CHAR(sysdate, 'yyyy-mm-dd') from member";
	rs = stmt.executeQuery(sql);
	rs.next();
	String memno = rs.getString(1);
	String hiredate = rs.getString(2);
	
	%>
	
	<section>
		<div>
			<h2>회원등록</h2>
		</div>
		<form action="insertPro.jsp" name="f" method="post">
			<table class="inserttable">
				<tr>
					<th>회원번호</th>
					<td>
						<%-- <input type="text" name="memno" value="<% out.print(memno); %>" size="10" maxlength="4" readonly>자동입력 --%>
						<input type="text" name="memno" value="<%=memno%>" size="10" maxlength="4" readonly>자동입력
					</td>
				</tr>
				<tr>
					<th>회원이름</th>
					<td>
						<input type="text" name="name" value="" size="15" maxlength="30">
					</td>
				</tr>
				<tr>
					<th>주소</th>
					<td>
						<input type="text" name="address" value="" size="40" maxlength="100">
					</td>
				</tr>
				<tr>
					<th>가입일</th>
					<td>
						<input type="text" name="hiredate" value="<% out.print(hiredate); %>" size="10" maxlength="15" readonly>자동입력
					</td>
				</tr>
				<tr>
					<th>성별</th>
					<td>
						<label><input type="radio" name="gender" value="M" >남자</label>
						<label><input type="radio" name="gender" value="F" >여자</label>
					</td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td>
						<input type="text" name="tel1" value="" size="5" maxlength="3">-
						<input type="text" name="tel2" value="" size="5" maxlength="4">-
						<input type="text" name="tel3" value="" size="5" maxlength="4">
					</td>
				</tr>
				<tr>				
					<th colspan="2">
					    <!-- [submit / button 차이점]
					    	1. submit은 서버로 바로 전송하는 기능이 있고 action을 찾아감. 또한, 일반적으로 스크립트를 사용하지 않고 전송할 경우에 사용함
					    	2. button은 전송하는 기능이 없기때문에 자바스크립트의 함수(=메서드)를 이용하여 전송하는데 이때 그 안에 submit()함수가 있어야한다.
					    -->
					    <!-- [방법-2] type="submit"인 경우 : [회원등록] 클릭하면 insertPro.jsp 로 입력한 데이터가 전송됨
					    이 때, return값을 false로 주면 전송이 안되고 true를 줘야 전송됨 
					    그래서 function check()에서 f.submit();가 없어도 전송됨 -->
					    
					    <!-- 통일 : 타입을 submit, button 아무거나 넣어도 돌아간다. -->
					    <input type="submit" value="회원등록" onclick="check(); return false;">
					    <!-- <input type="button" value="회원등록" onclick="check(); return false;"> --> 
					    
						<!-- 1. 차이점 : 유효성 체크 없이 바로 전송함 -->
						<input type="submit" value="회원등록1" >
						<!-- 2. 차이점 : 유효성 체크하는데 알림창의 [확인] 누르면 true로 인식해서 전송함(끝까지 입력안됨) -->
						<input type="submit" value="회원등록2" onclick="check();">
						<!-- (권장)3. 차이점 : 유효성 체크하는데 "return false;가" [확인] 눌러도 전송이 되지 않게 막아줌(끝까지 입력 가능)
								전송되게 하기 위해 자바스크립트의 함수 이용 check(){f.submit();} -->
						<input type="submit" value="회원등록3" onclick="check(); return false;">
						
						<!-- 4. 전송기능이 없는 버튼 유효성 체크도 없음 -->
						<input type="button" value="4-회원등록" >
						<!-- (권장)5. 유효성 체크하는데 알림창의 [확인] 눌러도 전송안함(이유? 전송기능이 없으므로 => 끝까지 입력됨) 
								전송기능이 없으므로 자바스크립트의 함수 이용 check(){f.submit();} -->
						<input type="button" value="5-회원등록" onclick="check();">
						<!-- 6. return false; 없어도 5.와 같은 결과
							버튼에는 처음부터 전송(submit)기능이 없기때문에 return false;가 있고없고가 중요하지 않다.  -->
						<input type="button" value="6-회원등록" onclick="check(); return false;">
						
						<button>7-회원등록</button>
						<button type="submit">8-회원등록</button><!-- 이 버튼은 submit이 기본타입으로 들어가 있는 형태다. -->
						
						<input type="reset" value="1-초기화">
						<button type="reset">2-초기화</button>
						
						<input type="button" value="조회" onclick="location.href='select.jsp'">
						
					</th>
				</tr>
			</table>
		</form>
	</section>
	<%@ include file="footer.jsp" %> <!-- DB 연결 해제 -->
</body>
</html>

<!-- 
<button>태그 : HTML4.0 표준부터 사용가능
1. <button></button> 기본 : type="submit"
2. <button type="button"></button>
3. <button type="reset"></button>
4. 

[<button>과  <input type="button"> 의 차이점]
1. <input type="reset" value="1-초기화">

2. <button type="reset">2-초기화
	<img src="button.png">
	<span>멋진버튼</span>
	</button>

=> button : 자식 태그를 가질 수 있고 CSS에서 가상 선택자로 꾸며주는 것도 가능함

※ 정리
▪︎  <input/>의 한계를 넘기 위해 나온 것이 <button> 태그이다.
▪︎  <input type="button">을 써도 되지만, <button>을 쓰는 것이 권장된다.
▪︎  <button>은 자식 요소를 가질 수 있기 때문에, 이미지/텍스트/가상 요소 등 다양한 활용이 가능하다.
 -->






