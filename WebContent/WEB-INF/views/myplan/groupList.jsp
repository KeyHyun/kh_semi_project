<%@page import="groupstudy.model.vo.GroupStudyRoomAddCategory"%>
<%@page import="groupstudy.model.vo.GroupStudyRoom"%>
<%@page import="java.util.ArrayList"%>
<%@page import="member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    ArrayList<GroupStudyRoomAddCategory> gsrCateList = (ArrayList<GroupStudyRoomAddCategory>)request.getAttribute("gsrCateList");
    %>
    <%-- <% groupstudyroom %> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .wrap{
        width: 1200px;
        margin: 0 auto;
    }

    .header {
        width: 1200px;
        height: 100px;
        background: green;
    }

    .myplan{
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
        text-align: center;
        line-height: 53px;
        color: white;
        font-weight: bold;
        background: #6ED078;
    }

    .groupList {
        width: 1018px;
        height: 867px;

        background: #FDFDFD;
    }
    

    .leftMenuList{
        padding: 0;
        margin: 0;
        list-style-type: none;
        text-indent: 25px;
        line-height: 58px;
    }
    .leftMenuA{
        display: block;
        width: 100%;
        height: 58px;
        color: black;
        font-size: 13px;
        font-weight: bold;
        text-decoration: none;
    }
    .leftMenuA:hover{
        color: black;
        text-decoration: none;
    }
    .leftMenuList>li:first-child{
        text-indent: 0;
        text-align: center;
        font-weight: bold;
        font-size: 20px;
    }
    
    /* ---------------------------------------------------------- */
    .blank{/* 공백용... */
    	height: 80px;
    }
    span{
   		display: inline-block;
   		text-align: center;
   		font-size: 20px;
    }
    .gl1{
    	width: 25%;
    	height: 70px;
    	line-height: 70px;
    }
    .gl2{
    	width: 50%;
    }
    .gl3{
    	width: 20%;
    }
    .gl{
    	font-family: Roboto;
    }
    .groupList{
    	padding: 
    }
    a{
    	text-decoration: none;
    	color: black;
    }
    a:hover{
    	font-weight: bold;
    }
</style>
</head>
<body>
 	<section>
        <div class="wrap">
            <div class="header">
            	<%@ include file="/WEB-INF/views/common/header.jsp"%>
            </div>
            <div class="myplan">
                <div class="leftMenu">
                    <ul class="leftMenuList">
                    	<li>개인스터디</li>
                        <li><a class="leftMenuA" href="#"><img src="/img/calender2.png" style="margin-right: 10px;">일일 계획</a></li>
                        <li><a class="leftMenuA" href="#"><img src="/img/day2.png" style="margin-right: 10px;">나의 스케줄</a></li>
                        <li><a class="leftMenuA" href="/myGroupStudyList?memberNo=<%=m.getMemberNo()%>"><img src="/img/group_icon2.png" style="margin-right: 10px;">참여중인 스터디</a></li>
                    </ul>
                </div>
                <div class="participatingGroup">
                    <div class="groupListTitle">나의 그룹스터디 리스트</div>
                    <div class="groupList">
                    
                    	<%if(gsrCateList==null || gsrCateList.isEmpty()){ %>
                    		<div style="text-align: center; font-size: 25px; font-weight: bold; padding-top: 100px; opacity: 0.5;">
		                       	현재 참여중인 스터디가 없습니다.
		                    </div>
                        <%}else{ %>
                        	<div class="blank"></div>
                        	<span class="gl1" style="font-weight: bold; font-size: 25px;">분류</span><span class="gl2" style="font-weight: bold; font-size: 25px;">제목</span><span class="gl3" style="font-weight: bold; font-size: 25px;">종료일</span>
                        	<hr style="width: 90%;">
                        	<%for(GroupStudyRoomAddCategory gsrAddc : gsrCateList) {%>
                        		<div class="gl">
                        			<span class="gl1"><%=gsrAddc.getCategory().getCategory1() %> > <%=gsrAddc.getCategory().getCategory2() %></span>
                        			<span class="gl2"><a href="/myPlanGroupDetail?groupNo=<%=gsrAddc.getGsr().getGroupNo()%>&category1=<%=gsrAddc.getCategory().getCategory1() %>&category2=<%=gsrAddc.getCategory().getCategory2() %>"><%=gsrAddc.getGsr().getGroupTitle()%></a></span>
                        			<span class="gl3"><%=gsrAddc.getGsr().getGroupEndDate()%></span>
                        			<hr style="width: 90%;">
                        		</div>
                        	<%} %>
		                <%} %>
                    </div>
                </div>
            </div>
            <%@ include file="/WEB-INF/views/common/footer.jsp"%>
		</div>
    </section>
</body>
</html>