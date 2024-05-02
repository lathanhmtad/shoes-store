<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="/all_components/taglib.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trang chủ</title>
</head>
<body>

<div class="container-fluid back-img">
	<h2 class="text-center text-white position-absolute top-0 mt-5 fs-1 start-0 end-0">
		Hệ thống bán giày lớn nhất việt nam
	</h2>
</div>
	
<%@include file="/all_components/home_section_policy.jsp" %>	
	
<div class="container">
	<div class="row">
		<div class="mt-5"></div>
		<h3 class="text-center">Giày mới nhất</h3>
		
		<c:forEach var="item" items="${productNewList }">
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
		
		<div class="text-center mt-3">
			<a href="san-pham-moi" class="btn btn-warning text-white">Xem tất cả</a>
		</div>
	</div>
	
	<div class="row">
		<div class="mt-5"></div>
		
			<h3 class="text-center">Sản phẩm phổ thông</h3>
			
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
			<div class="text-center">
			<a href="san-pham?cateId=0&page=1" class="btn btn-warning text-white">Xem tất cả</a>
			</div>
		</div>

<script>
$('#pagination').twbsPagination({
    startPage: 1,
    totalPages: 10,
    visiblePages: 4,
    initiateStartPageClick: false,
    onPageClick: function(event, page) {
       
    }
});
</script>
	
</body>
</html>