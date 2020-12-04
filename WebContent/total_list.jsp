<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[전체 거래 내역]</title>
</head>
<%
	request.setCharacterEncoding("utf-8");
	String url = "jdbc:mysql://localhost:3306/jspstudy?serverTimezone=UTC";
	String uid = "root"; String pass = "111111";
	String sql = "select * from banktransaction_ order by id, tdate desc";
	try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection(url, uid, pass);
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
%>
<body>
	<div align="center">
		<h3>전체 거래 내역(id, 최근일 순)</h3>
		<table width="600" border="1">
			<tr>
				<th>ID</th> <th>거래일시</th> <th>입금액</th> <th>출금액</th> <th>이체여부</th> <th>이체상대</th> 
			</tr>
			<% while (rs.next()) { %>
			<tr>
				<td style="color: blue; font-weight: bold"><%=rs.getString("id") %></td>
				<td><%=rs.getString("tdate") %></td>
				<td style="text-align: right"><%=rs.getString("deposit") %></td>
				<td style="text-align: right"><%=rs.getString("withdrawal") %></td>
				<td><%=rs.getInt("tcode") == 1 ? "이체보냄" : rs.getInt("tcode") == 2 ? "이체받음" : "-" %></td>
				<td><%=rs.getString("transfer_id") %></td>
			</tr>
			<%} %>
		</table> <p>
		<a href="menu.jsp">메뉴로 돌아가기</a>
	</div>
	<%} catch (Exception e) {
		out.print("전체 거래 내역 조회 중 예외 발생. 고객센터로 연락 부탁드립니다. <p>" + e.getMessage());
	}%>
</body>
</html>