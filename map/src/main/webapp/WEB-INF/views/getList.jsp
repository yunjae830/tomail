<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>대시보드 | 투메일</title>

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

<script type="text/javascript">

$(document).ready(function(){
	
	var result = '<c:out value="${result}"/>';
	
	if(result === ''|| history.state){
		return;
	}
	if(parseInt(result) > 0){
		alert(result);
	}
	
	history.replaceState({}, null, null);
	
	var actionForm = $("#actionForm");
	
	$(".page-item a").on("click", function(e){
		e.preventDefault();
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();
	});
	
	$(".move").on("click", function(e){
		e.preventDefault();
		actionForm.append("<input type='hidden' name='bno' value='" + $(this).attr("href") + "'>");
		actionForm.attr("action", "getBoard.do");
		actionForm.submit();
	});
	
});

</script>
 
</head>
<body>

<div class="container">
   
      <div><h5> 보낸 이력 확인하기</h5></div>
      <table class="table">
         <thead class="thead-light">
            <tr>
 				<th> # </th>           
               	<th>제목</th>
               	<th>메일주소</th>
               	<th>보낸 날짜</th>
            </tr>
         </thead>
         <tbody>

         	<c:forEach items="${list }" var="board">
            <tr>
               <td><c:out value="${board.bno }"/></td>
               <td><a class="move" href="${board.bno }"><c:out value="${board.title }"/></a></td>
               <td><c:out value="${board.receiver }"/></td>
               <td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate }"/></td>
            </tr>
            </c:forEach>
         </tbody>
      </table>


   
   	<ul class="pagination">
   		<c:if test="${pageMaker.prev }">
   			<li class="page-item"><a class="page-link" href="${pageMaker.startPage -1 }">Previous</a></li>
   		</c:if>
   		<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
			<li class="page-item <c:if test="${pageMaker.cri.pageNum == num }">active</c:if>">
			<a class="page-link" href="${num }">${num }</a></li>
   		</c:forEach>
   		<c:if test="${pageMaker.next }">
   			<li class="page-item"><a class="page-link" href="${pageMaker.endPage + 1 }">Next</a></li>
   		</c:if>
   	</ul>
   	<form id="actionForm" action="getList.do" method="get">
   		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }"/>
   		<input type="hidden" name="amount" value="${pageMaker.cri.amount }"/>
   	</form>
   
</div>

</body>
</html>