<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%
	String id=null;
	
	
	
	String driver = "org.mariadb.jdbc.Driver";
    String url = "jdbc:mysql://localhost:3306/testdb3";
    
    
    Class.forName(driver);
    Connection conn = DriverManager.getConnection(url,"java","java");      
    Statement stmt = conn.createStatement();
    
    String sql = "SELECT * From member";		
	ResultSet rs = stmt.executeQuery(sql);	
	
	

%>
<html>
<head>
<title>회원관리 시스템 관리자모드(회원 목록 보기)</title>
<style>
	table{
		margin : auto;
		width : 400px;
		border : 1px solid gray;
		text-align: center;
	}
	.td_title{
		font-weight: bold;
		font-size: x-large;
	}
</style>
</head>
<body>
<table>
	<tr><td colspan=2 class="td_title">회원 목록</td></tr>
	<%while(rs.next()){%>
	<tr>
		<td>
			<a href="member_info.jsp?id=<%=rs.getString(1) %>">
				<%=rs.getString(1) %>
			</a>
		</td>
		<td>
		    <a href="member_delete.jsp?id=<%=rs.getString(1) %>">삭제</a>
		</td>
	</tr>
	<%} %>
</table>
</body>
</html>
