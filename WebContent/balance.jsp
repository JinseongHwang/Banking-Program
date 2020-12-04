<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<%
	request.setCharacterEncoding("utf-8");
	String id = (String)session.getAttribute("id");
	String url = "jdbc:mysql://localhost:3306/jspstudy?serverTimezone=UTC";
	String uid = "root"; String pass = "111111";
	// NO가 아니라 N0(N + zero)이다.
	String sql = "select format(balance, 'N0') from bankmember_ where id=?";
	try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection(url, uid, pass);
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, id);
		ResultSet rs = stmt.executeQuery();
		rs.next();
%>
<body>
	<span style="color: blue; font-size: 0.8em">(잔액: <%=rs.getString(1) %>원)</span>
<%
	} catch (Exception e) {
		out.print("잔액 가져오는 도중 문제 발생. 고객센터로 연락주세요. <p>" + e.getMessage());
	}
%>
</body>
</html>