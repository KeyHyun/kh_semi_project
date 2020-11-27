<%@page import="java.util.ArrayList"%>
<%@page import="groupstudy.model.vo.GroupStudyRoom"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	ArrayList<GroupStudyRoom> list = (ArrayList<GroupStudyRoom>)request.getAttribute("list");
    	String pageNavi = (String)request.getAttribute("pageNavi");
    	System.out.println(pageNavi);
    %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>스터디 찾기</title>
</head>
<style>
	.wrap{
		margin : 0 auto;
	}
    .content-wrap{
        width: 1200px;
        height: 1274px;
        overflow: hidden;
        margin: 0 auto;
    }
    
    .content-left{
        float: left;
        width: 182px;
        height: 100%;
        background-color: #DCDEDD;
        text-align: center;
    }

    .content-left>p>a{
        display: inline-block;
        width: 100%;
        color: black;
        text-decoration: none;
    }

    .content-right{
        float: left;
        width: 1018px;
        height: 100%;
        text-align: center;
    }

    .content-title{
        margin: 0;
        width: 100%;
        height: 53px;
        color: #fff;
        font-weight: bold;
        line-height: 53px;
        background-color:#6ED078;
    }

    .serch-box{
        margin: 0 auto;
        margin-top: 40px;
        width: 827px;
        background-color: #DCDEDD;
        overflow: hidden;
    }

    .label{
        float: left;
        width: calc(100%/4);
        height: 48px;
        line-height: 48px;
        text-align: center;
        display: inline-block;
        color: #fff;
        font-weight: bold;
        background-color: #6ED078;
    }

    .label:hover {
        cursor: pointer;
    }

    .serch-name{
        float: left;
        width: 100%;
        height: 200px;
        line-height: 180px;
    }

    .serch-name>select{
        width: 100px;
        height: 39px;
    }

    .serch-name>input{
        width: 435px;
        height: 33px;
        outline: none;
    }

    .serch-category{
        float: left;
        width: 100%;
        height: 200px;
        text-align: center;
    }

    button{
        width: 122px;
        height: 37px;
        border: none;
        border-radius: 3px;
        background-color: #3D7CB6;
        color: #fff;
    }

    .add-function{
        margin: 0 auto;
        margin-top: 30px;
        width: 827px;
        height: 40px;
    }

    .add-function>a{
        float: left;
        width: 113px;
        height: 33px;
        color: #fff;
        font-size: 13px;
        font-weight: bold;
        border-radius: 3px;
        background-color: #167E14;
        text-decoration: none;
        line-height: 33px;
    }

    .add-function>select{
        width: 106px;
        height: 25px;
        float: right;
    }

    hr{
        width: 827px;
        margin: 0 auto;
        margin-bottom: 51px;
    }

    .content-list{
        width: 827px;
        height: 750px;
        margin: 0 auto;
        overflow: hidden;
        text-align: center;
    }

    .study-list{
        width: 150px;
        height: 250px;
        float: left;
        margin-left: 45px;
    }

    .list-img{
        width: 150px;
        height: 150px;
        background-color: #DCDEDD;
    }

    .list-content{
        width: 150px;
        height: 60px;
        background-color: aqua;
    }

    .list-content>a{
        display: inline-block;
        margin-top: 10px;
        text-decoration: none;
        color: black;
        font-weight: bold;
        font-size: 15px;
    }

    .list-content>p{
        margin: 0;
        margin-top: 5px;
        font-size: 10px;
    }

    #pageNavi>*{
        width: 10px;
    }

    .selectPage{
        font-size: 18px;
        color: blue;
    }

</style>
<body>
	<div class="wrap">
	<div>
		<%@ include file="/WEB-INF/views/common/header.jsp" %>
	</div>
	<section>
		<div class="content-wrap">
	        <div class="content-left">
	            <p><a href="groupStudyList?reqPage=1">스터디 찾기</a></p>
	        </div>
	        <div class="content-right">
	            <p class="content-title">스터디 찾기</p>
	            <form action="/groupStudyList">
	                <div class="serch-box">
	                    <div class="label">
	                        검색어로 찾기
	                    </div>
	                    <div class="label">
	                        카테고리로 찾기
	                    </div>
	                    <div class="label"></div>
	                    <div class="label"></div>
	                    <div class="serch-name">
	                        <select name="select-email" onChange="selectEmail(this)">
	                            <option value="groupTitle" selected>제목</option>
	                            <option value="groupContent">내용</option>
	                        </select>
	                        <input type="text" id="inputs" placeholder="검색어를 입력해주세요.">
	                        <button type="submit">검 색</button>
	                    </div>
	                    <div class="serch-category">
	                        <select id="sel1" name="select-category" onChange="selectCategory(this)">
	                            <option value="" selected>1차 분류</option>
	                            <option value="category1">1차 분류</option>
	                        </select>
	                        <select id="sel2" name="select-category" onChange="selectCategory(this)">
	                            <option value="" selected>2차분류</option>
	                            <option value="category2">2차 분류</option>
	                        </select>
	                        <button type="submit">검 색</button>
	                    </div>        
	                </div>
	            </form>
	            <div class="add-function">
	            	<%if(m!=null && m.getMemberGrade() != 0) {%>
	                <a href="/createRoomCntCheck?memberNo=<%=m.getMemberNo()%>&memberGrade=<%=m.getMemberGrade()%>">그룹스터디 생성</a>
	                <%} %>
	                <select id="float" name="float-category" onChange="floatCategory(this)">
	                    <option value="" selected>최신순</option>
	                    <option value="groupTitle">이름순</option>
	                </select>
	            </div>
	            <hr>
	            
	            <div class="content-list">
	                <%for(GroupStudyRoom gsr : list) {%>
	                <div class="study-list">
	                    <div class="list-img">
	                        <img src="">
	                    </div>
	                    <div class="list-content">
	                        <a href="/groupStudyDetail?groupNo=<%=gsr.getGroupNo()%>"><%=gsr.getGroupTitle() %></a><br>
	                        <p><%=gsr.getGroupExplan() %></p>
	                    </div>
	                </div>
	                <%} %>
	            </div>
	            <div id="pageNavi"><%=pageNavi %></div>
	        </div>
	    </div>
	</section>
	<div>
    	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
    </div>
	</div>
    <script>
        $(function(){
            $(".label").eq(0).click();
            console.log(<%=list.size()%>);
        });
        $(".label").click(function(){
            var label = $(this).index();
            if(label == 0){
                $(".serch-name").css("display","block");
                $(".serch-category").css("display","none");
                $(".label").eq(0).css({'color':'#1F6A27','background-color':'#DCDEDD'});
                $(".label").eq(0).nextAll().css({'color':'','background-color':''});
            }
            if(label == 1){
                $(".serch-name").css("display","none");
                $(".serch-category").css("display","block");
                $(".label").eq(0).nextAll().css({'color':'#1F6A27','background-color':'#DCDEDD'});
                $(".label").eq(0).css({'color':'','background-color':''});
            }
        });
    </script>
</body>
</html>