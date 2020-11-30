<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입금 화면</title>
</head>
<%
	String id = (String)session.getAttribute("id");
%>
<body style="background-color: #e0f8f7">
	<div align="center">
		<h2>입금</h2>
		<hr>
		<span style="color: blue"><%=id %></span>님, 입금액을 적어주세요.
		<hr><p>
		
		<form method="post" action="deposit_iu.jsp">
			입금: <input type="text" name="money"/>원 <p>
			<input type="submit" value="입금 진행"/>
		</form>
		<a href="menu.jsp">메뉴로 돌아가기</a>
	</div>
</body>
</html>