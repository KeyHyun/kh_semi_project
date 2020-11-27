<%@page import="member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%
    Member m = (Member)session.getAttribute("member");
    %>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>

<style>
   .nav{
      width: 1200px;
        margin: 0 auto;
   }
    .nav-wrap {
        position: absolute;
        z-index: 10;
        width: 1200px;
        overflow: hidden;
        margin: 0 auto;
        font-family: Roboto;
        background-color: #fff;
    }

    .nav-left {
        margin-top: 20px;
        width: calc(100%/6);
        height: 100%;
        float: left;
        text-align: center;
    }

    .nav-center {
        width: calc((100%/3)*2);
        float: left;
    }

    .nav-right {
        width: calc(100%/6);
        float: left;
        overflow: hidden;
    }

    .nav-right>div {
        width: calc(100%/2);
        float: left;
        text-align: center;
        line-height: 100px;
    }
    .nav-right>div>a{
        color: black;
    }

    ul {
        list-style-type: none;
    }

    a {
        text-decoration: none;
    }

    .nav-center>ul {
        overflow: hidden;
        margin: 0;
        padding-left: 0;
    }

    .nav-center>ul>li {
        float: left;
        width: calc(100%/4);
        text-align: center;
    }

    .nav-center>ul>li>a {
        display: inline-block;
        width: 100%;
        height: 100px;
        line-height: 100px;
        font-weight: bold;
        font-size: 18px;
        color: black;
    }

    .nav-sub {
        width: 100%;
        padding: 0;
        display: none;
        position: relative;
    }

    .nav-sub>li {
        width: 100;
    }

    .nav-sub>li>a {
        display: inline-block;
        width: 100%;
        height: 40px;
        font-weight: bold;
        font-size: 15px;
        color: black;
        line-height: 30px;
    }

    .nav-center>ul>li:hover>a {
        cursor: pointer;
    }
</style>

<body>
   <div class="nav">
      <div class="nav-wrap">
          <div class="nav-left">
              <a href="index.jsp"><img src="img/navi_logo.png" width="140px" height="70px"></a>
          </div>
          <div class="nav-center">
              <ul>
                  <li>
                      <a href="#">My Plan</a>
                      <ul class="nav-sub">
                          <li><a href="#">개인스터디</a></li>
                          <li><a href="#">그룹스터디</a></li>
                      </ul>
                  </li>
                  <li>
                      <a href="/groupStudyList?reqPage=1">스터디 찾기</a>
                  </li>
                  <li>
                      <a href="#">이벤트</a>
                      <ul class="nav-sub">
                          <li><a href="#">이달의 이벤트</a></li>
                          <li><a href="#">이벤트 당첨자 조회</a></li>
                      </ul>
                  </li>
                  <li>
                      <a href="#">고객센터</a>
                  </li>
              </ul>
          </div>
          <div class="nav-right">
             <%if(m == null) {%>
              <div>
                  <a href="#">로그인</a>
               </div>
               <div>
                   <a href="#"> 회원가입</a>
               </div>
              <%}else {%>
              <div>
                 <img src="/img/login_logo1.png">
              </div>
              <div>
                 <img src="/img/login_logo2.png">
              </div>
              <%} %>
          </div>
      </div>
   </div>
   <script>
       $(".nav-center").hover(function () {
           $(".nav-sub").slideToggle();
       }, function () {
           $(".nav-sub").slideToggle();
       });
       $(".nav-right>div>img").hover().css("cursor","pointer");
   </script>
</body>