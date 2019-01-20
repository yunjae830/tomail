<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>투메일 | 당신을 위한 이메일 마케팅</title>
    <meta charset="EUC-KR">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    <!-- 글꼴 -->
   <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">

<style type="text/css">
html{
   overflow-x: hidden;
}
body{
   font-family: 'Nanum Gothic', sans-serif;
}

.navbar {
   min-height: 60px;   
}

.navbar-brand {
   padding-top: 0;
}
.navbar-light .navbar-nav .active>.nav-link{
   padding-right: 30px;
   }
.navbar-expand-sm.scrolled {
  background-color: #fff !important;
  transition: background-color 200ms linear;
}
.container-fluid{
    padding: 0 0 0 0;
    position: relative;
}
.btn {
   background-color: #3E81F6;
   color: #fff;
   width: 145px;
   height: 45px;
}
#a{
   background-image: url("img/bg1.jpg");
    height:  100%; 
    height: 600px;
     /* Center and scale the image nicely */
     background-position: center;
     background-repeat: no-repeat;
    background-size: cover;
    margin-bottom: 50px;
}
   

h5{
   font-size: 17px;
}
.joinbtn{
  position: relative;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  -ms-transform: translate(-50%, -50%);
  font-size: 16px;
  padding: 12px 24px;
  border: none;
  background: rgba(0, 0, 0, 0.5); /* Black background with 0.5 opacity */
  color: #f1f1f1;
  max-width:450px;
  height: 300px;
  border-radius: 5px;
  text-align: center;
  padding-top: 50px;
  

}
.row{
   padding-top: 50px;
   padding-bottom: 50px;
   margin-left: 0;
   margin-right: 0;
}
#img{
   max-width: 450px;
   max-height: 450px;
}
#h2{ 
padding-top: 100px;

}
.col-sm{
   padding: 0px 0 0px 0px;
   
}
.hidden-lg{
 display: none;
}

a, a:link{color: #331254}

@media screen and (max-width:768px){
div.col-sm.hidden-lg{
   display: inline-block;
   padding-top: 0;
}
.hidden-xs {
   display: none;
   }

.navbar-expand-sm{
   background-color: white;
   }
.col-sm{
   padding-top: 25px;
   padding-bottom: 25px;
}   
.row{
   padding-top: 0;
   padding-bottom: 0;
}
#img{
   width: 80%;
}
#h2{
   padding-top: 0px;
   font-size: 25px;
   text-align: center;
}
p{
   font-size: 13px;
   text-align: center;
}
}

</style>
<script type="text/javascript">
$(function () {
     $(document).scroll(function () {
        var $nav = $(".navbar-expand-sm");
        $nav.toggleClass('scrolled', $(this).scrollTop() > $nav.height());
      });
   });
</script>

</head>
<body>
<nav class="navbar navbar-expand-sm fixed-top transparent navbar-light">
<div class="container">
         <a class="navbar-brand" href="main.do"><img alt="tomail" src="img/logo_tomail_font.png" width="100px"></a>
                     
         <button class="navbar-toggler" type="button" data-toggle="collapse"
            data-target="#navbarSupportedContent">
            <span class="navbar-toggler-icon"></span>
         </button>
         <div class="collapse navbar-collapse justify-content-end" id="navbarSupportedContent">
            <ul class="navbar-nav text-right">
               <li class="nav-item active"><a class="nav-link" href="#"><b>고객사례</b></a></li>
               <li class="nav-item active"><a class="nav-link" href="#"><b>도움말</b></a></li>               
               <li class="nav-item active"><a class="nav-link" href="loginform.do"><b>로그인</b></a></li>               

            </ul>
         </div>

         <button class="btn ml-auto rounded-0 hidden-xs" onclick="location.href='joinform.do'"><b>지금 시작하기</b></button>   

      </div>
</nav>

   <div class="container-fluid">
      <div id="a">

         <div class="joinbtn">
            <h2>
               편리한 <strong>이메일마케팅</strong>
            </h2>
            <br>
            <h5>
               <strong>직관적인 화면부터 간편한 전송까지,</strong>
            </h5>
            <h5>
               <strong>새로운 이메일마케팅을 경험해보세요.</strong>
            </h5>
            <br>
            <button class="btn rounded-0" onclick="location.href='joinform.do'">
               <b>지금 시작하기</b>
            </button>
         </div>
      </div>
      <div class="row" align="center">
         <div class="col-sm">
            <img id="img" alt="tomainmain" src="img/main2.png">
         </div>
         <div class="col-sm">
            <h2 id="h2">
               목적에 따라<br>
               <strong>디자인 된 템플릿</strong>
            </h2>
            <br>
            <p>
               지금 바로 사용할 수 있는 멋진 디자인의 템플릿<br>을 제공합니다. 콘텐츠만 준비되어있다면 5<br>분만에
               이메일을 완성할 수 있습니다.
            </p>
         </div>

      </div>
      <div class="row" align="center" style="background-color: #F4F4F5">
         <div class="col-sm">
            <div class="col-sm  hidden-lg">
               <img id="img" alt="tomainmain" src="img/main.png">
            </div>
            <h2 id="h2">
               행동이나 조건에 따라<br>
               <strong>쉽게 발송</strong>되는 이메일
            </h2>
            <br>
            <p>
               가입 환영 메일, 시나리오 메일 등 미리 설정한 행동이나 <br>조건에 따라 이메일을 발송합니다. 고객마다
               개인화된<br>메시지를 발송하여 마케팅 효과를 극대화하세요.
            </p>
         </div>
         <div class="col-sm  hidden-xs">
            <img id="img" alt="tomainmain" src="img/main.png">
         </div>
      </div>
      <div class="row" align="center">
         <div class="col-sm">
            <img id="img" alt="tomainmain" src="img/main3.png">
         </div>
         <div class="col-sm">
            <h2 id="h2">
               자동으로 입력되는<br>
               <strong>맞춤형 상자</strong>
            </h2>
            <br>
            <p>
               이미지를 등록하면 동영상 썸네일이 자동<br>으로 추가됩니다. 이 외에도 지도 상자, SNS 링<br>크
               상자 등 맞춤형 상자를 제공합니다
            </p>
         </div>

      </div>

   </div>

   <div class="row justify-content-center hidden-xs"
      style="background-color: #5B5BAE;">
      <div align="center">
         <img alt="tomainmain" src="img/main4.png"><br>
         <br>
         <br>
         <p style="color: white;">
            온라인 비즈니스의 다양화로 인헤 '투메일'을 필요로하는 다른 기업과 협업하여,<br> 수많은 고객들을
            위해 이메일마케팅을 제공하고 있습니다.
         </p>
         <br>
         <button class="btn btn-md ml-auto rounded-0">
            <b>고객사례 보기</b>
         </button>
      </div>
   </div>
   <div class="row col-sm-12" style="background-color: #F4F4F5">
      <div class="col-sm"  align="center">
         <img alt="tomail" src="img/logo_tomail_font.png" width="150px"><br><br>
         <p><a href="#">이용약관</a> | <a href="#">개인정보취급방침</a> | <a href="#">스팸메일정책</a></p>
      </div>
      <div  class="col-sm"><p style="padding-top: 15px;">(주)투메일, 대표 최경수, 사업자등록번호 100-82-82821,
      통신판매업신고번호 2019-서울역삼-8282,<br>
      서울특별시 강남구 테헤란로14길 6 남도빌딩 2층, 3층, 4층 
      support@tomail.com 080-335-0020</p> </div>
   </div>

   <%@ include file="kakaoopenchat.jsp"  %>  
</body>
</html>