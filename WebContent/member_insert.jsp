<%@ page language="java" contentType ="text/html; charset=UTF-8" pageEncoding ="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member_insert</title>
</head>
<body style="background-color:#f5ecce">
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String phone = request.getParameter("phone");
	String url = "jdbc:mysql://localhost:3306/jspstudy?serverTimezone=UTC";
	String uid = "root"; String pass = "111111";
	// varchar 타입 값 넣어줄 때 작은 따옴표 붙이는거 빼먹지말자 -> 저거 때문에 날린 내 시간 어디감?
	String sql = String.format("INSERT INTO bankmember_ VALUES ('%s', '%s', '%s', '%s', 0, sysdate())", id, pw, name, phone);
try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection(url, uid, pass);
	Statement stmt = conn.createStatement();
	stmt.executeUpdate(sql); // i/u/d 할 때는 executeUpdate 해야한다.
	session.invalidate();
%>
<script>
	alert("환영합니다, <%=id %>님!! (로그인 화면으로 이동합니다.)");
	location.href="login.jsp";
</script>
<% 
} // try - end
catch (Exception e) { %>
	<span style="color: gray; font-size: 0.5em;">
		<%=e.getMessage() %>
	</span><p>
	<%-- include 지시자를 사용한 경우
	<%@ include file="catch.jsp" %> --%>
	<%-- Action Tag를 사용한 경우 --%>
	<jsp:include page="catch.jsp"/>
	
<%} %>
</body>
</html>