<%@page import="eventboard.model.vo.EventBoard"%>
<%@page import="noticeboard.model.vo.NoticeBoard"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    	ArrayList<EventBoard> list = (ArrayList<EventBoard>)request.getAttribute("list");
		String pageNavi = (String)request.getAttribute("pageNavi");
    %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>이벤트</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
</head>

<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.4.js"></script>
<style>
    body {
        margin: 0;
        padding: 0;
    }

    .wrap {
        margin: 0 auto;
        width: 1200px;
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
    }

    .groupListTitle {
        width: 1018px;
        height: 58px;
        text-align: center;
        line-height: 58px;
        color: white;
        font-weight: bold;
        background: #6ED078;
    }

    .groupList {
        width: 1018px;
        padding-top: 30px;
        background: #FDFDFD;
        text-align: center;
    }

    .leftMenuList {
        padding: 0;
        margin: 0;
        list-style-type: none;
        line-height: 58px;
    }

    .leftMenuA {
        display: block;
        width: 100%;
        height: 58px;
        color: black;
        font-size: 13px;
        font-weight: bold;
        text-align: center;
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

    .title {
        margin-left: 20px;
    }

    .text {
        width: 94%;
        height: 750px;
        overflow: auto;
        line-height: 20px;
        font-family: Roboto;
        font-style: normal;
        padding: 3%;
        margin: 0 auto;
    }

    strong {
        margin-left: 10px;
    }

    select.form-control,
    input.form-control {
        display: inline-block;
        width: 200px;
        height: 30px;
        font-size: 0.8em;
    }

    .pagination {
        justify-content: center;
    }

    .pagination>li>a {
        color: black;
    }

    .deleteAllBtn {
        border-color: #38AF52;
        background-color: #38AF52;
    }

    .notice-content {
        color: black;
    }

	/*이벤트 박스 관련*/
    .box {
        width: 40%;
        height: 150px;
        margin: 20px;
        display: inline-block;
        border-radius: 10px;
        overflow: hidden;
        box-shadow: 0px 0px 5px 0px rgba(0, 0, 0, 0.11);
    }

    .box left,
    .eventTitle {
        float: left;
    }

    .box right,
    .endDate {
        float: right;
    }

    .eventTitle,
    .endDate {
        margin-left: 10px;
        margin-right: 10px;
    }

    .eventTitle{
        font-size: 15px;
        color: #313131;
    }

    .endDate {
        color: #D80000;
    }
    hr{
    	background-color: rgba(244, 244, 244, 0.05);
    }
    .none{
    	opacity: 0%;
    }
</style>

<body>
    <div>
        <%@ include file="/WEB-INF/views/common/header.jsp" %>
    </div>
    <section>
        <div class="wrap">
            <div class="header">헤더부분</div>
            <div class="myplan">
                <div class="leftMenu">
                    <ul class="leftMenuList">
                        <li>이벤트</li>
                        <li><a class="leftMenuA" href="/eventList?reqPage=1" style="background-color: #6ED078;">이달의 이벤트</a></li>
                        <li><a class="leftMenuA" href="/eventWinnerList?reqPage=1">이벤트 당첨자 조회</a></li>
                    </ul>
                </div>
                <div class="participatingGroup">
                    <div class="groupListTitle">이달의 이벤트</div>
                    <div class="groupList">
                        <section>
                            <hr>
                            <%int count = 0; %>

                            <%for(EventBoard e : list){ %>
                            <%count++; %>
                            <%if(count%2 != 0){ %>
                            <div class="box left">
                                <a href="/eventManagerView?eventNo=<%=e.getEventNo() %>&manager=no">
                                    
                                    <span class="eventTitle"><%=e.getEventTitle() %></span>
                                    <span class="endDate" value="<%=e.getEventEndDate() %>"><%=e.getEventEndDate() %></span>
                                    <div class="img">
                                        <img src="/upload/event/<%=e.getFilepath() %>" width="100%">
                                    </div>
                                </a>
                            </div>
                            <%} else{  %>
                            <div class="box right">
                                <a href="/eventManagerView?eventNo=<%=e.getEventNo() %>&manager=no">
                                    <span class="eventTitle"><%=e.getEventTitle() %></span>
                                    <span class="endDate" value="<%=e.getEventEndDate() %>"><%=e.getEventEndDate() %></span>
                                    <div class="img">
                                        <img src="/upload/event/<%=e.getFilepath() %>" widht="100%">
                                    </div>
                                </a>
                            </div>
                            <hr>
                            <%} } %>
                            
                            <!-- 여백 맞추려고 빈 박스 생성 -->
							<%if(count%2 != 0){ %>
								 <div class="box none"></div>
							<%} %>

                            <div class="text-center" style="width:100%; margin:0 auto;">
                                <ul class="pagination">
                                    <%=pageNavi %>
                                </ul>
                            </div>
                        </section>


                        <script>
                            $(document).ready(function() {
                                //d-day
                                var endDates = $(".endDate");
                                endDates.each(function(idx, item) {
                                    var date = $(item).html();
                                    var dday = dayCal(date);
                                    if (dday < 0) { //종료일지가 지난경우
                                        $(item).html("종료");
                                    } else if (dday == 0) { //D-DAY인경우
                                        $(item).html("D-" + "마지막날");
                                    } else {
                                        $(item).html("D-" + dday);
                                    }
                                });

                            });

                            function dayCal(date) {
                                var now = new Date();
                                var groupEndDate = date;
                                console.log(groupEndDate);
                                var endArray = groupEndDate.split('-');
                                var endDate = new Date(endArray[0], endArray[1] - 1, endArray[2]); //달은 -1해줘야함
                                var dday = endDate.getTime() - now.getTime();
                                dday = Math.floor(dday / (1000 * 60 * 60 * 24)) + 1;
                                return dday;

                            }
                        </script>

                    </div>
                </div>
            </div>
        </div>
    </section>
    <div>
        <%@ include file="/WEB-INF/views/common/footer.jsp" %>
    </div>

</body>

</html>