<%@page import="java.util.StringTokenizer"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="groupstudy.model.vo.GroupStudyRoomAddCategory"%>
<%@page import="groupstudy.model.vo.GroupStudyRoom"%>
<%@page import="java.util.ArrayList"%>
<%@page import="member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	GroupStudyRoom gsr = (GroupStudyRoom)request.getAttribute("gsr");
    	String category1 = (String)request.getAttribute("category1");
    	String category2 = (String)request.getAttribute("category2");
    	int memberCnt = (Integer)request.getAttribute("memberCnt");
    	
    	String groupEndDate = gsr.getGroupEndDate();
    %>
    
    <%-- <% groupstudyroom %> --%>
<!DOCTYPE html>
<html>
<head>
 <script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
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
        font-family: Roboto;
    }

    .leftMenu {
        width: 182px;
        height: 1300px;

        background: #E1E1E1;

        float: left;
    }
    
    .participatingGroup {
        float: left;
        height: 1300px;
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
        height: 1247px;

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
    .gl{
    	overflow: hidden;
    	padding-left: 100px;
    }
    .gl1-1{
    	float: left;
    }
    .greenSquare{
    	width: 78px;
    	height: 36px;
    	border-radius: 5px;
    	background-color: #6ED078;
    	text-align: center;
    	line-height: 36px;
    	font-weight: bold;
    	font-size: 20px;
    }
    .dDayDiv{
    	overflow: hidden;
    	width: 600px;
    }
    .gl1-2{
    	float: left;
    }
    
    .gl1-1:first-child{ /* 제목이랑 사진들어갈곳 크기지정함 */
    	margin-right: 30px;
    	width: 200px;
    }
    .gl1-2:first-child {
		width: 25%;
	}
	.gl1-2:nth-child(2) {
		width: 40%;
		font-size: 18px;
	}
	.gl1-2:last-child {
		width: 35%;
		text-align: center;
	}
	 /* 목록/수정/삭제/스터디나기기버튼---------------------------------------------------------- */
	.btnDiv{
		text-align: right;
		height: 50px;
	}
	.btn{
		margin: 5px;
	}
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
                    <div class="groupListTitle" style="font-weight: bold">[ <%=gsr.getGroupTitle() %> ]</div>
                    <div class="groupList">
                    	<div class="btnDiv">
                    		<a href="javascript:history.go(-1)" class="btn btn-success btn-sm">목록으로</a>
                    		<%if(gsr.getGroupManagerNo()==m.getMemberNo()){//방장인 경우 %>
	                    		<a href="/updateGroupStudyRoomFrm?groupNo=<%=gsr.getGroupNo() %>&category1=<%=category1 %>&category2=<%=category2 %>" class="btn btn-success btn-sm">수정</a>
    	                		<a href="" class="btn btn-success btn-sm" id="studyDelete">삭제</a><!-- script로처리 -->
                    		<%}else{ //단순한 참여자인경우%>
                    			<a href="" class="btn btn-success btn-sm" id="studyExit">스터디 나가기</a><!-- script로처리 -->
                    		<%} %>
                    	</div>
                    	<div class="gl"><!-- 메인이미지넣는곳 -->
                    		<div class="gl1-1">
                    			<%if(gsr.getFilepath()==null){ %>
                    				<img src='/img/basic.png'>
                    			<%}else{ %>
                    				<img src='/upload/groupImg/<%=gsr.getFilepath() %>'>
                    			<%} %>
                    		</div>
                    		<div class="gl1-1">
                    			<div class="dDayDiv">
                    				<div class="gl1-2">
                    					<div class="greenSquare"></div>
                    					<div id="dDayStatus" style="text-indent: 8px;"></div>
                    				</div>
                    				<div class="gl1-2">
                    					시작 날짜 : <%=gsr.getGroupStartDate() %><br>
                    					종료 날짜 : <%=gsr.getGroupEndDate() %>
                    				</div>
                    				<div class="gl1-2">
                    					<img src="/img/group_icon3.png"><br>
                    					참여인원 : <%=memberCnt%> / <%=gsr.getGroupPersonnel()%>
                    				</div>
                    			</div>
                    			<div>
                    				<p>스터디 상세내용</p>
                    				<p class="gcContent" style="border: 1px solid gray; padding-left: 10px;"><%=gsr.getGroupContentBr() %></p>
                    			</div>
                    		</div>
                    	</div>
                    	<div class="gl">
                    		<div class="glTitle">우리 스터디 규칙</div>
                    		<div>
                    			<p class="gcContent"><%=gsr.getGroupRuleBr() %></p>
                    		</div>
                    	</div>
                    	<div class="gl">
                    		<div class="glTitle">우리 스터디 목표</div>
                    		<div>
                    			<%StringTokenizer tokens = new StringTokenizer(gsr.getGroupExplan(),"_"); %>
                    			<%for(int i = 0;tokens.hasMoreElements();i++){ %>
                    					<img src="/img/Vector33.png" style="margin-left: 10px;"> <%=tokens.nextToken() %><br>
                    			<%} %>
                    		</div>
                    	</div>
                    	<div class="gl">
                    		<div class="glTitle">자료실</div>
                    		<div>
                    		</div>
                    	</div>
                    	<div class="gl">
                    		<div class="glTitle">댓글</div>
                    		<div>
                    		</div>
                    	</div>
                    </div>
                </div>
            </div>
            
		</div>
		<%@ include file="/WEB-INF/views/common/footer.jsp"%>
    </section>
    <script>
    	$(function(){
    		//D-Day구하기
    		var now = new Date();
    		var groupEndDate = '<%=groupEndDate%>';
    		console.log(groupEndDate);
    	    var endArray = groupEndDate.split('-');
    	    var endDate = new Date(endArray[0], endArray[1]-1, endArray[2]);//달은 -1해줘야함
    	    console.log(endDate);
    		console.log(now);
    	    var dday = endDate.getTime() - now.getTime();
    	    dday = Math.floor(dday / (1000 * 60 * 60 * 24))+1;
    	    console.log(dday);
    	    if(dday<0){//종료일지가 지난경우
    	    	$(".greenSquare").html("종료");
    	    	$("#dDayStatus").html("종료됨");
    	    }else if(dday==0){//D-DAY인경우
    	    	$(".greenSquare").html("D-"+dday);
    	    	$("#dDayStatus").html("D-DAY!");
    	    }else{
	    	    $(".greenSquare").html("D-"+dday);
    		    $("#dDayStatus").html("진행중");
    	    }
    	    
    	    //스터디 삭제하기 confirm
    	    $("#studyDelete").click(function(){
    	    	if(!confirm("[<%=gsr.getGroupTitle()%>] 스터디를 삭제하시겠습니까?")){
    	    		$("#studyDelete").attr("href","javascript:void(0);");
    	    	}else{
    	    		$("#studyDelete").attr("href","/deleteGroupStudyRoom?groupNo=<%=gsr.getGroupNo() %>&memberNo=<%=m.getMemberNo() %>");
    	    	}
    	    });
    	    //스터디 나가기 confirm
    	    $("#studyExit").click(function(){
    	    	if(!confirm("[<%=gsr.getGroupTitle()%>] 스터디를 나가시겠습니까?")){
    	    		$("#studyExit").attr("href","javascript:void(0);");
    	    	}else{
    	    		$("#studyExit").attr("href","/deleteGroupStudyMember?memberNo=<%=m.getMemberNo()%>&groupNo=<%=gsr.getGroupNo() %>&groupTitle=<%=gsr.getGroupTitle()%>");
    	    	}
    	    });
    	});
    	
    	
    </script>
</body>
</html>