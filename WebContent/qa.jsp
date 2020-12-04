<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
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
<body style="background-color: #f8ece0">
	<h2>게시판 (Q&A)</h2>
	<hr>
	<span style="color: blue"><%=id %></span>님, 궁금하신 점이 있으세요? 질문을 주시면 답을 해드립니다.<br>
	<hr>
	<table width=900 border="1">
		<tr style="background-color: navy; color: yellow">	
			<th>no</th> <th>ID</th> <th>질문일시</th> <th>질문내용</th> <th>답변일시</th> <th>답변내용</th> 
		</tr>
		<% while (rs.next()) { %>
		<tr>
			<th><%=rs.getString("no") %></th>
			<td><%=rs.getString("id") %></td>
			<td style="color: gray; font-size:0.8em"><%=rs.getString("qdate") %></td>
			<td><%=rs.getString("question") %></td>
			<td style="color: gray; font-size: 0.8em"><%=rs.getString("adate")==null ? "(soon)" : rs.getString("adate") %></td>
			<td style="color: navy; font-size: 0.9em"><%=rs.getString("answer") %></td>
		</tr>
		<% } %>
	</table>
	<p>
	<form method="post" action="question_i.jsp">
		<!-- required: 빈칸으로 submit 못하게 설정 -->
		질문 입력:<br><textarea name="question" rows="4" cols="50" required></textarea>
		<input type="submit" value="질문등록" style="background-color: lime"/>
	</form>
	<p>
	<a href="menu.jsp">메뉴로 돌아가기</a>
	<%} catch (Exception e) { 
		out.print("질문답변 조회 중 오류: <br>" + e.getMessage());
	} %>
</body>
</html>