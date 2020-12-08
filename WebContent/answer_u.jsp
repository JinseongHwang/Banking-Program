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
	String no = request.getParameter("no");
	String answer = request.getParameter("answer");
	String question = request.getParameter("question");
	String url = "jdbc:mysql://localhost:3306/jspstudy?serverTimezone=UTC";
	String uid = "root"; String pass = "111111";
	try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection(url, uid, pass);
		PreparedStatement stmt = conn.prepareStatement("select * from bankqa_ where no=?");
		stmt.setString(1, no);
		ResultSet rs = stmt.executeQuery();
		if (rs.next()) {
			stmt = conn.prepareStatement("update bankqa_ set answer=?, adate=sysdate() where no=?");
			stmt.setString(1, answer);
			stmt.setString(2, no);
			stmt.executeUpdate();
			%>
			<script>
				alert("답변이 등록되었습니다.");
				location.href="qa_admin.jsp";
			</script>
		<% } else { %>
			<script>
				alert("<%=no %>번은 존재하지 않는 질문번호입니다. 확인 부탁드립니다.");
				history.back();
			</script>
		<% }
	} catch (Exception e) {
		out.print("답변 작성 중 오류: <p>" + e.getMessage());
	}
%>
<body>

</body>
</html>