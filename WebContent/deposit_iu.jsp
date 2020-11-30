<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입금 진행 중</title>
</head>
<%
	request.setCharacterEncoding("utf-8");
	String id = (String)session.getAttribute("id");
	String url = "jdbc:mysql://localhost:3306/jspstudy?serverTimezone=UTC";
	String uid = "root"; String pass = "111111";
	String sql = "insert into banktransaction_ values(?, sysdate(), ?, 0, 0, '-')";
	try {
		// money에서 가져오는 값이 숫자로 바꿀 수 없는 타입이라면 예외를 발생시키기 위해서 try 아래에 작성했다.
		int deposit = Integer.parseInt(request.getParameter("money"));
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection(url, uid, pass);
		PreparedStatement stmt = conn.prepareStatement(sql);
		
		stmt.setString(1, id);
		stmt.setInt(2, deposit);
		stmt.executeUpdate(); // banktransaction_ table insert
		
		sql = "update bankmember_ set balance=balance+? where id=?";
		stmt = conn.prepareStatement(sql);
		stmt.setInt(1, deposit);
		stmt.setString(2, id);
		stmt.executeUpdate(); // bankmember_ table update
%>
<script>
	alert("<%=deposit%>원이 입금 완료 되었습니다. 거래내역 조회 화면으로 이동합니다.");
	location.href="mylist.jsp";
</script>
	<% } catch (Exception e) {
		out.print("입금 진행 중에 오류가 발생했습니다. 고객센터로 문의주세요.<p>" + e.getMessage());
	}
%>

</html>