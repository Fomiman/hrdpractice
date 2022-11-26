<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%
request.setCharacterEncoding("UTF-8"); //POST 한글 깨짐 방지

//1. 오라클 JDBC 드라이버 호출
Class.forName("oracle.jdbc.OracleDriver");

//2. Connection 객체 생성
String url = "jdbc:oracle:thin:@localhost:1521:xe";
String user = "system";				//접속할 계정명
String password = "1234";

Connection con = DriverManager.getConnection(url, user, password);

//3. 구문 객체 생성 또는 선언
Statement stmt = con.createStatement();
PreparedStatement ps = null;

//4. ResultSet 객체 선언
ResultSet rs = null;

//5. sql 구문 담을 문자열 객체
String sql = "";

%>