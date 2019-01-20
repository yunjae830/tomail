<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form"  uri="http://www.springframework.org/tags/form" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- CSS for Bootstrap -->
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<title>메일 보내기</title>
</head>
<body>
<div class="container" align="center">
  <h4>메일 보내기</h4>
  <form:form action="mailSending.do" method="post" enctype="multipart/form-data" modelAttribute="uploadFile">
    <div align="center" style="width: 50%;"><!-- 받는 사람 이메일 -->
      <input type="text" name="tomail" width="100%" placeholder="상대의 이메일" class="form-control">
		<div class="form-group">
        <input class="form-control" type="file" name="files" multiple="multiple">
      </div>
 	</div>
    <div align="center"><!-- 제목 -->
      <input type="text" name="title" size="120" style="width:50%" placeholder="제목을 입력해주세요" class="form-control" >
    </div>
    <p>
    <div align="center"><!-- 내용 --> 
      <textarea name="content" cols="120" rows="12" style="width:50%; resize:none" placeholder="내용#" class="form-control"></textarea>
    </div>
    <p>
    <div align="center">
      <input id="submit" type="submit" value="메일 보내기" class="btn btn-primary">
    </div>
  </form:form>
</div>
</body>
</html> 