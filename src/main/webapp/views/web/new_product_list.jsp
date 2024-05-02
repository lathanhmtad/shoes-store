<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="/all_components/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
	<div class="row">
		<h3 class="text-center pt-5">Tất cả sản phẩm mới nhất</h3>
		<c:forEach var="item" items="${newProductList }">
			<div class="col-md-3">
			<div class="card card-ho">
				<div class="card-body">
					<div class="position-relative">
						<img 
							style="width: 75px;"
							class="position-absolute" 
							src="images/new.gif" alt=""/>
						<img class="img-thumblin" alt="" 
							src="${pageContext.request.contextPath}/images/shoes/${item.image}"
							style="width: 100%; height: 200px; object-fit: cover"
						/>
					</div>
					
					<span class="fs-5 text-primary mt-2 d-block">${item.name }</span>
					
					<span class="d-block mt-2 fs-6">Thể loại: <span class="fw-bold text-warning fs-6">
							${item.category.name }</span></span>
					
					<span class="d-block mt-2 fs-6">Giá: <span class="fw-bold fs-6">
							${item.price }</span></span>		
					
					<div class="mt-3">
						<a href="chi-tiet-san-pham?pId=${item.id}" class="btn btn-primary me-2">
							<i class="fa-regular fa-eye"></i>
							<span>Chi tiết</span></a>
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