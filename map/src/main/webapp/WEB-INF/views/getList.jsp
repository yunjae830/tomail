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
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
 
</head>
<body>

<div class="container" style="margin-top:50px;">
   
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
               <td><a class="move" href="<c:out value='getBoard.do?bno=${board.bno }'/>"><c:out value="${board.title }"/></a></td>
               <td><c:out value="${board.receiver }"/></td>
               <td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate }"/></td>
            </tr>
            </c:forEach>
         </tbody>
      </table>


	<form id="searchForm" action="getList.do" method="post">
		<select name="type">
			<option value="" <c:out value="${pageMaker.cri.type == null ? 'selected' : '' }"/>>---</option>
			<option value="T" <c:out value="${pageMaker.cri.type eq 'T' ? 'selected' : '' }"/>>제목</option>
			<option value="C" <c:out value="${pageMaker.cri.type eq 'C' ? 'selected' : '' }"/>>내용</option>
			<option value="R" <c:out value="${pageMaker.cri.type eq 'R' ? 'selected' : '' }"/>>수신자</option>
		</select>
		<input type="text" name="keyword" value="<c:out value="${pageMaker.cri.keyword }"/>"/>
		<input type="hidden" name="pageNum" value="<c:out value="${pageMaker.cri.pageNum }"/>"/>
		<input type="hidden" name="amount" value="<c:out value="${pageMaker.cri.amount }"/>"/>
		<button class="btn btn-default btn-sm">Search</button>
	</form>
	
	
   
   	<ul class="pagination">
   		<c:if test="${pageMaker.prev }">
   			<li class="page-item"><a class="page-link" href="${pageMaker.startPage -1 }">Previous</a></li>
   		</c:if>
   		<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
			<li class="page-item <c:if test="${pageMaker.cri.pageNum == num }">active</c:if>">
			<a class="page-link" href="<c:out value="getList.do?pageNum=${num }&amount=${pageMaker.cri.amount }&keyword=${pageMaker.cri.keyword }&type=${pageMaker.cri.type }"/>">${num }</a></li>
   		</c:forEach> 
   		<c:if test="${pageMaker.next }">
   			<li class="page-item"><a class="page-link" href="${pageMaker.endPage + 1 }">Next</a></li>
   		</c:if>
   	</ul>
   
</div>

<script type="text/javascript" src="js/jquery-3.3.1.min.js">

$(document).ready(function(){
	
	var result = '<c:out value="${result}"/>';
	
	if(result === ''|| history.state){
		return;
	}
	if(parseInt(result) > 0){
		alert(result);
	}
	 
	history.replaceState({}, null, null);
	
	var searchForm = $("#searchForm");
	
	$("#searchForm button").on("click", function(e) {
		
		if(!searchForm.find("option:selected").val()){
			alert("검색 종류를 선택해주세요.");
			return false;
		}
		
		if(!searchForm.find("input[name='keyword']").val()){
			alert("키워드를 입력하세요.");
			return false;
		}
		
		searchForm.find("input[name='pageNum']").val("1");
		e.preventDefault();
		searchForm.submit();
	});
	
});

</script>

</body>
</html>