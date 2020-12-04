<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이체 화면</title>
</head>
<%
	String id = (String)session.getAttribute("id");
%>
<body style="background-color: yellow">
	<div align="center">
		<h2>즉시 이체</h2>
		<hr>
		<span style="color: blue"><%=id %></span>님,
		수신인 ID와 이체 금액을 입력해주세요.<br>
		<hr><p>
		
		<form method="post" action="check_transfer_id.jsp">
			수신인ID: <input type="text" name="transfer_id"/>&nbsp;&nbsp;&nbsp;&nbsp;<p>
			이체금액: <input type="text" name="transfer_money"/>원<p>
			<input type="submit" value="이체 진행"/>
		</form>
		<a href="menu.jsp">메뉴로 돌아가기</a><p>
	</div>
</body>
</html>