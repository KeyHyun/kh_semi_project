
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>관리자|이벤트 관리</title>
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
</style>

<body>
    <div>
        <%@ include file="/WEB-INF/views/common/managerHeader.jsp" %>
    </div>
    <section>
        <div class="wrap">
            <div class="header">헤더부분</div>
            <div class="myplan">
                <div class="leftMenu">
                    <ul class="leftMenuList">
                        <li>관리자</li>
                        <li><a class="leftMenuA" href="/memberList?reqPage=1">사용자 관리</a></li>
                        <li><a class="leftMenuA" href="/groupStudyListManager?reqPage=1">그룹스터디 관리</a></li>
                        <li><a class="leftMenuA" href="/noticeManagerList?reqPage=1">공지사항 관리</a></li>
                        <li><a class="leftMenuA" href="#">고객문의 관리</a></li>
                         <li><a class="leftMenuA" href="/eventManagerList?reqPage=1" style="background-color: #6ED078;">이벤트 관리</a></li>
                    </ul>
                </div>
                <div class="participatingGroup">
                    <div class="groupListTitle">이벤트 관리</div>
                    <div class="groupList">
                        <div class="table-wrapper" style="width:95%; margin:0 auto;">
                            <form action="eventInsert" method="post" enctype="multipart/form-data">
                                <table class="table table-borader">
                                    <tr>
                                        <th colspan="2">이벤트 작성</th>
                                    </tr>
                                    <tr>
                                        <th>제목</th>
                                        <td><input type="text" class="form-control" name="eventTitle"></td>
                                    </tr>
                                    <tr>
                                    	<th>마감일</th>
                                    	<td><input type="date" name="eventEndDate"></td>
                                    </tr>
                                    <tr>
                                        <th>첨부파일</th>
                                        <td>
	                                        <img id="preview" src="" width="300px">
											<input type="file" name="filename" id="getfile" accept="image/*">
										</td>
                                    </tr>
                                    <tr>
                                    	<th>첨부링크</th>
                                    	<td><input type="text" name="eventLink" value="null"></td>
                                    </tr>
                                    <tr>
                                        <th>내용</th>
                                        <td><textarea name="eventContent" class="form-control" rows="3" cols="40"></textarea></td>
                                    </tr>
                                    
                                    <tr style="text-align:center;">
                                        <th colspan="2">
                                            <button type="submit" class="btn btn-primary">등록하기</button>
                                        </th>
                                    </tr>
                                </table>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <div>
        <%@ include file="/WEB-INF/views/common/footer.jsp" %>
    </div>
	<script>
		//첨부파일 미리보기
		var file = document.querySelector('#getfile');
		file.onchange = function () { 
		    var fileList = file.files ;
		    
		    // 읽기
		    var reader = new FileReader();
		    reader.readAsDataURL(fileList [0]);
	
		    //로드 한 후
		    reader.onload = function  () {
		        document.querySelector('#preview').src = reader.result ;
		    }; 
		}; 
	</script>
</body>

</html>