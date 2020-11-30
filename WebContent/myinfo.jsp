<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 조회</title>
</head>
<%
	request.setCharacterEncoding("utf-8");
	String id = (String)session.getAttribute("id");
	String url = "jdbc:mysql://localhost:3306/jspstudy?serverTimezone=UTC";
	String uid = "root"; String pass = "111111";
	String sql = String.format("select * from bankmember_ where id='%s'", id);
	try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection(url, uid, pass);
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		rs.next();
%>
<body style="background-color: #f2f2f2">
	<h4><span style="color: blue"><%=id %></span>님의 정보</h4><p>
	<form method="post" action="myinfo_update.jsp">
		PW: <input type="text" name="pw" value="<%=rs.getString("pw")%>"/><p>
		이름: <input type="text" name="name" value="<%=rs.getString("name")%>"/><p>
		폰: <input type="text" name="phone" value="<%=rs.getString("phone")%>"/><p>
		<a href="menu.jsp">메뉴로 돌아가기</a> &nbsp;
		<input type="submit" value="수정">
	</form>
</body>		
	<% } catch (Exception e) { 
		out.print("문제 발생. 고객 센터로 연락주세요! <p>" + e.getMessage());
	}
%>

</html>