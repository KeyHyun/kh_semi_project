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
	body{
		background-color: #fff;
	}
    .pop{
        width: 300px;
        height: 285px;
        margin: auto;
    }
    div{
        text-align: center;
    }
    .pop>div:first-child{
        width: 100%;
        height: 15%;
        line-height: 50px;
        font-weight: bold;
        font-size: 18px;
        border-bottom: 1px solid black;
        color:green;
    }
      .pop>div:nth-child(2){
      font-size: 12px;
      font-weight: bold;
    }
    input{
        width: 250px;
        height: 100px;
        margin-top: 15px;
    }
    button{
        width: 40%;
        margin-top: 10px;
        height: 30px;
        outline: none;
        background-color: transparent;
    }
    button:first-child{
        color: green;
    }
    button{
    	border:none;
    	outline:none;
    	cursor:pointer;
    }
    .pop>div:nth-child(3){
        border-top: 1px solid black;
        margin-top: 10px;
        padding-bottom : 20px;
        border-bottom: 1px solid rgba(0,0,0,0.2);
    }
	input[type=color]{
	width:40px;
	height:20px;
	}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/insertPersonalList?memberNo=<%=m.getMemberNo()%>" method="post">
	  <div class="pop">
        <div>
			Enter your plan for today
        </div>
        <div>색상 선택 : <input type="color" name="color"></div>
        <div><input type="text" id="listContent" name="list_title"></div>
        <div><button type="submit" id="createBtn">생성</button>
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