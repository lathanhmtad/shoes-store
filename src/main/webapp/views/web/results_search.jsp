<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="/all_components/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Kết quả tìm kiếm</title>

</head>
<body style="background-color: #f0f1f2"> 

	<div class="container">
		<span class="py-4 d-block fs-4">Kết quả tìm kiếm cho từ khóa: <strong>${searchKeyword}</strong></span>
		<div class="row">
			<c:forEach var="item" items="${productList}">
		<div class="col-md-3 mb-4">
			<div class="card card-ho">
				<div class="card-body">
					<img class="img-thumblin" alt="" src="${pageContext.request.contextPath}/images/shoes/${item.image}"
							style="width: 100%; height: 200px; object-fit: cover"
						/>
					
					<span class="fs-5 text-primary mt-2 d-block">${item.name }</span>
					
					<span class="d-block mt-2 fs-6">Thể loại: <span class="fw-bold text-warning fs-6">
							${item.category.name }</span></span>
					
					<span class="d-block mt-2 fs-6">Giá: <span class="fw-bold fs-6">
							${item.price }</span></span>		
					
					<div class="mt-3">
						<a href="chi-tiet-san-pham?pId=${item.id}" class="btn btn-primary me-2">
							<i class="fa-regular fa-eye"></i>
							<span>Chi tiết</span>
						</a>
						<button class="btn btn-danger">
							<i class="fa-solid fa-cart-plus"></i>
							<span>Thêm giỏ hàng</span>
						</button>
					</div>
				</div>
			</div>
		</div>
		</c:forEach> 
		</div>
	</div>
	
</body>
</html>