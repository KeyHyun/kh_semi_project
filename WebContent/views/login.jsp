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
 <meta name="google-signin-scope" content="profile email">
    <meta name="google-signin-client_id" content="933752867537-c41ib5spq1iea0nqonfrnq807nohmj67.apps.googleusercontent.com">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="/js/login.js" defer></script>
<link rel="stylesheet" type="text/css" href="/css/login.css">
<script src="https://apis.google.com/js/platform.js" async defer></script>
<script type="text/javascript"
		src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
		charset="utf-8"></script>
<title>로그인</title>
<style>
</style>
</head>
<body>
	<form action="/login" method="post">
		<div class="login_container">
			<div class="logo_container">
				<a href="/index.jsp"><img src="/img/logo.png"></a>
			</div>
			<div class="login_box">
				<span>아이디</span>
				<%if(id != null){ %>
				<input type="text" id="id_Input" name="loginId" value=""
					required>
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