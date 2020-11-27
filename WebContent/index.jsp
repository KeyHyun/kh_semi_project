<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link href='http://fonts.googleapis.com/css?family=Roboto:400,300,100,500,700' rel='stylesheet' type='text/css'>
<title>메인화면</title>
</head>
<style>
	.wrap{
		margin: 0 auto;
		width:1200px;
	}
    .content-wrap {
        top: 100px;
        width: 1200px;
    }

    .container {
        width: 1200px;
        height: 500px;
        padding: 0;
        margin-bottom: 80px;
    }

    .carousel-caption {
        position: absolute;
        top: 140px;
    }

    .carousel-inner>.item>img {
        top: 0;
        left: 0;
        min-width: 1200px;
        min-height: 500px;
    }

    .content{
        margin-top: 10px;
        width: 1000px;
        height: 674px;
        margin: 0 auto;
        background-color: rgb(240, 240, 240);
    }

    .second{
        height: 474px;
    }

    .content-top{
        margin-top: 50px;
        padding-top: 5px;
        width: 100%;
        height: 70px;
        color: #fff;
        text-align: center;
        background-color: rgb(63, 63, 63);
    }

    .content-img1{
        text-align: center;
        line-height: 404px;
        width: 100%;
        height: calc(100%-70);
    }

    .content-img2{
        text-align: center;
        line-height: 604px;
        width: 100%;
        height: calc(100%-70);
    }

    .content-img>img{
        width: 85%;
        height: 80%;
    }

    .content-comment{
        padding-top: 60px;
        width: 500px;
        height: 200px;
        color: #fff;
        background-color: rgb(41, 41, 41);
        text-align: center;
        line-height: 10px;
        position: absolute;
        top: 1500px;
        left: 500px;
        opacity: 0.8;
    }
</style>
<body>
	<div class="wrap">
	<section>
		<div style="height: 100px;">
			<%@ include file="/WEB-INF/views/common/header.jsp"%>
		</div>
		<div class="wrap">
			<div class="content-wrap">
				<div class="container">
	                <div id="myCarousel" class="carousel slide" data-ride="carousel">
	                    <!-- Indicators -->
	                    <ol class="carousel-indicators">
	                        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
	                        <li data-target="#myCarousel" data-slide-to="1"></li>
	                        <li data-target="#myCarousel" data-slide-to="2"></li>
	                    </ol>
	
	                    <!-- Wrapper for slides -->
	                    <div class="carousel-inner" role="listbox">
	                        <div class="item active">
	                            <img src="img/main1.png" width="100%" min-height="400px">
	                            <div class="carousel-caption">
	                                <h2>이루고 싶은 목표가 있다면</h2>
	                                <p>My Plan에서 스터디계획을 설정하세요.<br>
	                                    혼자하는 개인스터디, 함께하는 그룹스터디</p><br>
	                                <span>지금 바로 시작하세요> </span><a href="#"> 회원가입하기</a>
	                            </div>
	                        </div>
	                        <div class="item">
	                            <img src="img/main2.png" width="100%" height="100%">
	                            <div class="carousel-caption">
	                                <h2>이루고 싶은 목표가 있다면</h2>
	                                <p>My Plan에서 스터디계획을 설정하세요.<br>
	                                    혼자하는 개인스터디, 함께하는 그룹스터디</p><br>
	                                <span>지금 바로 시작하세요> </span><a href="#"> 회원가입하기</a>
	                            </div>
	                        </div>
	                        <div class="item">
	                            <img src="img/main4.png" width="100%" height="500px">
	                            <div class="carousel-caption">
	                                <h2>이루고 싶은 목표가 있다면</h2>
	                                <p>My Plan에서 스터디계획을 설정하세요.<br>
	                                    혼자하는 개인스터디, 함께하는 그룹스터디</p><br>
	                                <span>지금 바로 시작하세요> </span><a href="#"> 회원가입하기</a>
	                            </div>
	                        </div>
	                    </div>
	
	                    <!-- Controls -->
	                    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
	                        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
	                        <span class="sr-only">Previous</span>
	                    </a>
	                    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
	                        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
	                        <span class="sr-only">Next</span>
	                    </a>
	                </div>
	            </div>
	            <div class="content">
	                <div class="content-top">
	                    <h4>연간 일정 살펴보기</h4>
	                    <span>#자격증 </span><span>#토익 </span><span>#어학 </span><span>#입시</span>
	                </div>
	            </div>
	            <div class="content second">
	                <div class="content-top">
	                    <h4>다양한 스터디그룹이 가득</h4>
	                    <span>#내가 원하는 </span><span>#스터디그룹을 </span><span>#찾을 수 있어요 </span>
	                </div>
	                <div class="content-img1">
	                    <img src="img/main6.png">
	                </div>
	                <div class="content-comment">
	                    <h5>카테고리 또는 검색창으로<br>
	                    원하는 스터디그룹을 검색해보세요.</h5><br>
	                    <span>검색페이지로 이동> </span><a href="#"> 스터디그룹찾기</a>
	                </div>
	            </div>
	            <div class="content">
	                <div class="content-top">
	                    <h4>광고 & 추첨 이벤트</h4>
	                    <span>#STUDY WHID US에 </span><span>#가입하면 </span><span>#이벤트를 통해 </span><span>#선물을 받을 수 있어요</span>
	                </div>
	                <div class="content-img2">
	                    <img src="img/main_event1.png">
	                </div>
	            </div>
			</div>
		</div>
	</section>
	<div>
		<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	</div>
	</div>
</body>
</html>