<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
    	String chkResult = (String)request.getAttribute("msg");
    	String id = (String)request.getAttribute("id");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="/js/login.js" defer></script>
<link rel="stylesheet" type="text/css" href="/css/login.css">
<title>로그인</title>
</head>
<body>
	<form action="/login" method="post">
		<div class="login_container">
			<div class="logo_container">
				<img src="/img/logo.png">
			</div>
			<div class="login_box">
				<span>아이디</span>
				<%if(id != null){ %>
				<input type="text" id="id_Input" name="loginId" value="<%=id %>"
					required autofocus>
				<%}else{ %>
				<input type="text" id="id_Input" name="loginId" required>
				<%} %>

			</div>
			<div class="login_box">
				<span>비밀번호</span><input type="password" id="pass_Input"
					name="loginPw" required>
			</div>
			<%if(chkResult != null){ %>
			<span id="chkResult"><%=chkResult %></span>
			<%}else{ %>
			<span id="chkResult"></span>
			<%} %>
			<div class="button_box">
				<button type="submit">로그인</button>
			</div>
			<div class="find_box">
				<span><a href="/views/find.jsp">아이디 또는 비밀번호 찾기 / </a></span> <span><a
					href="/joinFrm">회원가입</a></span>
			</div>
		</div>
	</form>

</body>
</html>