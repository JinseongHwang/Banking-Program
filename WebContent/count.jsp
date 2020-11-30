<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<%
request.setCharacterEncoding("utf-8");
String url = "jdbc:mysql://localhost:3306/jspstudy?serverTimezone=UTC";
String uid = "root"; String pass = "111111";
String sql = "select count(id) from bankmember_";

try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection(url, uid, pass);
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
	rs.next();	
%>
<span style="color: blue; font-size: 0.8em">총 회원: <%=rs.getInt(1) %>명</span>
<%
} catch (Exception e) {
	out.print("총 회원 수 가져오는 도중 문제 발생. 고객 센터로 연락주세요. <p>" + e.getMessage());
}

%>

</html>