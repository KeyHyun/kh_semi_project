<%@page import="personalstudy.model.vo.PersonalStudyTask"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	ArrayList<PersonalStudyTask> pstl = (ArrayList<PersonalStudyTask>)request.getAttribute("pstl");
    	ArrayList<PersonalStudyTask> gpstl = (ArrayList<PersonalStudyTask>)request.getAttribute("gpstl");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        .wrap {
            width: 1200px;
            margin: 0 auto;
        }

        .header {
            width: 1200px;
            height: 100px;
            background: green;
        }

        .myplan {
            overflow: hidden;
        }

        .leftMenu {
            width: 182px;
            height: 920px;

            background: #E1E1E1;

            float: left;
        }

        .participatingGroup {
            float: left;
            height: 920px;
        }

        .groupListTitle {
            width: 1018px;
            height: 53px;
            line-height: 53px;
            color: white;
            font-weight: bold;
            background: #6ED078;
        }
      /*------------------------------여기부터 내가 건드린 css---------------------------------------------*/
      	.timeInputs>img {
        	margin-right:7px;
        }
        
        .timeInputs{
        	height:53px;
        	float:right;
        	line-height:55px;
        }
        #timeInput{
        	width:130px;
        	height:40px;
        	outline:none;
        	font-size:22px;
        	border: 3px solid #fff;
        	border-radius: 10px;
        }
        #timeSet{
        	width:50px;
        	height: 50px;
        	background-color: #6ED078;
        	outline:none;
        	border:none;
        }
/*------------------------------여기까지 내가 건드린 css---------------------------------------------*/

        .groupList {
            width: 1018px;
            height: 867px;
            display: flex;
            background: #FDFDFD;
        }

        .leftMenuList {
            padding: 0;
            margin: 0;
            list-style-type: none;
            text-indent: 25px;
            line-height: 58px;
        }

        .leftMenuA {
            display: block;
            width: 100%;
            height: 58px;
            color: black;
            font-size: 13px;
            font-weight: bold;
            text-decoration: none;
        }

        .leftMenuA:hover {
            color: black;
            text-decoration: none;
        }

        .leftMenuList>li:first-child {
            text-indent: 0;
            text-align: center;
            font-weight: bold;
            font-size: 20px;
        }

        /* ---------------------------------------------------------- */
        .blank {
            /* 공백용... */
            height: 80px;
        }

        span {
            display: inline-block;
            text-align: center;
            font-size: 20px;
        }

        .gl1 {
            width: 25%;
            height: 70px;
            line-height: 70px;
        }

        .gl2 {
            width: 50%;
        }

        .gl3 {
            width: 20%;
        }

        .gl {
            font-family: Roboto;
        }

        .groupList {
            padding:
        }

        a {
            text-decoration: none;
            color: black;
        }

        a:hover {
            font-weight: bold;
        }

        .groupList {
            padding: 0;
            font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
            font-size: 14px;
        }

        #calendar {
            max-width: 800px;
            margin: 0 auto;
        }

        .group_goal {
            border: 1px solid black;
            height: 80%;
            width: 30%;
            margin: auto;
        }

        .today_goal {
            margin: auto;
            border: 1px solid black;
            height: 80%;
            width: 60%;
            display: flex;
            flex-wrap: wrap;
            align-content: flex-start;
            justify-content: space-around;
        }

        .goal_title {
            width: 100%;
            height: 10%;
            border: 1px solid black;
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
            text-align: center;
            line-height: 70px;
            font-weight: bold;
            position: relative;
        }
        .goal_area{
            border: 1px solid black;
            margin: auto;
            height: 5%;
            margin-top: 15px;
            border-radius: 10px;
            text-align: center;
            line-height:35px;
            font-weight: bold;
            color:white;
        }
        .groups{
            width: 90%;
        }
        .today{
            width: 40%;
        }
        button>img{
            height: 100%;
            width: 100%;
        }
        .goal_title>a{
            width: 30px;
            height: 30px;
            position: absolute;
            right: 25px;
            font-size: 24px;
          	
        }
        .goal_title>img{
            width: 30px;
            height: 30px;
            right: 45%;
            top: -15px;
        }
        .goal_title>img{
            position: absolute;
        }

    </style>
