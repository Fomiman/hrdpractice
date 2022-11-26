<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑몰관리 프로그램</title>
</head>

<script type="text/javascript" src="check.js"> </script>

<script type="text/javascript" >
	function reWrite() {
			
	var x = confirm("다시 쓰시겠습니까?"); // [확인]==true, [취소]==false
		if (x == true)
			f.reset();
		//f.name.focus();
		f.name.select();

		//f.reset();  
		//f.name.focus(); //글자는 그대로 있고 커서 깜빡거림
		//f.name.select(); // 글자에 블럭 설정됨 -> 입력하면 바로 덮어쓰기
	}
</script>

<body>
	<%@ include file="header.jsp" %> <!-- dbcon.jsp(DB 연결) + style.css -->
	
	<% //회원번호로 회원 조회
	String memno = request.getParameter("memno"); // "1007"
	
	
	sql = "select memno, name, address,";
	sql += " TO_CHAR(hiredate, 'yyyy-mm-dd') as hiredate,";
	sql += " gender,"; // 값을 그대로 가져와야 한다.(이유? html에서 value="M","F"로 값 비교 후 selected해야하므로)
	
	// [방법-1] NVL로 null 처리
	//sql += " NVL(tel1,' ') as tel1 ,NVL(tel2,' ') as tel2 ,NVL(tel3,' ') as tel3"; // ''는 null과 같다. // sql로 null 처리하기 
	// [방법-2] java로 null 처리
	sql += " tel1,tel2,tel3"; // 아래에서 java로 null 처리함
	
	sql += " from member";
	sql += " where memno = '" + memno + "'";
	
	rs = stmt.executeQuery(sql);
	String name = null;
	String address = null;
	String hiredate = null;
	String gender = null;
	String tel1 = null;
	String tel2 = null;
	String tel3 = null;
	
	if(rs.next()){
		name = rs.getString("name"); // memno는 위에서 파라미터 값으로 가져왔기때문에 가져올 필요가 없다.
		address = rs.getString("address");
		hiredate = rs.getString("hiredate");
		gender = rs.getString("gender");
		
		//[방법-1] nvl()로 null 처리 후 공백제거
		/* tel1 = rs.getString("tel1").trim();
		tel2 = rs.getString("tel2").trim();
		tel3 = rs.getString("tel3").trim(); */
		
		// [방법-2]-1 java로 null 처리 -1 : 아래에서 java로 null처리
		tel1 = rs.getString("tel1");
		tel2 = rs.getString("tel2");
		tel3 = rs.getString("tel3");
		
		// [방법-2] java로 null 처리 -2 : 여기서 java로 null처리 -> 아래에서 출력만 하면됨
		tel1 = rs.getString("tel1");
		tel1 = (tel1 != null? tel1 : ""); // 여기 괄호는 우선순위 변경용이 아닌 가독성을 위해 넣은 것이다.
		
		tel2 = rs.getString("tel2");
		tel2 = tel2 != null? tel2 : ""; // 대입연산자는 제일 마지막 순위이기 때문에 괄호가 없어도 뒤에 삼항연산자부터 처리된다.
		
		tel3 = rs.getString("tel3");
		tel3 = tel3 != null? tel3 : "";
	}
	
	%>
	
	<section>
		<div>
			<h2>회원수정</h2>
		</div>
		<form action="updatePro.jsp" name="f" method="post">
			<table class="updatetable">
				<tr>
					<th>회원번호</th>
					<td>
						<input type="text" name="memno" value="<%=memno%>" size="10" maxlength="4" readonly="readonly">
					</td>
				</tr>
				<tr>
					<th>회원이름</th>
					<td>
						<input type="text" name="name" value="<%=name%>" size="15" maxlength="30">
					</td>
				</tr>
				<tr>
					<th>주소</th>
					<td>
						<input type="text" name="address" value="<%=address%>" size="40" maxlength="100">
					</td>
				</tr>
				<tr>
					<th>가입일</th>
					<td>
						<input type="text" name="hiredate" value="<%=hiredate%>" size="10" maxlength="15" readonly>
					</td>
				</tr>
				<tr>
					<th>성별</th>
					<td>
						<label><input type="radio" name="gender" value="M" 
						<% if(gender!=null && gender.equals("M")){out.print("checked='checked'");} %>>남자</label>
						
						<%-- <label><input type="radio" name="gender" value="M" 
						<% if(gender!=null && gender.equals("M")){out.print("checked");} %>>남자</label> --%>
						
						<!-- jsp 파일 -> 서블릿(=java파일)으로 변경 -> class로 -->
						<label><input type="radio" name="gender" value="F" <%= gender!=null && gender.equals("F")?"checked":"" %> >여자</label>
						<%-- <label><input type="radio" name="gender" value="F" <%out.print(gender!=null && gender.equals("F")?"checked":"" ); %> >여자</label> --%>
					
					</td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td>
						<!-- [방법-1] SQL=> nvl()로 null 처리 후 공백제거 , [방법-2] java로 null 처리 -2 -->
						<input type="text" name="tel1" value="<%=tel1%>" size="5" maxlength="3">-
						<input type="text" name="tel2" value="<%=tel2%>" size="5" maxlength="4">-
						<input type="text" name="tel3" value="<%=tel3%>" size="5" maxlength="4">
						
						<!-- [방법-2] java로 null 처리 -1 -->
						<%-- 
						<input type="text" name="tel1" value="<%=tel1==null?"":tel1%>" size="5" maxlength="3">-
						<input type="text" name="tel2" value="<%=tel2==null?"":tel2%>" size="5" maxlength="4">-
						<input type="text" name="tel3" value="<%=tel3==null?"":tel3%>" size="5" maxlength="4"> 
						--%>
					</td>
				</tr>
				<tr>				
					<th colspan="2">
					   <input type="submit" value="회원수정" onclick="check(); return false;">
					   <input type="reset" value="다시쓰기-1">
					   <input type="button" value="다시쓰기-2" onclick="reWrite();">
					</th>
				</tr>
			</table>
		</form>
	</section>
	<%@ include file="footer.jsp" %> <!-- DB 연결 해제 -->
</body>
</html>




