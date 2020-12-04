<%@ page language="java" contentType ="text/html; charset=UTF-8" pageEncoding ="UTF-8" %>
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
	String sql;
	if (id.equals("admin")) sql = "select * from bankmember_ order by id";
	else if (id.equals("ad_minus")) sql = "select * from bankmember_ where balance<0 order by id";
	else sql = "select * from bankmember_ where id='" + id + "'";
try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection(url, uid, pass);
	Statement stmt = conn.createStatement(); // 3c로 했음. 3p는 나중에
	ResultSet rs = stmt.executeQuery(sql); // select니까 executeQuery (4Q)
%>
<body style="background-color: #f1f1f1">
	<div align="center">
		<h3>회원 정보</h3>
		<table width="600" border="1">
			<tr>
				<th>ID</th> <th>PW</th> <th>이름</th> <th>연락처</th> <th>계좌잔액</th> <th>가입일시</th>
			</tr>
			<%while (rs.next()) { %>
				<tr>
					<td style="color: blue; font-weight: bold"><%=rs.getString("id") %></td>
					<td><%=rs.getString("pw") %></td>
					<td><%=rs.getString("name") %></td>
					<td><%=rs.getString("phone") %></td>
					<td style="color: red; text-align: right"><%=rs.getString("balance") %></td>
					<td><%=rs.getString("indate") %></td>
				</tr>
			<%} %>
		</table><br>
		<a href="menu.jsp">메뉴로 돌아가기</a>
	</div>
<% 
} // try - end
catch (Exception e) {
	out.print("예외상황 발생! 고객센터로 연락 바랍니다.<p>" + e.getMessage());
}
%>
</body>
</html>