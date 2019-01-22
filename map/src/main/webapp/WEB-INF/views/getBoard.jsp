<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${board.title }</title>
</head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>


<body>

<div class="jumbotron jumbotron-fluid" style="margin-top:100px;">
  <div class="container">
  	<div class="panel panel-default">
  		<div class="panel-heading">Board Read Page</div>
  				<!-- start panel body -->
  			<div class="panel-body">
  				
  				<div class="form-group">
  					<label>Board Number</label>
  					<input class="form-control" name="seqno" value='<c:out value="${board.bno }"/>' readonly="readonly"/>
  				</div>
  
  				<div class="form-group">			
  					<label>Writer</label>
  					<input class="form-control" name="name" value='<c:out value="${board.writer }"/>' readonly="readonly"/>
  				</div>
  				
  				<div class="form-group">			
  					<label>Receiver</label>
  					<input class="form-control" name="name" value='<c:out value="${board.receiver }"/>' readonly="readonly"/>
  				</div>
  
  				<div class="form-group">
  					<label>Title</label>
  					<input class="form-control" name="title" value='<c:out value="${board.title }"/>' readonly="readonly"/>
  				</div>
  
  				<div class="form-group">
  					<label>Text Area</label>
  					<textarea class="form-control" name="content" readonly="readonly"><c:out value="${board.content }"/></textarea>
				</div>	
  
  				<div class="form-group">
  					<label>Date</label>
  					<input class="form-control" name="regdate" value='<fmt:formatDate value="${board.regdate }" pattern="yyyy-MM-dd"/>' readonly="readonly"/>
  	
  				</div>
  				
  			</div>
  			
  			  		<button class="btn btn-default" data-oper="updateBoard">Update</button>
  					<button class="btn btn-primary" data-oper="getBoards">To List</button>
  			
  				<!-- end panel-body -->
  	</div>
  <!-- end panel -->
  </div>
  <!-- end container -->
</div>
<!-- end jumbo -->

<div class="container">
	<div class="col-lg-12">
	<!-- start panel -->
		<div class="panel panel-default">
		<!-- start panel heading -->
			<div class="panel-heading">
			Reply<button id='addReplyBtn' class='btn btn-primary btn-sm'>New Reply</button>
			</div>
		<!-- end heading -->
		<!-- start panel body -->
		<div class="panel-body">
			<ul class="chat">
			<!-- start reply -->
				<li class="left clearfix" data-rno='12'>
					<div>
						<div class="header">
							<strong class="primary-font">user00</strong>
							<small class="pull-right text-muted">2018-01-01 13:13</small>
						</div>
						<p>Good Job!</p>
					</div>
				</li>
			<!-- end reply -->		
			</ul>
			<!-- end ul -->
		</div>
		<!-- end body -->			
		</div>
		<!-- end panel -->
	</div>
</div>

<div class="container">
  <div class="modal fade" id="myModal" tabindex="-1">
    <div class="modal-dialog">
      <div class="modal-content">
        <!-- Modal Header -->
        <div class="modal-header">
        	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          	<h4 class="modal-title" id="myModalLabel">Reply Modal</h4>
        </div>
        <!-- Modal body -->
        <div class="modal-body">
        	<div class="form-group">
        		<label>Reply</label>
        		<input class="form-control" name="reply" value="New Reply"/>
        	</div>
        	<div class="form-group">
        		<label>Replier</label>
        		<input class="form-control" name="replyer" value="replyer"/>
        	</div>
        	<div class="form-group">
        		<label>Reply Date</label>
        		<input class="form-control" name="replyDate" value=""/>
        	</div>
        </div>
        <!-- Modal footer -->
        <div class="modal-footer">
          <button id="modalModBtn" type="button" class="btn btn-warning">Modify</button>
          <button id="modalRemoveBtn" type="button" class="btn btn-danger">Remove</button>
          <button id="modalRegisterBtn" type="button" class="btn btn-primary">Register</button>
          <button id="modalCloseBtn" type="button" class="btn btn-close">Close</button>
        </div>
      </div>
    </div>
  </div>
  
</div>

</body>
</html>