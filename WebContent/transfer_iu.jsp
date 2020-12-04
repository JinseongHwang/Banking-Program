<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이체 진행중</title>
</head>
<%
	request.setCharacterEncoding("utf-8");
	String id = (String)session.getAttribute("id");
	String transfer_id = request.getParameter("transfer_id");
	String url = "jdbc:mysql://localhost:3306/jspstudy?serverTimezone=UTC";
	String uid = "root"; String pass = "111111";
	try {
		int transfer_money = Integer.parseInt(request.getParameter("transfer_money"));
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection(url, uid, pass);
		
		// 발신인 출금 insert, update
		PreparedStatement stmt = conn.prepareStatement("insert into banktransaction_ values(?, sysdate(), 0, ?, 1, ?)");
		stmt.setString(1, id);
		stmt.setInt(2, transfer_money);
		stmt.setString(3, transfer_id);
		stmt.executeUpdate(); // insert
		stmt = conn.prepareStatement("update bankmember_ set balance=balance-? where id=?");
		stmt.setInt(1, transfer_money);
		stmt.setString(2, id);
		stmt.executeUpdate(); // update
		
		// 수신인 입금 insert, update
		stmt = conn.prepareStatement("insert into banktransaction_ values(?, sysdate(), ?, 0, 2, ?)");
		stmt.setString(1, transfer_id);
		stmt.setInt(2, transfer_money);
		stmt.setString(3, id);
		stmt.executeUpdate(); // insert
		stmt = conn.prepareStatement("update bankmember_ set balance=balance+? where id=?");
		stmt.setInt(1, transfer_money);
		stmt.setString(2, transfer_id);
		stmt.executeUpdate(); // update
		%>
		<script>
			alert("<%=transfer_id%>님께 <%=transfer_money%>원이 이체되었습니다! 거래 내역 조회 화면으로 이동합니다.");
			location.href="mylist.jsp";
		</script>
	<% } catch (Exception e) {
		out.print("이체 진행 중 오류가 발생했습니다. 고객 센터로 문의 바랍니다. <p>" + e.getMessage());
	}
%>
<body>

</body>
</html>