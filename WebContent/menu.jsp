<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴</title>
</head>
<%
	String id = (String)session.getAttribute("id");
	if (id == null) { %>
		<script>
			alert("비정상적인 경로입니다. 로그인 부탁 드립니다.");
			location.href="login.jsp";
		</script>
	<% } else { %>
<body style="background-color: lime">
	<h2>전체 메뉴</h2>
	<hr>
	<span style="color: blue"><%=id %></span>님, 어떤 업무를 하시겠습니까? 
	<jsp:include page="balance.jsp"/><br>
	<hr><p>
	
	<ol>
		<li><a href="deposit.jsp">입금</a></li>
		<li><a href="withdrawal.jsp">출금</a></li>
		<li><a href="transfer.jsp">이체</a></li>
		<li><a href="mylist.jsp">나의 거래 내역</a></li>
		<li><a href="member_list.jsp">회원 정보 조회</a></li>
		<li><a href="myinfo.jsp">회원 정보 변경</a></li>
		<li><a href="qa.jsp">게시판 (Q&A)</a></li>
		<% if (id.equals("admin")) { %>
			<li><a href="total_list.jsp">전체 거래 내역(admin only)</a></li>
			<li><a href="qa_admin.jsp">답변 등록(admin only)</a></li>
		<%} %>
		<li><a href="logout.jsp">logout</a></li>
		
	</ol>
</body>
	<%} %>
</html>