</head>
<body>
<div style="height: 100px;">
		<%@ include file="/WEB-INF/views/common/header.jsp"%>
	</div>
	<div class="modal">
		
	</div>
 <section>
        <div class="wrap">
            <div class="myplan">
                <div class="leftMenu">
                    <ul class="leftMenuList">
                        <li>개인스터디</li>
                        <li><a class="leftMenuA" href="/todayPlan?memberNo=<%=m.getMemberNo()%>"><img src="/img/calender2.png" style="margin-right: 10px;">일일 계획</a></li>
                        <li><a class="leftMenuA" href="/myStudyCalender?memberNo=<%=m.getMemberNo()%>" style="background-color: #6ED078;"><img src="/img/day2.png" style="margin-right: 10px;">나의 스케줄</a></li>
                        <li><a class="leftMenuA" href="/myGroupStudyList?memberNo=<%=m.getMemberNo()%>"><img src="/img/group_icon2.png" style="margin-right: 10px;">참여중인 스터디</a></li>
                    </ul>
                </div>
                <div class="participatingGroup">
                    <div class="groupListTitle">
                        2020년 11월 23일 (월) 오늘 할 일   
                        <div class="timeInputs">
	                        <img src="/img/today_time_icon_black.png" style="width:33px; height:33px;">
	                        <img id="start" src="/img/today_time_start.png" style="width:25px; height:26px;" onclick="func6();">
		                    <img id="stop" src="/img/today_time_stop.png" style="width:25px; height:25px;" onclick="func7();">
	                        <form action="/personalStudyRoomInsert?memberNo=<%=m.getMemberNo()%>" method="post" style="display:inline;">                        
		                        <input type="text" id="timeInput" name="time" placeholder="00 : 00 : 000">
		                        <input type="submit" id="timeSet" value="저장"> 
	                        </form>
                        </div>
                    </div>
                    <div class="groupList">
                        <div class="group_goal">
                            <div class="goal_title">
                                그룹 스터디 목표 & 즐겨찾기
                                <img src="/img/fin1.png">
                            </div>
                            <%for(PersonalStudyTask gl : gpstl){ %>
                             <div class="goal_area groups" style="background-color:<%=gl.getTaskColor()%>" id="groups">
                                <%=gl.getTaskContent() %>
                            </div>
                            <%} %>
                           
                        </div>
                        <div class="today_goal">
                            <div class="goal_title">
                                오늘의 진행 목표
                                <a href="#" id="addList" onclick="openPop();">+</a>
                            </div>

                            <%for(PersonalStudyTask pst : pstl) {%>
                               <div class="goal_area today" style="background-color:<%=pst.getTaskColor()%>" id="today">
                                <%=pst.getTaskContent() %>
                            	</div>
                            <%} %>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <div>
		<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	</div>
<script>
		function openPop(){
			var popup = window.open('/views/popUp.jsp','리스트 추가','width=350px,height=400px,scrollbars=no');
		};
        function func6(){
            var timeInput = document.getElementById("timeInput");
            var minute = 0;
            var time = 0;
            var sec = 0;
            time2 = window.setInterval(function(){
                var date = new Date();
                var mill = date.getMilliseconds();
                //p2.innerHTML = count + " : "+mill;
                timeInput.value = minute + " : " + sec + " : "+mill;
                if(mill >= 990){
                    sec++;
                }
                if(sec >= 59 && mill >= 990){
                	minute++;
                	sec = 0;
                }
                if(minute >= 59 && sec >= 59 && mill >= 990){
                	window.clearInterval(time2);
                }
            },10);
        }
        function func7(){
            window.clearInterval(time2);
        }
</script>
</body>
</html>