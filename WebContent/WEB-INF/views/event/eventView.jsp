<%@page import="eventboard.model.vo.EventBoard"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	EventBoard e = (EventBoard)request.getAttribute("e");
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
    
    .pagination{
    	justify-content: center;
    }
    
    .pagination > li > a{
    	color : black;
    }
    
    .deleteAllBtn{
    	border-color : #38AF52;
    	background-color : #38AF52;
    }
    
    .notice-content{
    	color:black;
    }
    
    .bordertable th, .bordertable td{
	  font-size: 12px;    
	  border:1px solid #ededed !important;
	  line-height: 19px;
	  color:#20232;
	  padding-top: 9px !important;
	  padding-bottom: 7px !important;
	}
	
	.bordertable th{
		width : 200px;
		font-weight: bold;  
	}
	.img-wrap{
		text-align: center;
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
                        <li><a class="leftMenuA" href="/questionList?reqPage=1">이벤트 당첨자 조회</a></li>
                    </ul>
                </div>
                 <div class="participatingGroup">
                    <div class="groupListTitle">이벤트 관리</div>
                    <div class="groupList">
                        <div class="table-wrapper" style="width:95%; margin:0 auto;">
                            <table class="table table-borader bordertable">
                                <tr>
                                    <th colspan="2" style="background-color:#F1F1F1"><%=e.getEventTitle() %></th>
                                </tr>
                                <tr>
                                    <th>작성자</th>
                                    <td>관리자</td>
                                </tr>
                                <tr>
                                    <th>첨부파일</th>
                                    <td>
                                        <%if(e.getFilename() != null){ %>
                                        <img src="/img/file.png" width="16px">
                                        <a href="javascript:fileDownload('<%=e.getFilename() %>', '<%=e.getFilepath() %>')"><%=e.getFilename() %></a>
                                        <%} else{%>
                                        없음
                                        <%} %>
                                    </td>
                                </tr>
                                <tr>
                                	<th>첨부링크</th>
                                	<td>
                                		<%if(e.getEventLink().equals("null")){ %>
                                		없음
                                		<%}else{ %>
                                			<a href=<%=e.getEventLink() %>>이벤트 링크 바로가기[이동]</a>
                                		<%} %>
                                	</td>
                                </tr>
                                
                                <tr >
                                    <th>내용</th>
                                    <td>
                                    <%=e.getEventContent() %><br>
									</td>
                                </tr>
                                <%if(e.getFilepath()!= null){ %>
                                <tr>
                                	<td colspan="2" class="img-wrap">
                 	                 
                                    <img src="/upload/event/<%=e.getFilepath() %>">	<br>
                                    
                                	</td>
                                </tr>
                                <%} %>
                                <tr style="text-align:center">
                                    <th colspan="2">
                                        <a href="javascript:history.go(-1)" class="btn btn-primary btn-sm">목록으로</a>
                                    </th>
                                </tr>
                            </table>
                        </div>

                        <script>
                            function fileDownload(filename, filepath) {
                                var url = "/eventFileDownload";
                                var enFilename = encodeURIComponent(filename);
                                var enFilepath = encodeURIComponent(filepath);
                                location.href = url + "?filename=" + enFilename + "&filepath=" + enFilepath;
                            }
                            
                            $(document).ready(function(){
                            	var height = $(".participatingGroup").height();
                            	$(".leftMenu").height(height);
                            });
                            
                            
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