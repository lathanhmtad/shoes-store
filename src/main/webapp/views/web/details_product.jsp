<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="/all_components/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chi tiết sản phẩm</title>
</head>
<body>
	<div class="container py-5">
		<h3 class="mb-3">Chi tiết sản phẩm / ID: ${productDetails.id }</h3>
		<div class="row">
			<div class="col-md-4">
				<div>
					<img alt="" style="width: 100%" src="${pageContext.request.contextPath}/images/shoes/${productDetails.image}"/>
				</div>
			</div>
			<div class="col-md-5">
				<h3 class="mb-3 text-primary">${productDetails.name }</h3>
				<p>
					<span class="w-25 d-inline-block">Trạng thái:</span>
					<c:choose>
					  <c:when test="${productDetails.stock}">
					  	<span class="text-success fw-bold"> 					  	
					  		Còn hàng
					  		<i class="fa-solid fa-check"></i>
					  	</span>
					  </c:when>
					  <c:otherwise>
						<span class="text-danger">
							<i class="fa-solid fa-xmark"></i>
							Hết hàng
						</span>
					  </c:otherwise>
					</c:choose>
				</p>
				<p>
					<span class="w-25 d-inline-block">Loại hàng:</span>
					<c:choose>
					  <c:when test="${productDetails.isNew()}">
					  	<span class="fw-bold"> 					  	
					  		Hàng mới
					  	</span>
					  </c:when>
					  <c:otherwise>
						<span class="fw-bold">
							Hàng bình thường
						</span>
					  </c:otherwise>
					</c:choose>
				</p>
				<p>
					<span class="w-25 d-inline-block">Thể loại:</span>
					<strong>${productDetails.category.name }</strong>
				</p>
					<p>
					<span class="w-25 d-inline-block">Thương hiệu:</span>
					<strong>${productDetails.brand}</strong>
				</p>
				<p>
					<span class="w-25 d-inline-block">Giá:</span>
					<strong class="text-danger fs-4">${productDetails.getPrice()}</strong>
				</p>
				<p>
					<span class="w-25 d-inline-block">Mô tả:</span>
					<strong>${productDetails.description}</strong>
				</p>
					
				<div class="d-flex align-items-center border-top gap-3 pt-4">
					<strong>Số lượng:</strong>
					<div class="d-flex align-items-center border gap-3 py-2 px-2">
						<span class="fs-5"><i class="fa-solid fa-minus"></i></span>
						<span class="fs-5">4</span>
						<span class="fs-5"><i class="fa-solid fa-plus"></i></span>
					</div>
					<a href="#" class="btn btn-danger">
						<i class="fa-solid fa-cart-plus"></i>
						<span>Thêm vào giỏ hàng</span>
					</a>
				</div>
			</div>
			<div class="col-3">
				<div class="row border">
					<div class="col-md-12">
						<div class="d-flex gap-3 align-items-center py-4 border-bottom">
							<div>
								<img src="${pageContext.request.contextPath}/images/xe-hoa-toc.webp"/>
							</div>
							<div>
								<span class="d-block fw-bold">Vận chuyển miễn phí</span>
								<span class="fw-light">Cho đơn hàng > 500.000đ</span>
							</div>
						</div>
					</div>
					<div class="col-md-12">
						<div class="d-flex gap-3 align-items-center py-3 border-bottom">
							<div>
								<img src="${pageContext.request.contextPath}/images/giam_gia.webp"/>
							</div>
							<div>
								<span class="d-block fw-bold">Mua 2 được giảm giá</span>
								<span class="fw-light">Lên đến 10% cho đơn hàng tiếp</span>
							</div>
						</div>
					</div>
					<div class="col-md-12">
						<div class="d-flex gap-3 align-items-center py-3 border-bottom">
							<div>
								<img src="${pageContext.request.contextPath}/images/chung_nhan.webp"/>
							</div>
							<div>
								<span class="d-block fw-bold">Chứng nhận chất lượng</span>
								<span class="fw-light">Sản phẩm chất lượng kiểm định</span>
							</div>
						</div>
					</div>
					<div class="col-md-12">
						<div class="d-flex gap-3 align-items-center py-3 border-bottom">
							<div>
								<img src="${pageContext.request.contextPath}/images/hotline.webp"/>
							</div>
							<div>
								<span class="d-block fw-bold">Hotline: 19001009</span>
								<span class="fw-light">Hỗ trợ tực tiếp nhanh chóng</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>