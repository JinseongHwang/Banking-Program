<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 변경</title>
</head>
<%
	request.setCharacterEncoding("utf-8");
	String id = (String)session.getAttribute("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String phone = request.getParameter("phone");
	String url = "jdbc:mysql://localhost:3306/jspstudy?serverTimezone=UTC";
	String uid = "root"; String pass = "111111";
	// set하는 데이터들과 where 사이에 ',' 찍어서 오류 발생했었음. 조심하자.
	String sql = "update bankmember_ set pw=?, name=?, phone=? where id=?";
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection(url, uid, pass);
		PreparedStatement pre = conn.prepareStatement(sql);
		pre.setString(1, pw);
		pre.setString(2, name);
		pre.setString(3, phone);
		pre.setString(4, id);
		pre.executeUpdate();
%>
<script>
	alert("<%=id%>님의 정보가 수정 완료되었습니다.");
	location.href="myinfo.jsp";
</script>
<%} catch (Exception e) {
		out.print("회원 정보 변경 중 문제 발생. 고객 센터로 연락주세요. <p>" + e.getMessage());
}%>
	
</html>