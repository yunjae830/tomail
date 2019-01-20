<%@page import="javafx.scene.control.Alert"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<script type="text/javascript">

</script>
<body>
   <div class="container">
      <div class="row justify-content-center">
         <div>
            <div align="center">
               <div>
                  <img alt="tomail" src="img/logo_tomail.png" width="200px" onclick="location.href='main.do'"><br>
               </div>
               <div>
                  <h3><strong>비밀번호가 재설정 됐습니다</strong></h3><br>
                  <p>
                     	새로운 비밀번호를 입력하세요.
                  </p>
               </div>
            </div><br>
            <div>
               <form action="pass_change_ck.do" name="regiform">
                  <div class="form-group">
                     <label class="control-label" for="email"><b>비밀번호</b></label><br>
                     <small>비밀번호는 영문,숫자를 포함하고 8자 이상이여야합니다.</small> 
                     <input class="form-control" id="password" name="members_pw" type="password" required="required" />
                     <input name="members_email" type="hidden" value="${email }">
                  </div>
                  <div>
                     <button class="btn btn-primary btn-lg btn-block login-button" type="submit" title="비밀번호 재설정" id="pass_change">비밀번호 재설정하기</button>
                  </div>
                  
               </form>
               <div align="center">
                  <br>
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