<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%
request.setCharacterEncoding("UTF-8");
String id = request.getParameter("id");
String driver = "org.mariadb.jdbc.Driver";
String url = "jdbc:mysql://localhost:3306/testdb3";

Class.forName(driver);
Connection conn = DriverManager.getConnection(url, "java", "java");
Statement stmt = conn.createStatement();
String sql = "SELECT * From member where id='"+id+"'";
ResultSet rs = stmt.executeQuery(sql);
%>
<html>
<head>
<title>회원 관리 시스템 관리자모드(회원 정보 보기)</title>
<style>
	table{
		margin : auto;
		width : 400px;
		border : 1px solid gray;
		text-align: center;
	}
</style>
</head>
<body>
<table>
<%while(rs.next()) {%>
	<tr>
		<td>아이디 : </td>
		<td><%=rs.getString(1) %></td>
	</tr>
	<tr>
		<td>비밀번호 :</td>
		<td><%=rs.getString(2) %></td>
	</tr>
	<tr>
		<td>이름 : </td>
		<td><%=rs.getString(3) %></td>
	</tr>
	<tr>
		<td>나이 :</td><td><%=rs.getInt(4) %></td>
	</tr>
	<tr>
		<td>성별 :</td><td><%=rs.getString(5) %></td>
	</tr>
	<tr>
		<td>이메일 주소 : </td>
		<td><%=rs.getString(6)%></td>
	</tr>
	<%} %>
	<tr>
		<td colspan=2><a href="member_list.jsp">리스트로 돌아가기 </a></td>
	</tr>
</table>
</body>
</html>
