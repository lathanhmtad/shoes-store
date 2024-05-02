<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="/all_components/taglib.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thêm sản phẩm</title>
</head>
<body>
<div class="container">
	<div class="row">
		<a class="text-primary mt-3 fs-5" href="admin-product">Về trang danh sách sản phẩm</a>	
		<div class="col-md-4 offset-md-4">
			<div class="card mt-4">
				<div class="card-body">
					<h4 class="text-center text-primary py-2">Thêm sản phẩm</h4>
					
					<c:if test="${not empty succMsg }">
						<div class="alert alert-primary" role="alert">
							 <p class="text-center text-success fs-6 mb-0">${succMsg }</p>
						</div>
						<c:remove var="succMsg" scope="session"/>
					</c:if>
					
					<c:if test="${not empty failedMsg }">
						<div class="alert alert-danger" role="alert">
							 <p class="text-center fs-6 mb-0">${failedMsg }</p>
						</div>
						<c:remove var="failedMsg" scope="session"/>
					</c:if>
					
					<form enctype="multipart/form-data" action="admin-product?type=add" method="POST">
						  <div class="mb-3">
						    <label for="name" class="form-label">
						    <span class="text-danger fs-6">*</span> 
						    	Tên sản phẩm</label>
						    <input required="required" type="text" name="name" class="form-control" id="name">						 
						  </div>
						  
						  <div class="mb-3">
						    <label for="brand" class="form-label">
						    	<span class="text-danger fs-6">*</span> 
						    	Thương hiệu</label>
						    <input required="required" type="text" name="brand" class="form-control" id="brand">						 
						  </div>
						  
						  <div class="mb-3">
						  	<span class="text-danger fs-6">*</span><span class="d-inline-block">Thể loại</span>
							  <select required="required" name="categoryId" class="form-select">
									 <option selected>----Thể loại---</option>
								  	<c:forEach var="cate" items="${categories }">
								  			 <option value="${cate.id }">${cate.name }</option>
								  	</c:forEach>
								  
								</select>
						  </div>
						  
						  <div class="mb-3">
						    <label for="image" class="form-label">
						  	  <span class="text-danger fs-6">*</span> 
						    	Hình ảnh</label>
						    <input required="required" type="file" name="image" class="form-control" id="image">
						  </div>
						  
						  <div class="mb-3">
						    <label for="price" class="form-label">
						  	  <span class="text-danger fs-6">*</span> 
						    	Giá</label>
						    <input required="required" type="number" name="price" class="form-control" id="price">
						  </div>
						  
						  <span class="text-danger fs-6">*</span><span class="py-4 me-3 d-inline-block">Tình trạng:</span>
						  <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
							  <input value="true" 
							  	type="radio" class="btn-check" name="stock" id="btnradio1" autocomplete="off" checked>
							  <label class="btn btn-outline-primary" for="btnradio1">Còn hàng</label>
							
							  <input value="false" type="radio" class="btn-check" name="stock" id="btnradio2" autocomplete="off">
							  <label class="btn btn-outline-primary" for="btnradio2">Hết hàng</label>
							</div>
							
							<div></div>
							
							<span class="text-danger fs-6">*</span><span class="py-4 mb-2 me-3 d-inline-block">Loại hàng:</span>
						  <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
							  <input value="true" type="radio" class="btn-check" name="isNew" id="btnradio3" 
							  autocomplete="off" checked>
							  <label class="btn btn-outline-primary" for="btnradio3">Hàng mới</label>
							
							  <input value="false" type="radio" class="btn-check" name="isNew" id="btnradio4" autocomplete="off">
							  <label class="btn btn-outline-primary" for="btnradio4">Loại bình thường</label>
							</div>
						  
						  <div class="mb-3">
							  <label for="description" class="form-label"><span class="text-danger fs-6">*</span>Mô tả</label>
							  <textarea required="required" class="form-control" name="description" id="description" rows="3"></textarea>
							</div>
					  
					  <button type="submit" class="btn btn-primary w-100">Tạo mới</button>
					  
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>