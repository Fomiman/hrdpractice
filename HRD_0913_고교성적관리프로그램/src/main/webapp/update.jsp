<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고교성적관리 프로그램</title>
</head>

<script type="text/javascript">
	//유효성 검사 - 값이 비어있는지
	function check() {
	if (!f.syear.value){
		alert("학년을 입력해주세요.");
		return f.syear.focus();
	}
	if (!f.sclass.value){
		alert("반을 입력해주세요.");
		return f.sclass.focus();
	}
	if (!f.sno.value){
		alert("학생번호를 입력해주세요.");
		return f.sno.focus();
	}
	if (!f.sname.value){
		alert("학생이름을 입력해주세요.");
		return f.sname.focus();
	}
	if (!f.birth.value){
		alert("생년월일을 입력해주세요.");
		return f.birth.focus();
	}
	if (f.gender[0].checked == false && f.gender[1].checked == false){
		alert("성별을 선택해주세요.");
		return ;
	}
	if (!f.kor.value){
		alert("전화번호1을 입력해주세요.");
		return f.kor.focus();
	}
	if (!f.eng.value){
		alert("전화번호2을 입력해주세요.");
		return f.eng.focus();
	}
	if (!f.math.value){
		alert("전화번호3을 입력해주세요.");
		return f.math.focus();
	}
	
	f.submit();
} // check()의 끝
	
	function reWrite() {
		var x = confirm("다시 쓰시겠습니까?"); // [확인]==true, [취소]==false
		if(x==true) f.reset();		
		//f.name.focus();
		f.sname.select();
		
		//f.reset();  
		//f.name.focus(); //글자는 그대로 있고 커서 깜빡거림
		//f.name.select(); // 글자에 블럭 설정됨 -> 입력하면 바로 덮어쓰기
	}
</script>

<body>
	<%@ include file="header.jsp" %> <!-- dbcon.jsp(DB 연결) + style.css -->
	
	<% //회원번호로 회원 조회
	String id = request.getParameter("id"); // "1007"
	
	// 학생이름 눌러서 불러왔을때 테이블 하나에 1번 3번 테이블 모두 입력하게 해서 
	// 실행 누르면 두 테이블에 각각 업데이트 되게 만들면 될거 같다.
	
	sql = "select  e1.syear,e1.sclass,e1.sno ,sname, gender, kor, eng, math";
	
	
	// [방법-2] java로 null 처리
	// 두 테이블을 모두 id를 가진 상태로 만들어서 서브쿼리끼리 id를 조건으로 조인시킨뒤에 그걸 불러오는 방법은 어떤지
	sql += " from examtbl_1 e1 full join examtbl_3 e3";
	sql += " on (e1.syear=e3.syear and e1.sclass = e3.sclass and e1.sno =e3.sno)";

	sql += " where id = '" + 1 + "'";
	
	rs = stmt.executeQuery(sql);
	String sname = null;
	String gender = null;
	String kor = null;
	String eng = null;
	String math = null;
	
	if(rs.next()){
		sname = rs.getString("sname"); // id는 위에서 파라미터 값으로 가져왔기때문에 가져올 필요가 없다.
		gender = rs.getString("gender");
		kor = rs.getString("kor");
		eng = rs.getString("eng");
		math = rs.getString("math");
		
		// [방법-2] java로 null 처리 -2 : 여기서 java로 null처리 -> 아래에서 출력만 하면됨
		kor = rs.getString("kor");
		kor = (kor != null? kor : ""); // 여기 괄호는 우선순위 변경용이 아닌 가독성을 위해 넣은 것이다.
		
		eng = rs.getString("eng");
		eng = eng != null? eng : ""; // 대입연산자는 제일 마지막 순위이기 때문에 괄호가 없어도 뒤에 삼항연산자부터 처리된다.
		
		math = rs.getString("math");
		math = math != null? math : "";
	}
	
	%>
	
	<section>
		<div>
			<h2>학생수정</h2>
		</div>
		<form action="updatePro.jsp" name="f" method="post">
			<table class="updatetable">
				<tr>
					<th>학생번호</th>
					<td>
						<input type="text" name="id" value="<%=id%>" size="10" maxlength="4" readonly="readonly">
					</td>
				</tr>
				<tr>
					<th>회원이름</th>
					<td>
						<input type="text" name="sname" value="<%=sname%>" size="15" maxlength="30">
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
						<input type="text" name="kor" value="<%=kor%>" size="5" maxlength="3">-
						<input type="text" name="eng" value="<%=eng%>" size="5" maxlength="4">-
						<input type="text" name="math" value="<%=math%>" size="5" maxlength="4">
						
					</td>
				</tr>
				<tr>				
					<th colspan="2">
					   <input type="submit" value="회원수정" onclick="check(); return false;">
					   <input type="button" value="다시쓰기" onclick="reWrite();">
					</th>
				</tr>
			</table>
		</form>
	</section>
	<%@ include file="footer.jsp" %> <!-- DB 연결 해제 -->
</body>
</html>




