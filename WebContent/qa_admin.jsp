<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>질문 답변 관리</title>
</head>
<%
	String id = (String)session.getAttribute("id");
	String url = "jdbc:mysql://localhost:3306/jspstudy?serverTimezone=UTC";
	String uid = "root"; String pass = "111111";
	try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection(url, uid, pass);
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select * from bankqa_ order by no");
%>
<body>
	<h2>게시판 (관리자용)</h2>
	<hr>
	<span style="color: blue">관리자</span>님, 답변을 작성해 주세요.<br>
	<hr><p>
	<form method="post" action="question_d.jsp">
		<table width=900 border="1">
			<tr style="background-color: navy; color: yellow">
				<th>del</th> <th>no</th> <th>ID</th> <th>질문일시</th> <th>질문내용</th> <th>답변일시</th> <th>답변내용</th> 
			</tr>
			<% while (rs.next()) { %>
			<tr>
				<td><input type="radio" name="no" value="<%=rs.getString("no") %>"/></td>
				<th><%=rs.getString("no") %></th>
				<td><%=rs.getString("id") %></td>
				<td style="color: gray; font-size: 0.8em"><%=rs.getString("qdate") %></td>
				<td><%=rs.getString("question") %></td>
				<td style="color: gray; font-size: 0.8em"><%=rs.getString("adate") == null ? "(soon)" : rs.getString("adate") %></td>
				<td style="color: navy; font-size: 0.9em"><%=rs.getString("answer") %></td>
			</tr>
			<% } %>
		</table><p>
		<input type="submit" value="선택삭제" style="background-color: aqua"/>
	</form>
	<br><br>
	<form method="post" action="answer_u.jsp">
		답변 입력: <br>
		no: <input type="number" name="no" size=3 required><br>
		<textarea name="answer" rows=4 cols=50 required></textarea>
		<input type="submit" value="답변등록"/>
	</form><p>
	<a href="menu.jsp">메뉴로 돌아가기</a>
	<% } catch (Exception e) {
		out.print("질문 답변 조회 중 오류: <br>" + e.getMessage());
	}
%>
</body>
</html>