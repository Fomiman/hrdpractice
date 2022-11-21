<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
request.setCharacterEncoding("UTF-8");
/* 사용되는 페이지들의 인코딩 타입을 UTF-8로 설정해준다. 자바부분에 적용되는 건가 어딘지 헷갈리는데 일단 적용됨 */

String url = "jdbc:oracle:thin:@localhost:1521/xe";
/* 오라클 서버 접속용 url */

Class.forName("oracle.jdbc.OracleDriver");
/* 오라클을 사용하기 위한 드라이버를 불러옴 */

Connection con = DriverManager.getConnection(url,"system","1234");
/* Connection 객체 생성하여 오라클 서버에 접속 */

/* 이후 sql문 사용하기 위한 객체 2가지 생성 */
Statement stmt = con.createStatement();
PreparedStatement ps = null;

ResultSet rs = null;

/* sql문 자주 사용하기 때문에 미리 만들어준 String 타입 객체 뒤에서 sql문을 넣어서 사용 */
String sql = "";

%>

