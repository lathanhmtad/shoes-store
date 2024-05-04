<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="/all_components/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trang đăng nhập</title>

</head>
<body style="background-color: #f0f1f2"> 

	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card mt-5">
					<div class="card-body">
						<h4 class="text-center py-2">Đăng nhập tài khoản</h4>
						
						<form action="dang-nhap" method="POST">
						 	
						 	<c:if test="${not empty failedMsg }">
						 	<div class="alert alert-danger" role="alert">
							  ${ failedMsg}
							</div>
							<c:remove var="failedMsg" scope="session"/>
						 	</c:if>
						 	
						 	
							  <div class="mb-3">
						    <label for="email" class="form-label">
						    	<span class="text-danger fs-6">*</span>Email</label>
						    <input name="email" required="required" type="email" 
						    	class="form-control" id="email" aria-describedby="emailHelp">						 
						  </div>
						  
						  <div class="mb-3">
						    <label for="password" class="form-label">
						    	<span class="text-danger fs-6">*</span> 
						    		Mật khẩu</label>
						    <input name="password" required="required" type="password" class="form-control" id="password">
						  </div>
			
						  <div class="mb-3 form-check">
						    <input checked type="checkbox" class="form-check-input" id="exampleCheck1">
						    <label  class="form-check-label" for="exampleCheck1">Remember me</label>
						  </div>
						  
					
						  	<button type="submit" class="btn btn-primary w-100">Gửi</button>
						  		
						  		 <div class="text-center mt-2">
						  	Bạn chưa có tài khoản?<a class="ms-1 text-primary" href="dang-ky">Đăng ký ở đây.</a>
						 </div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>