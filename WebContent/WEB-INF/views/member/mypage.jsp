<%@page import="java.util.ArrayList"%>
<%@page import="groupstudy.model.vo.GroupList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
    	Member myInfo = (Member) request.getAttribute("myInfo");
    	ArrayList<GroupList> gl = (ArrayList<GroupList>) request.getAttribute("group_list");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Page</title>
<style>
.full_container {
	width: 1200px;
	height: 920px;
	margin: auto;
	display: flex;
}

.left_tab {
	width: 182px;
	height: 920px;
	background-color: #E1E1E1;
}

.content_container {
	width: 1018px;
	height: 920px;
}

.banner {
	width: 100%;
	height: 53px;
	line-height: 53px;
	text-align: center;
	font-weight: bold;
	background-color: #8D8D8D;
	color: white;
}

.content {
	width: 100%;
	height: 867px;
}

.content_box {
	width: 76%;
	border: 1px solid black;
	margin: auto;
	height: 27%;
	margin-top: 20px;
	border-top-right-radius: 10px;
	border-top-left-radius: 10px;
}

.content>div:first-child {
	margin-top: 70px;
}

.my_info {
	border: 1px solid transparent;
	width: 100%;
	height: 35%;
	position: relative;
	text-align: center;
}

.my_info>img {
	width: 80px;
	height: 80px;
	border-radius: 70%;
	position: absolute;
	top: -50px;
	right: 45%;
}

.my_info>div {
	margin-top: 45px;
	font-weight: bold;
}

.detail_info {
	display: flex;
	padding: 0;
	margin: auto;
	width: 70%;
	height: 50%;
	flex-wrap: wrap;
	justify-content: space-around;
}

.detail_info>li {
	margin-top: 10px;
	width: 40%;
	height: 20%;
	border-bottom: 1px solid black;
	color: dimgrey;
	font-weight: bold;
	font-size: 12px;
}

li {
	list-style: none;
}

.content>div:first-child>div:nth-child(3) {
	text-align: right;
	padding-right: 40px;
}

a {
	text-decoration: none;
	color: cornflowerblue;
	font-size: 12px;
}

.content_title {
	width: 100%;
	height: 20%;
	border-bottom: 1px solid black;
	background-color: darkgrey;
	color: white;
	text-align: center;
	line-height: 45px;
	font-size: 12px;
	font-weight: bold;
}

.g_list>td:nth-child(2), .g_list>th:nth-child(2) {
	width: 200px;
}

.w_list>td:nth-child(2), .w_list>th:nth-child(2) {
	width: 300px;
}

.w_list>td:nth-child(3), .w_list>th:nth-child(3) {
	width: 50px;
}

.w_list>td:nth-child(4), .w_list>th:nth-child(4) {
	width: 50px;
}

table {
	width: 80%;
	margin: auto;
}

th {
	padding-bottom: 5px;
}

th, td {
	width: 100px;
	text-align: center;
	border-bottom: 1px solid #ddd;
}

td, th {
	font-size: 15px;
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

.tab_icon {
	width: 30%;
	height: 41px;
	margin-right: 10px;
	margin-left: 10px;
}

.leftMenuList>li:not(:first-child):hover {
	color: black;
	background-color: white;
	text-decoration: none;
	border-radius: 20px;
}

.leftMenuList>li {
	display: flex;
	padding-top: 10px;
}

.leftMenuList>li>a {
	width: 60%;
	line-height: 50px;
}

.leftMenuList>li:first-child>a {
	text-indent: 0;
	text-align: center;
	font-weight: bold;
	font-size: 20px;
	padding-left: 30px;
}
</style>
</head>
<body>
	<div style="height: 100px;">
		<%@ include file="/WEB-INF/views/common/header.jsp"%>
	</div>
	<div class="full_container">
		<div class="left_tab">
			<ul class="leftMenuList">
				<li><a class="leftMenuA" href="#"> My Page</a></li>
				<li><img src="img/my.png" class="tab_icon"> <a
					class="leftMenuA" href="#"> My Info</a></li>
				<li><img src="img/pen.png" class="tab_icon"> <a
					class="leftMenuA" href="#">정보수정</a></li>
			</ul>
		</div>
		<div class="content_container">
			<div class="banner">마이 페이지</div>
			<div class="content">
				<div class="content_box">
					<div class="my_info">
						<img src="<%=myInfo.getFilepath()%>">
						<div><%=myInfo.getMemberName()%>님
						</div>
					</div>
					<ul class="detail_info">
						<li>아이디 : <%=myInfo.getMemberId()%></li>
						<li>닉네임 : <%=myInfo.getMemberNickname()%></li>
						<li>이메일 : <%=myInfo.getMemberEmail()%></li>
						<li>등급 : <%if(myInfo.getMemberGrade() == 0){%> 관리자 <%}else if(myInfo.getMemberGrade() == 1){ %>
							정회원 <%}else{ %> 준회원 <%} %>
						</li>
					</ul>
					<div>
						<a href="#">개인정보 수정 및 회원 탈퇴</a>
					</div>
				</div>
				<div class="content_box">
					<div class="content_title">참여 중인 그룹스터디 리스트</div>
					<div class="group_list">
						<table>
							<tr class="g_list">
								<th>그룹 스터디명</th>
								<th>기간</th>
								<th>인원 수</th>
							</tr>

							<%if(gl == null) {%>
							<tr class="g_list">
								<td colspan="3">없음</td>
							</tr>
							<%}else{ %>
							<%for (GroupList a : gl) {%>
							<tr class="g_list">
								<td><%=a.getGroupTitle()%></td>
								<td><%=a.getGroupStartDate()%> ~ <%=a.getGroupEndDate()%></td>
								<td><%=a.getMemberCnt()%>/<%=a.getGroupMax() %>명</td>
							</tr>
							<%} } %>

						</table>
					</div>
				</div>
				<div class="content_box">
					<div class="content_title">알림 리스트</div>
					<div class="work_list">
						<table>
							<tr class="w_list">
								<th>알림 분류</th>
								<th>내용</th>
								<th>확인</th>
								<th>삭제</th>
							</tr>
							<tr class="w_list">
								<th>공지사항</th>
								<td>새로운 공지사항 글이 등록되었습니다.</td>
								<td>안읽음</td>
								<td><input type="checkbox"></td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div>
		<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	</div>
</body>
</html>