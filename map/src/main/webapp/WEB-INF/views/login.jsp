<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>투메일 로그인</title>
<meta charset="EUC-KR">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<!-- 글꼴 -->
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic"
	rel="stylesheet">
<style type="text/css">
body {
	font-family: 'Nanum Gothic', sans-serif;
}

html {
	overflow: scroll;
	overflow: hidden;
}

div {
	padding-bottom: 5px;
}

hr {
	border: solid 0.5px #DEE2E6;
}

.tomail {
	background-color: transparent;
	border: 2px solid black;
	border-color: black;
}

.bg {
	background-image: url("img/bg.png");
	/* Full height */
	height: 100%;
	/* Center and scale the image nicely */
	background-position: center;
	background-repeat: no-repeat;
	background-size: cover;
}

.bb {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	-ms-transform: translate(-50%, -50%);
	font-size: 16px;
	padding: 12px 24px;
	border: none;
	cursor: pointer;
	border-radius: 5px;
	text-align: center;
}

b {
	font-size: 15px;
	cursor: default;
}
@media ( max-width :769px) {
	.hidden-xs {
		display: none;
	}
	html {
	overflow: scroll;
}
}
</style>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	var f = null;
	var ch = 0;
	function Login_ck() {
		f = document.forms[0];
		if (f.ch.checked) {
			ch = 1;
		}
		if (!f.ch.checked) {
			ch = 0;
		}
	}
	function mytest() {
		var pw1 = document.forms["loginForm"]["members_pw"].value;
		var e = document.forms["loginForm"]["members_email"].value;

		var form = {
			members_email : e,//dto와 이름 같게 해서 보내야함
			members_pw : pw1,
			login_check : ch
		//로그인 유지기능
		};
		$.ajax({
			type : "post",
			data : JSON.stringify(form),
			dataType : 'json', //서버에서 보내는 데이터 타입 
			contentType : "application/json; charset=UTF-8", //서버로 보내는타입 
			url : "login.do",
			success : function(result) {
				if(result.mail_checked === 'true'){
				if (result.login_true == 1) {
					alert("어서오세요~ 투메일입니다");
					location.href = "main2.do";
				}
				}else if (result.mail_ck_false === 'false'){
					alert("이메일 인증이 필요합니다!");
					location.href = "loginform.do";
				}else if (result.login_false == 0) {
					alert("잘못된 정보입니다");
				}
			}
		});
	}
</script>
</head>
<body>
	<div class="container-fluid">
		<div class="row">


			<div class="col-lg-6" style="height: 888px;">
				<br>
				<div class="row justify-content-center">
					<div>
						<div align="center">
							<div class="img">
								<a href="main.do" title="tomail"> <img alt="tomail"
									src="img/logo2.png" width="200px"></a>
							</div>
							<h4>
								<strong>다시 만나서 반가워요!</strong>
							</h4>
							<br> <a href="joinform.do">처음이신가요? 가입하기</a>

						</div>
						<br>

						<form class="justify-content-center" onsubmit="mytest()"
							name="loginForm" method="post">
							<div class="form-group">
								<label class="control-label" for="email">이메일 주소</label> <input
									class="form-control" id="email" name="members_email"
									type="email" required="required" />
							</div>
							<div class="form-group">
								<label class="control-label" for="pass">비밀번호</label><br>
								<div>
									<input class="form-control" id="pass" name="members_pw"
										type="password" required="required" />
								</div>
							</div>
							<div>
								<button class="btn btn-primary btn-lg btn-block" type="submit"
									title="로그인">로그인</button>
							</div>
							<br>
							<div>
								<input type="checkbox" name="ch" onclick="Login_ck()"><a>
									로그인 상태 유지하기</a>
							</div>
							<div align="center">
								<hr width="300px;">
								<a href="password.do">비밀번호를
										잊어버리셨나요?</a>
							</div>
							<br> <br> <br>
							<div align="center">
								<div>
									<img alt="tomail" src="img/logo_tomail_font.png" width="150px"><br>
								</div>
							</div>
							<br> <br>
						</form>
					</div>
				</div>

			</div>
			<div class="col-lg-6 hidden-xs" style="padding: 0 0 0 0;">
				<div class="bg">
					<div class="bb">
						<b>투메일로 만든 다양한 이메일을 확인해보세요.</b><br> <b>누구나 더 좋은 이메일을 만들 수
							있습니다.</b><br> <br>
						<button class="btn tomail">
							<b>투메일로 만든 이메일 사례 보기</b>
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>