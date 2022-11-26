<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!--  한글 처리가 제대로 되기 위해서는 "클라이언트(브라우저)문자처리방식과=서버에서 문자처리방식
톰캣 서버(기본:UTF-8)로 전송되는 한글파라미터 값이 제대로 처리되기 위해서는 인코딩 방식을 UTF-8로 지정해야한다. -->
<!-- @ page == 페이지 지시자 -->

<%@ page import="java.sql.*"%>

<!-- get 방식은 주석 표시줄에 입력된 것들이 다 보이기 때문에 보안이 필요할때는 사용하면 안된다.  
서블릿이라는 옛날에 사용한 방식이 있는데 이름만 대충 알아놓자-->

<%
request.setCharacterEncoding("UTF-8"); //POST 방식의 한글 깨짐 방지위해 (※get방식은 안해도됨)

// 1. 오라클 드라이버 로딩하기 : ojdbc6.jar 안에 있음
Class.forName("oracle.jdbc.OracleDriver"); //throws ClassNotFoundException 예외발생 가능성 있으므로 try~catch로 잡아주면 좋지만 실기에서는 생략

// 2. Connection 객체 생성 : rt.jar(java.sql.*)안에 아래 클래스 파일들이 있음
Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "1234");

		//----------------이 아래는 옵션으로 추가한 내용-------------------------------------
// +) 3. 구문 객체 생성
/* 
[Statement 객체]는 메모리에 동적 생성=필요하면 그때그때 생성
- 넘겨주는 SQL문은 단순 문자열이기 때문에 DBMS로 넘겨주면 DBMS가 그 "SQL문자열"을 쿼리로 컴파일하느라 시간이 오래걸림
- select(조회)할 때 사용하면 '개발자 입장에서' 편리

[PreparedStatement 객체]는 메모리에 상주
- "SQL문자열"을 컴파일된 상태로 DBMS에 넘겨주기 때문에 Statement보다 속도가 빠르다.
- insert(추가), update(수정), delete(삭제) 할때 사용하면 '개발자 입장에서' 편리
*/
Statement stmt = con.createStatement(); // SQL문이 없는 빈 구문객체 생성
PreparedStatement ps = null; // 참조하는 객체가 없다. SQL문이 있어야만 PreparedStatement 객체가 생성가능하기 때문에 여기서는 선언만 해둔다.
PreparedStatement ps2 = null; 
// +)PreparedStatement는 인터페이스다. 
  
// +) 4. 결과셋(ResultSet) 선언 : select(조회)결과로 ResultSet 리턴받음
ResultSet rs = null;
ResultSet rs2 = null;

// +) 5. 쿼리문 선언
// String sql = null ;
String sql = ""; //값이 없는 String 객체를 참조
		
		
%>







