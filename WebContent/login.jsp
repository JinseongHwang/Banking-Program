<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BANK</title>
</head>
<body style="background-color: #f8ece0">
	<span style="color: gray; fond-size: 0.7em;">
		총 회원: ~명
	</span>
	<div align="center">
		<h1>Van Gogh BANK</h1>
		<form method="post" action="check_id.jsp">
			ID: <input type="text" name="id"><p>
			<input type="submit" value="login">&nbsp;&nbsp;
			<a href="member.html">회원가입</a><p>
		</form>
		<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/b/b4/Vincent_Willem_van_Gogh_128.jpg/300px-Vincent_Willem_van_Gogh_128.jpg" 
			width="280" height="330" alt="반 고흐의 해바라기(출처: 한국 위키백과)">
	</div>
</body>
</html>