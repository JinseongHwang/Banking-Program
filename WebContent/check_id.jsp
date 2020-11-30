<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String url = "jdbc:mysql://localhost:3306/jspstudy?serverTimezone=UTC";
	String uid = "root"; String pass = "111111";
	// String sql = String.format("select * from bankmember_ where id='%s'", id);
	// 3c로 변경 시
	String sql = "select * from bankmember_ where id=?";
try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection(url, uid, pass);
	//Statement stmt = conn.createStatement(); // 3c로 했음. 3p는 나중에
	//ResultSet rs = stmt.executeQuery(sql); // select니까 executeQuery (4Q)
	// 3c로 변경 시
	PreparedStatement cre = conn.prepareStatement(sql);
	cre.setString(1, id); // 사이에서 물음표 채우기
	ResultSet rs = cre.executeQuery();
	
	if (rs.next()) {
		session.setAttribute("id", id);
		session.setMaxInactiveInterval(60*60); // 1시간(default: 30분)
		response.sendRedirect("menu.jsp");
	} else {
%>
<script>
	alert("<%= id%>는 미등록 아이디입니다. 확인 후 로그인 부탁드리겠습니다.");
	location.href="login.jsp";
</script>
<% } // else 
} catch (Exception e) { 
	out.print("아이디 체크 문제... 고객 센터로 연락주세요~ " + e.getMessage());
} %>
</html>