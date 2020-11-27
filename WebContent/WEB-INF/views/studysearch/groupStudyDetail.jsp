<%@page import="java.util.StringTokenizer"%>
<%@page import="groupstudy.model.vo.Category"%>
<%@page import="groupstudy.model.vo.GroupStudyRoom"%>
<%@page import="java.util.ArrayList"%>
<%@page import="member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	GroupStudyRoom gsr = (GroupStudyRoom)request.getAttribute("gsr");
    	Category category = (Category)request.getAttribute("category");
    	int memberCnt = (Integer)request.getAttribute("memberCnt");
    %>
    <%-- <% groupstudyroom %> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
<title><%=gsr.getGroupTitle() %></title>
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
    
    .groupDetail {
        float: left;
    }

    .groupTitle {
        width: 1018px;
        height: 53px;
        text-align: center;
        line-height: 53px;
        color: white;
        font-weight: bold;
        background: #6ED078;
    }

    .groupContent {
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
	/* -------------------------------------------------------------- */
	.groupContent{
		padding-top: 20px;	
		height: 847px;
	}
	.category{
		font-size: 15px;
		font-family: Roboto;
		margin-left:30px;
		margin-bottom: 50px;
	}
	.gcWrap{
		overflow: hidden;
	}
	.gc{
		float: left;
		width: 50%;
	}
	.gcTitle{
		display: inline-block;
		font-family: Roboto;
		font-weight: bold;
		font-size: 24px;
		color: #464646;
		margin: 0;
		margin-left: 100px;
	}
	.gcContent{
		font-family: Roboto;
		font-size: 18px;
		color: #464646;
		margin: 0;
		margin-left: 100px;
	}
	.line{
		 margin: 0;
		 width: 300px;
		 margin-top: 3px;
		 margin-bottom: 7px;
		 margin-left: 100px;
	}
	/* 모달------------------------------------------------------------ */
	.modalBtnDiv{
		text-align: center;
	}	
	#btn{
		outline: none;
		width: 156px;
		height: 53px;
		background: #6ED078;
		border-radius: 5px;
		color: white;
		font-size: 20px;
		font-weight: bold;
	}
	
    .modal-wrap{
      position: absolute;
      top: 0px;
      left: 0px;
      width: 100vw;
      height: 100vh;
      background-color: rgba(0,0,0,0.5);
      display: none;
      justify-content: center;
      align-items: center;
    }
    .modal{
      background-color: #fff;
      width: 40vw;
      height: 30vh;
      max-width: 500px;
      min-width: 300px;
      min-height: 340px;
    }
    .modal-top>h1{
      text-align: center;
    }
    .modal-content{
    	padding-left: 50px;
    	padding-right: 50px;
    }
    .modal-button>input{
    	background-color: white;
    	font-weight: bold;
      	outline: none;
      	width: 49%;
      	height:30px;
      	border: 0;
      	box-sizing: border-box;
      	padding: 0;
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
                    </ul>
                </div>
                <div class="groupDetail">
                    <div class="groupTitle"><%=gsr.getGroupTitle() %></div>
                    <div class="groupContent">
                    	<div class="category">분류 <%=category.getCategory1() %> > <%=category.getCategory2() %></div>
                    	<div class="gcWrap">
                    		<div class="gc">
                    			<p class="gcTitle">스터디기간</p>
                    			<hr class="line">
                    			<p class="gcContent"><%=gsr.getGroupStartDate() %> ~ <%=gsr.getGroupEndDate() %></p>
                    		</div>
                    		<div class="gc">
                    			<p class="gcTitle">참여인원</p>
                    			<hr class="line">
                    			<p class="gcContent">
                    				<%for(int i=0;i<gsr.getGroupPersonnel();i++){ %>
                    					<%if(i<memberCnt){ %>
                    						<img src="/img/fill_human1.png" style="padding-bottom: 16px;">
                    					<%}else{ %>
                    						<img src="/img/empty_human1.png">
                    					<%} %>
                    				<%} %>
                    				<br>
                    				총 인원 <%=gsr.getGroupPersonnel() %>명 / 현재 <%=memberCnt %>명이 참여 중입니다.
                    			</p>
                    			<br><br>
                    		</div>
                    	</div>
                    	<div class="gcWrap">
                    		<div class="gc">
                    			<p class="gcTitle">스터디 규칙</p>
                    			<hr class="line">
                    			<p class="gcContent"><%=gsr.getGroupRuleBr() %></p>
                    		</div>
                    		<div class="gc" style="height: 200px;">
                    			<p class="gcTitle"><img src="/img/Star1.png">스터디 공통계획</p>
                    			<hr class="line">
                    			<p class="gcContent">
                    				<%StringTokenizer tokens = new StringTokenizer(gsr.getGroupExplan(),"_"); %>
                    				<%for(int i = 0;tokens.hasMoreElements();i++){ %>
                    					<img src="/img/Vector33.png" style="margin-left: 10px;"> <%=tokens.nextToken() %><br>
                    				<%} %>
                    			</p>
                    			<br><br>
                    		</div>
                    	</div>
                    	<div class="gcWrap" style="height: 230px;">
                    		<div class="gc" style="width: 90%">
                    			<p class="gcTitle">스터디원에게 한마디</p>
                    			<hr class="line">
                    			<p class="gcContent"><%=gsr.getGroupContentBr() %></p>
                    		</div>
                    	</div>
                    	<hr width="80%">
                    	<br>
                    	<div class="modalBtnDiv">
              				<button id="btn">참여 요청</button>
                    	</div>
                    </div>
                </div>
            </div>
            <%@ include file="/WEB-INF/views/common/footer.jsp"%>
		</div>
		
		<!-- 모달---------------------------------- -->
		<div class="modal-wrap">
    		<div class="modal">
      			<div class="modal-top">
        			<h1>그룹장에게 참여 요청 메시지를 보냅니다</h1>
        			<hr>
      			</div>
      			<form action="/insertApplyGroupMember" method="post">
      			<%if(m!=null){%>
      				<input type="hidden" name="memberNo" value="<%=m.getMemberNo()%>"> <!-- 참여요청하려는 사용자의 memberNo -->
      			<%}%>
      			<input type="hidden" name="groupNo" value="<%=gsr.getGroupNo()%>"> <!-- 현재페이지의 groupNo -->
      			
      			<div class="modal-content">
			       	 <p>그룹장에게 자신을 소개해보세요</p>
			         <textarea rows="9" cols="54" name="applyContent" style="resize: none"></textarea>
      			</div>
      			<br>
      			<hr>
      			<div class="modal-button">
      				<input type="submit" value="전송">
			        <input type="button" value="취소">
      			</div>
      			</form>
    		</div>
  		</div>
    </section>
    <script>
    /* 모달----------------------------------------- */
    $(function(){
    	$("[name=groupContent]").click(function(event){
    		event.stopPropagation();
    	});
        $("#btn").click(function(){
        	<%if(m==null){ %>
				alert("로그인 후 이용가능한 페이지입니다");
				location.href="/views/login.jsp";
			<%}else{%>
          		$(".modal-wrap").css("display","flex");
          	<%}%>
        });
        
        $("input[type=button]").click(function(){
          $(".modal-wrap").css("display","none");
        });
      })
    </script>
</body>
</html>