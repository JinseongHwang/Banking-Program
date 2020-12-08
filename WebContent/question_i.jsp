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
	String question = request.getParameter("question");
	String url = "jdbc:mysql://localhost:3306/jspstudy?serverTimezone=UTC";
	String uid = "root"; String pass = "111111";
	try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection(url, uid, pass);
		PreparedStatement stmt = conn.prepareStatement("select max(no) from bankqa_");
		ResultSet rs = stmt.executeQuery();
		rs.next(); // 현재 no 값들 중 가장 큰 값을 찾음
		
		stmt = conn.prepareStatement("insert into bankqa_ values(?, ?, sysdate(), ?, null, '(답변준비중)')");
		stmt.setInt(1, rs.getInt(1) + 1); // no + 1
		stmt.setString(2, id);
		stmt.setString(3, question);
		stmt.executeUpdate(); // insert
		//response.sendRedirect("qa.jsp");
%>
<script>
	alert("질문이 잘 등록되었습니다 ^^");
	location.href="qa.jsp";
</script>
<%		
	} catch (Exception e) {
		out.print("질문 등록 중 오류 발생. <p>" + e.getMessage());
	}
%>
<body>

</body>
</html>