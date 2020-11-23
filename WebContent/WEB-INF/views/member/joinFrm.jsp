<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<title>Study with Us 회원 가입</title>
 <style>
    
        .joinContainer{
            width: 628px;
            height: 533px;
            margin: 0 auto;
            margin-top: 100px;
        }
        .logo_container{
            text-align: center;
        }
        .logo_container>img{
            width: 140px
            height: 70px;
        }
        .join_info{
            width: 628px;
            height: 420px;
            margin-top: 38px;
            padding-left: 0px;
            display: flex;
            flex-wrap: wrap;
            justify-content: space-around;
        }
        .join_info>li{
            list-style: none;
            width: 285px;
            font-weight: bold;
            border-bottom: 1px solid black;
            height: 26px;
            position: relative;
            font-size: 12px;
        }
        label{
           position: absolute;
        }
        .join_info>li>input{
            right:7px;
            font-size: 10px;
            position: absolute;
            width: 189px;
            height: 13px;
            border: none;
        }
        
        .join_info>li:nth-child(even){
            margin-left: 58px;
        }
        .profile_img{
            width: 511px;
            height: 75px;
        }
        h5{
            margin: 0px;
        }
        .profile{
            display: flex;
            padding-left: 0px;
            margin-top: 10px;
        }
        .profile>li{
            list-style: none;
            width: 50px;
            height: 50px;
            border-radius: 70px;
            overflow: hidden;
            margin-left: 10px;
            
        }
        .profile>li>img{
            width: 100%;
            height: 100%;
            object-fit: cover;
            border-radius: 70%;
            background-color: aqua;
        }
        .join_agree{
            display: block;
            font-size: 12px;
        }
        button{
            width: 308px;
            height: 35px;
            margin-top: 15px;
            color: white;
            background-color: #C54840;
            border: none;
        }
        span{
            position: absolute;
            top: 30px;
            color: red;
            font-size: 10px;
        }


    </style>
    <script>
        var checkNo = 0;
      $(function(){
          $(".join_info>li>input").focusin(function(){
//              $(this).css('right','90px');
              $(this).css('outline','none');
              $(this).animate({
                  'right' : '90px'
              },500);
              
              $(this).prev().animate({
                  'top' : '-20px'
              },500);
          });
           $(".join_info>li>input").focusout(function(){
              
               if($(this).val() == "")
                  {  
                        $(this).animate({
                            'right' : '7px'
                        },500);
                        $(this).prev().animate({
                            'top' : '0px'
                        },500);
                       $(this).next().html("");
                  }

          });
          $("#memberId").keyup(function(){
              var idChk = /^[a-zA-Z0-9]{5,12}$/;
              var id = $(this).val();
              if(idChk.test(id)){
                  $(this).next().css('color','green');
                  $(this).next().html("사용가능합니다.");
                  $(this).attr("pass","true");
                  
              }
              else{
                  $(this).next().css('color','red');
                    $(this).next().html("조건에 일치하지 않습니다.");
                  $(this).attr("pass","false");
              }
          });
          $("#memberPw").keyup(function(){
             var pwChk = /^[a-zA-Z0-9]{5,12}$/; 
             var pw = $(this).val();
                if(pwChk.test(pw)){
                  $(this).next().css('color','green');
                  $(this).next().html("사용가능합니다.");
                  $(this).attr("pass","true");
                  
              }
              else{
                  $(this).next().css('color','red');
                  $(this).next().html("조건에 일치하지 않습니다.");
                  $(this).attr("pass","false");
              }
             
          });
          
          $("#pwChk").keyup(function(){
             if($(this).val() == $("#memberPw").val()) 
                 {
                      $(this).next().css('color','green');
                      $(this).next().html("비밀번호가 일치합니다.");
                      $(this).attr("pass","true");
                 }
              else{
                    $(this).next().css('color','red');
                    $(this).next().html("비밀번호가 일치하지 않습니다.");
                    $(this).attr("pass","false");
              }
          
          });
          
          $("button[type=reset]").click(function(){
               $("span").html("");
              checkNo = 0;
          });
             
         $("#check_agree").click(function(){
             
             if($(this).prop("checked"))
                 {
                    $(this).attr("pass","true");
                 }
             else{
                   $(this).attr("pass","false");
             }
          
         }) ;
          $("#memberMail").keyup(function(){
              if($(this).val()==""){
                  $(this).attr("pass","false");
              }
              else{
                  $(this).attr("pass","true");
              }
        
          });

          $("#nickName").keyup(function(){
              if($(this).val()==""){
                  $(this).attr("pass","false");
              }
              else{
                  $(this).attr("pass","true");
              }
            
          });
          
          $("#memberName").keyup(function(){
              if($(this).val()==""){
                  $(this).attr("pass","false");
              }
              else{
                  $(this).attr("pass","true");
              }
          });
      });
        function form_check(){
            $("input").each(function(index,item){
                console.log($(item).attr("pass"));
                if($(item).attr("pass")){
                    checkNo = checkNo+1;
                }
            });
            
            if(checkNo == 7)
                {
                    return true;
                }
            else{
                return false;
            }
        }
    </script>
</head>
<body>
 <div class="joinContainer">
        <div class="logo_container"><img src="logo.png"></div>
        <form action="/join" method="post" onsubmit="return form_check()">
             <ul class="join_info">
            <li>
                <label for="memberId">* 아이디 </label>
                <input type="text" id="memberId" name="memberId" placeholder="5~12자의 영문 대/소문자와 숫자로만 입력" required>
                <span></span>
            </li>
            <li><label for="memberName">* 이름 </label><input type="text" id="memberName" name="memberName" required></li>
            <li><label for="memberPw">* 비밀번호 </label><input type="password" placeholder="5~12자의 영문 대소문자와 숫자로만 입력" id="memberPw" name="memberPw" required>
            <span>
            </span></li>
            <li><label for="pwChk">* 비밀번호 확인 </label><input type="password" id="pwChk" name="pwChk" required><span></span></li>
            <li><label for="nickName">* 닉네임 </label><input type="text" id="nickName" name="nickName" required></li> 
            <li><label for="memberMail">* 이메일 </label><input type="text" id="memberMail" name="memberMail" required></li> 
            <div class="profile_img">
                <h5>프로필 이미지</h5>
                <ul class="profile">
                    <li><img src="img/ex1.jpg"></li>
                    <li><img src="img/ex2.jpg"></li>
                    <li><img src="img/ex3.gif"></li>
                    <li><img src="img/ex4.jpg"></li>
                    <li><img src="img/ex5.jpg"></li>
                    <li><img src="img/ex6.jpg"></li>
                    <li><img src="img/ex7.jpg"></li>
                    <li><img src="img/ex8.jpg"></li>
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
       
        
    </div>
</body>
</html>