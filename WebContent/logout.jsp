<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그아웃</title>
</head>
<%
	String id = (String)session.getAttribute("id");
	session.invalidate();
%>
<script>
	alert("<%=id%>님께서 로그아웃 하셨습니다.");
	location.href="login.jsp";
</script>
</html>