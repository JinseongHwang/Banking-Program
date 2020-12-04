<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>출금 화면</title>
</head>
<%
	String id = (String)session.getAttribute("id");
%>
<body style="background-color: #e0f8f7">
	<div align="center">
		<h2>출금</h2>
		<hr>
		<span style="color: blue"><%=id %></span>님, 얼마를 출금하시겠습니까?
		<jsp:include page="balance.jsp"/><br>
		<hr><p>
		
		<form method="post" action="withdrawal_iu.jsp">
			출금: <input type="text" name="money"/>원 <p>
			<input type="submit" value="출금 진행"/>
		</form>
		<a href="menu.jsp">메뉴로 돌아가기</a>
	</div>
</body>
</html>