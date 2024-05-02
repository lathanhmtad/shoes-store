<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
						
						<form>
						 
						  <div class="mb-3">
						    <label for="email" class="form-label">
						    	<span class="text-danger fs-6">*</span> Email</label>
						    <input required="required" type="email" class="form-control" id="email" aria-describedby="emailHelp">						 
						  </div>
						  
						  <div class="mb-3">
						    <label for="password" class="form-label">
						    	<span class="text-danger fs-6">*</span> 
						    		Mật khẩu</label>
						    <input required="required" type="password" class="form-control" id="password">
						  </div>
			
						  <div class="mb-3 form-check">
						    <input type="checkbox" class="form-check-input" id="exampleCheck1">
						    <label class="form-check-label" for="exampleCheck1">Remember me</label>
						  </div>
						  
					
						  	<button type="submit" class="btn btn-primary w-100">Gửi</button>
						  		
						  		 <div class="text-center mt-2">
						  	Bạn chưa có tài khoản?<a class="ms-1" href="auth?action=register">Đăng ký ở đây.</a>
						 </div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>