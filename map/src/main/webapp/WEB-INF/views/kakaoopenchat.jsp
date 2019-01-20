<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<meta charset="UTF-8" />

<title>카카오오픈채팅</title>
<!-- kakao api -->
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<style type="text/css">
.openchat{
   display: inline-block;
}
</style> 
</head>
<body>
<nav class="navbar fixed-bottom navbar-light bg-faded justify-content-end">
  <a class="navbar-brand" href="javascript:void plusFriendChat()"><img
      src="https://developers.kakao.com/assets/img/about/logos/plusfriend/consult_small_yellow_pc.png" /></a>
</nav>
   
   <script type='text/javascript'>
      //<![CDATA[
      // 사용할 앱의 JavaScript 키를 설정해 주세요.
      Kakao.init('23d8a57fddc5df5699c1d871e1405c24');
      function plusFriendChat() {
         Kakao.PlusFriend.chat({
            plusFriendId : '_Dzxdxaj' // 플러스친구 홈 URL에 명시된 id로 설정합니다.
         });
      }
      //]]>
   </script>

    <h1>${title }</h1>
</body>
</html></html>