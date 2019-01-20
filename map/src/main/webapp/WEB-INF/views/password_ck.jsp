<%@page import="javafx.scene.control.Alert"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
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
</head>
<style type="text/css">
body{
   font-family: 'Nanum Gothic', sans-serif;
}
small{
	color: #989A98;
}
.blueBox {border: 1px solid blue;}
.redBox{border: 1px solid red;}
div{padding-bottom: 10px;}
</style>
<body>
   <div class="container">
      <div class="row justify-content-center">
         <div>
            <div align="center">
               <div>
                  <img alt="tomail" src="img/logo_tomail.png" width="200px" onclick="location.href='main.do'"><br>
               </div>
               <div>
                  <h3><strong>비밀번호를 잊어버리셨군요!</strong></h3><br>
                  <p>
                     	이 기회에 비밀번호를 바꿔보세요.
                  </p>
               </div>
            </div><br>
            <div>
               <form action="pass.do" name="regiform">
                  <div class="form-group">
                     <label class="control-label" for="email"><b>가입한 이메일</b></label><br>
                     <small>회원가입 할 때 사용한 이메일 주소를 입력하세요.</small> 
                     <input class="form-control" id="email" name="members_email" type="email" placeholder="예.example@gmail.com" required="required" />
                  </div>
                  <div>
                     <button class="btn btn-primary btn-lg btn-block login-button" type="submit" title="메일 인증" id="mail_ck">비밀번호 재설정 링크 보내기</button>
                     <!-- disabled : 칸은 보이지만 사용 못함 -->
                  </div>
                  
               </form>
               <div align="center">
                  <div>
                     <a href="main.do">tomail.com으로 돌아가기</a>
                  </div><br><br>
                  <div>
                     <img alt="tomail" src="img/logo_tomail_font.png" width="150px"><br>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
   
</body>
</html>