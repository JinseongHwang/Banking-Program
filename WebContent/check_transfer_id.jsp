<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수신인 아이디 체크</title>
</head>
<%
	request.setCharacterEncoding("utf-8");
	String id = (String)session.getAttribute("id"); // 발신인 아이디
	String transfer_id = request.getParameter("transfer_id"); // 수신인 아이디
	if (id.equals(transfer_id)) { %>
		<script>
			alert("본인이 본인한테 이체하면 안됩니다 ^^;;;");
			location.href="transfer.jsp"
		</script><%
	}
	String transfer_money = request.getParameter("transfer_money");
	String url = "jdbc:mysql://localhost:3306/jspstudy?serverTimezone=UTC";
	String uid = "root"; String pass = "111111";
	String sql = "select * from bankmember_ where id=?";
	try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection(url, uid, pass);
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, transfer_id); // 수신인 아이디 체크
		ResultSet rs = stmt.executeQuery();
		
		if (rs.next()) { %>
			<script>
				// confirm을 만나면 팝업 창을 띄우고, 확인 또는 취소 선택을 할 수 있다.
				// 확인은 true를 반환하고, 취소는 false를 반환한다.
				const answer = confirm("<%=transfer_id%>님께 <%=transfer_money%>원을 이체하시겠습니까?");
				if (answer == true) {
					// get 방식으로 자료를 전송하는 형태이다. ? 뒤에 쿼리를 작성하며, 하나 이상이라면 &로 연결한다.
					location.href="transfer_iu.jsp?transfer_id=<%=transfer_id%>&transfer_money=<%=transfer_money%>";
				} else {
					location.href="transfer.jsp";
				}
			</script>
		<% } else { %>
			<script>
				alert("미등록 수신인 아이디입니다. 수신인 아이디를 확인해 주세요.");
				location.href="transfer.jsp";
			</script>
		<% }
	} catch (Exception e) {
		out.print("수신인 아이디 체크 중에 문제 발생! 고객 센터로 문의 바랍니다! <p>" + e.getMessage());
	}
%>
<body>

</body>
</html>