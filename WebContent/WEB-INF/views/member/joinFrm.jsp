<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="/js/joinFrm.js" defer></script>
<link rel="stylesheet" type="text/css" href="/css/join.css">
<title>Study with Us 회원 가입</title>
</head>


<body>

  <div class="joinContainer">
        <div class="logo_container"><img src="/img/logo.png"></div>
        <form action="/join" method="post" onsubmit="return form_check()">
            <ul class="join_info">
                <li>
                    <label for="memberId">* 아이디 </label>
                    <input type="text" id="memberId" name="memberId" placeholder="5~12자의 영문 대/소문자와 숫자로만 입력" required>
                    <span></span>
                    <button type="button" id="dupleChk">확인</button>
                    <button type="button" id="cancelUse">취소</button>
                </li>
                <li><label for="memberName">* 이름 </label><input type="text" id="memberName" name="memberName" required></li>
                <li><label for="memberPw">* 비밀번호 </label><input type="password" placeholder="5~12자의 영문 대소문자와 숫자로만 입력" id="memberPw" name="memberPw" required>
                    <span>
                    </span>
                </li>
                <li><label for="pwChk">* 비밀번호 확인 </label><input type="password" id="pwChk" name="pwChk" required><span></span></li>
                <li><label for="nickName">* 닉네임 </label><input type="text" id="nickName" name="nickName" required></li>
                <li><label for="memberMail">* 이메일 </label><input type="text" id="memberMail" name="memberMail" required></li>
                <div class="profile_img">
                    <h5>프로필 이미지</h5>
                    <ul class="profile">
                        <li>
                            <input type="radio" id="ex1" name="pro_img" value="1.jpg">

                            <label for="ex1"><img src="img/ex1.jpg"></label>
                        </li>
                        <li>
                            <input type="radio" id="ex2" name="pro_img" value="2.jpg">

                            <label for="ex2"><img src="img/ex2.jpg"></label>
                        </li>
                        <li>
                            <input type="radio" id="ex3" name="pro_img" value="3.gif">

                            <label for="ex3"> <img src="img/ex3.gif"></label>
                        </li>
                        <li>
                            <input type="radio" id="ex4" name="pro_img" value="4.jpg">

                            <label for="ex4"><img src="img/ex4.jpg"></label>
                        </li>
                        <li>
                            <input type="radio" id="ex5" name="pro_img" value="5.jpg">

                            <label for="ex5"><img src="img/ex5.jpg"></label>
                        </li>
                        <li>
                            <input type="radio" id="ex6" name="pro_img" value="6.jpg">

                            <label for="ex6"> <img src="img/ex6.jpg"></label>
                        </li>
                        <li>
                            <input type="radio" id="ex7" name="pro_img" value="7.jpg">

                            <label for="ex7"> <img src="img/ex7.jpg"></label>
                        </li>
                        <li>
                            <input type="radio" id="ex8" name="pro_img" value="8.jpg">

                            <label for="ex8"> <img src="img/ex8.jpg"></label>
                        </li>
                    </ul>
                </div>
                <div class="join_agree">
                    <div>
                        <input type="checkbox" name="check_agree" id="check_agree" required>이용약관, 개인정보 수집 및 이용에 모두 동의합니다.
                    </div>
                    <div>
                        <button type="submit">회원가입</button>
                        <button type="reset">초기화</button>
                    </div>
                </div>
            </ul>
        </form>



</body>
</html>