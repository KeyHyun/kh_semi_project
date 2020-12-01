<%@page import="member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    Member m = (Member)session.getAttribute("member");
    %>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
<!DOCTYPE html>
<html>
<head>
<style>
    .pop{
        width: 300px;
        height: 350px;
        border: 1px solid black;
    }
    div{
        text-align: center;
    }
    .pop>div:first-child{
        width: 100%;
        height: 20%;
        line-height: 65px;
        font-weight: bold;
        font-size: 18px;
        border-bottom: 1px solid black;
    }
    input{
        width: 250px;
        height: 200px;
        margin-top: 15px;
    }
    button{
        width: 40%;
        margin-top: 10px;
        height: 30px;
        outline: none;
        background-color: white;
    }
    button:first-child{
        color: green;
    }
    .pop>div:nth-child(3){
        border-top: 1px solid black;
        margin-top: 10px;
    }

</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/insertPersonalList?memberNo=<%=m.getMemberNo()%>" method="post">
	  <div class="pop">
        <div>To do List 생성</div>
        <div><input type="text" id="listContent"></div>
        <div><button type="submit">생성</button>
        <button id="rejectBtn">취소</button></div>
    </div>
	</form>
  <script>
  	$(function(){
  		$("#rejectBtn").click(function(){
  			window.close();
  		});
  	})
  </script>
</body>
</html>