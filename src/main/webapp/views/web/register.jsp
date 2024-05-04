<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="/all_components/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trang đăng ký</title>

</head>
<body style="background-color: #f0f1f2"> 
	
	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card mt-5">
					<div class="card-body">
						<h4 class="text-center py-2">Đăng ký tài khoản</h4>
						
						<c:if test="${not empty failedMsg }">
						 	<div class="alert alert-danger" role="alert">
							  ${ failedMsg}
							</div>
							<c:remove var="failedMsg" scope="session"/>
						 	</c:if>
						 	
						 <c:if test="${not empty succMsg }">
						 	<div class="alert alert-success" role="alert">
							  ${ succMsg}
							</div>
							<c:remove var="succMsg" scope="session"/>
						 	</c:if>
						
						<form method="POST" action="dang-ky">
						  <div class="mb-3">
						    <label for="fullName" class="form-label">
						    <span class="text-danger fs-6">*</span> 
						    	Họ và tên</label>
						    <input name="fullName" 
						    	required="required" type="text" class="form-control" id="fullName" aria-describedby="emailHelp">						 
						  </div>
						  
						  <div class="mb-3">
						    <label for="email" class="form-label">
						    	<span class="text-danger fs-6">*</span> 
						    	Email</label>
						    <input name="email" 
						    	required="required" type="email" class="form-control" id="email" aria-describedby="emailHelp">						 
						  </div>
						  
						  <div class="mb-3">
						    <label for="password" class="form-label">
						  	  <span class="text-danger fs-6">*</span> 
						    	Mật khẩu</label>
						    <input name="password" 
						    	required="required" type="password" class="form-control" id="password">
						  </div>
						  
						  <div class="mb-3">
						    <label for="repeatPassword" class="form-label">
						  	  <span class="text-danger fs-6">*</span> 
						    	Nhập lại mật khẩu</label>
						    <input 
						    	name="repeatPassword"
						    required="required" type="password" class="form-control" id="repeatPassword">
						  </div>
						  
						  <button type="submit" class="btn btn-primary w-100">Gửi</button>
						  
						 <div class="text-center mt-2">
						  	Bạn đã có tài khoản?<a class="ms-1 text-primary" href="dang-nhap">Đăng nhập ở đây.</a>
						 </div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>>
</body>
</html>