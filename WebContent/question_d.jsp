<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<%
	request.setCharacterEncoding("utf-8");
	String no = request.getParameter("no");
	String question = request.getParameter("question");
	String url = "jdbc:mysql://localhost:3306/jspstudy?serverTimezone=UTC";
	String uid = "root"; String pass = "111111";
	try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection(url, uid, pass);
		PreparedStatement stmt = conn.prepareStatement("delete from bankqa_ where no=?");
		stmt.setString(1, no);
		int rows = stmt.executeUpdate();
		if (rows == 1) {
%>
		<script>
			alert("<%=no%>번 질문이 삭제되었습니다.");
			location.href="qa_admin.jsp";
		</script>
<%		} else {
%>
		<script>
			alert("<%=no%>번 질문이 삭제되지 않았습니다. 다시 시도 부탁드립니다.");
			history.back();
		</script>
<%	
		}
	} catch (Exception e) {
		out.print("질문 삭제 중 오류 발생. <p>" + e.getMessage());
	}
%>
</html>