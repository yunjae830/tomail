<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    <!-- 글꼴 -->
   <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
   <!-- emoji -->
   <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">
   <!-- sweetalert -->
   <script src="js/sweetalert2.all.min.js"></script>
   <script src="js/sweetalert2.min.js"></script>
   <link rel="stylesheet" href="js/sweetalert2.min.css">
<title>주소록</title>
</head>
<style type="text/css">
html{
   overflow-x: hidden;
}
body{
   font-family: 'Nanum Gothic', sans-serif;
}
.navbar {
   min-height: 60px;   
   border-bottom: 2.5px solid #F4F4F5;
}

.navbar-brand {
   padding-top: 0;
}
.navbar-light .navbar-nav .active>.nav-link{
   padding-left: 80px;
   color: #B4B4B4;
   }
.dropdown-menu.show {
   margin-top: 17px;
}   
.dropdown-menu{
    width: 250px !important;
}
#user{
   padding-right: 100px;   
}
i{
   cursor: pointer;
}
i, i:link{
   color: #808080
}
h2{
   margin-top: 60px;
}
.row{
   padding: 10px 150px 10px 150px;
}
.card{
 border: 1px solid white;
}
.btn{
   width: 130px;
   background-color: #3879EA;
   color: white;
}

#mainword{
   color: #989A98;
   font-size: 14px;
}
.mobileonly{
   display: none;
   background-color: #E9ECEF;
}
@media screen and (max-width:768px){
#user{
   padding-right: 0px;
}   
.dropdown{
    display: none;
   
}
.row{
   padding: 10px 10px 10px 10px;
}
.table{
   display: none;
}
.mobileonly{
   display: block;
   height: 273.14px;
   padding-top: 90px;
}
}
</style>
<script type="text/javascript">
function pcok(){
   Swal({
        type: 'error',
        title: '데스크탑만 가능합니다.'
      });
}

</script>  
<body>
<nav class="navbar navbar-expand-md navbar-light">
      <div class="container">
         <a class="navbar-brand" href="main2.do"><img alt="tomail"
            src="img/logo_tomail_font.png" width="100px"></a>

         <button class="navbar-toggler" type="button" data-toggle="collapse"
            data-target="#navbarSupportedContent">
            <span class="navbar-toggler-icon"></span>
         </button>

         <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav text-right">
               <li class="nav-item active"><a class="nav-link" href="#">임시메일함</a></li>
               <li class="nav-item active"><a class="nav-link" href="#">주소록</a></li>
            </ul>
         </div>
         <div id="a" class="dropdown justify-content-end text-right" data-toggle="dropdown">
            <a id="user" class="">
               <i class="fas fa-user"></i>
            </a>
            <div class="dropdown-menu">
               <a class="dropdown-item" href="#" style="margin-top: 10px;"><b>${email }</b></a><hr>
               <a class="dropdown-item" href="#">계정관리</a> 
               <a class="dropdown-item" href="#">고객사례</a> 
               <a class="dropdown-item" href="#">도움말</a>
               <a class="dropdown-item" href="#" onclick="location.href='logout.do'">로그아웃</a>
            </div>
         </div>

      </div>
   </nav>
   
   
</body>
</html>