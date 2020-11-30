<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 거래 내역</title>
</head>
<%
	request.setCharacterEncoding("utf-8");
	String id = (String)session.getAttribute("id");
	String url = "jdbc:mysql://localhost:3306/jspstudy?serverTimezone=UTC";
	String uid = "root"; String pass = "111111";
	String sql = "select * from banktransaction_ where id=? order by tdate desc";
	try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection(url, uid, pass);
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, id);
		ResultSet rs = stmt.executeQuery();
%>
<body style="background-color: aqua">
	<div align="center">
		<h4><span style="color: blue"><%=id %></span>님의 거래 내역(최근일순)</h4>
		<table border="1">
			<tr>
				<th>거래일시</th> <th>입금액</th> <th>출금액</th> <th>이체여부</th> <th>이체상태</th>
			</tr>
			<% while (rs.next()) { %>
			<tr>
				<td><%=rs.getString("tdate") %></td>
				<td style="color: blue; text-align: right"><%=rs.getString("deposit") %></td>
				<td style="color: red; text-align: right"><%=rs.getString("withdrawal") %></td>
				<td><%=rs.getInt("tcode") == 1 ? "이체보냄" : rs.getInt("tcode") == 2 ? "이체받음" : "-" %></td>
				<td><%=rs.getString("transfer_id") %></td>
			</tr>
			<%} %>
		</table><p>
		<a href="menu.jsp">메뉴로 돌아가기</a><p>
	</div>
</body>
	<%} catch (Exception e) {
		out.print("거래 내력 조회 중 문제 발생. 고객 센터로 연락바랍니다. <p>" + e.getMessage());
	}
	%>
</html>