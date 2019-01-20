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
   <!-- sweetalert -->
   <script src="js/sweetalert2.all.min.js"></script>
   <script src="js/sweetalert2.min.js"></script>
   <link rel="stylesheet" href="js/sweetalert2.min.css">
</head>
<style type="text/css">
body{
   font-family: 'Nanum Gothic', sans-serif;
}
.blueBox {border: 1px solid blue;}
.redBox{border: 1px solid red;}
div{padding-bottom: 10px;}
</style>
<script type="text/javascript"> 
function clause(){
	var pw1 = document.forms["regiform"]["members_pw"].value;
	var pw2 = document.forms["regiform"]["members_pw_check"].value;
   	var f=document.forms[0];
   	var n = document.forms["regiform"]["members_name"].value;
   	var e = document.forms["regiform"]["members_email"].value;
   if(f.ch.checked && f.ch1.checked && n != "" && e != "" && pw1 != "" && pw2 != ""){
      f.join.disabled=false;
   }
   else{
      f.join.disabled=true;
   }
   if(pw1!=pw2){
	      document.getElementById('pwsame').style.color = "red";
	      document.getElementById('pwsame').innerHTML = "비밀번호가 일치하지 않습니다.";
	      f.join.disabled=true;
   }else{
	      document.getElementById('pwsame').style.color = "#007BFF";
	      document.getElementById('pwsame').innerHTML = "비밀번호가 확인 되었습니다.";
	      if(pw1==""&&pw2==""){
	    	  document.getElementById('pwsame').innerHTML = "";
	      }
	     }
}
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
                  <h3><strong>환영합니다!</strong></h3><br>
                  <p>
                     간편하게 이메일을  만들고 발송하세요. <br> 무료로 사용할 수 있습니다.
                  </p>
               </div>
               <div>
                  <a href="loginform.do">이미 가입하셨습니까? 로그인하기</a>
               </div>
            </div><br>
            <div>
               <form action="join.do" name="regiform" method="post">
                  <div class="form-group">
                     <label class="control-label" for="name">이름</label><br>
                     <input class="form-control" id="name" name="members_name" type="text" placeholder="예.둘리" required="required" onkeyup="clause()"/>
                  </div>
                  <div class="form-group">
                     <label class="control-label" for="email">이메일</label><br>
                     <small>로그인 할 때 사용할 업무용 개인 이메일 주소를 입력하세요.</small> 
                     <input class="form-control" id="email" name="members_email" type="email" placeholder="예.example@gmail.com" required="required" onkeyup="clause()"/>
                  </div>
                  <div class="form-group">
                     <label class="control-label" for="pass">비밀번호</label><br>
                     <small>비밀번호는 영문, 숫자를 포함하고 8자 이상이어야 합니다.</small>
                     <div>
                        <input class="form-control" id="pass" name="members_pw" type="password"  required="required" onkeyup="clause()"/>       
                     </div>       
                  </div>
                  <div class="form-group">
                     <label class="control-label" for="passCheck" >비밀번호 확인</label><br>
                     <div>
                        <input class="form-control"  onkeyup="clause()" id="passCheck" name="members_pw_check" type="password"  required="required"/>         
                        <small id="pwsame" style="color:red;"></small>
                     </div>       
                  </div>
                  <div>
                     <input type="checkbox" name="ch" onclick="clause();"> <label>
                        <strong> <a href="#">서비스 이용 약관</a>에 동의합니다.
                     </strong> <br />
                     </label>

                  </div>
                  <div>
                     <input type="checkbox" name="ch1" onclick="clause();"> <label>
                        <strong> <a href="#">개인정보 수집, 이용 및 취급위탁</a> 에 동의합니다.
                     </strong>
                     </label>
                  </div> <br/>
                  <div>
                     <button class="btn btn-primary btn-lg btn-block login-button" id="reg" type="submit" title="회원가입" disabled="disabled" name="join">회원등록</button>
                     <!-- disabled : 칸은 보이지만 사용 못함 -->
                  </div>
                  
               </form><br>
               <div align="center">
                  <div>
                     <a href="main.do">tomail.com으로 돌아가기</a>
                  </div><br><br><br>
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