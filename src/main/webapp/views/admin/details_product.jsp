<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
	<div class="row">
		<h3 class="my-3">Chi tiết sản phẩm có id / ${product.id }</h3>
		<div class="col-md-4">
			<img alt="" style="width: 250px" src="${pageContext.request.contextPath}/images/shoes/${product.image}"/>
		</div>
		
		<div class="col-md-8">
			<p>
				<span>Tên sản phẩm:</span>
				<strong>${product.name }</strong>
			</p>
			<p>
				<span>Thương hiệu:</span>
				<strong>${product.brand }</strong>
			</p>
			<p>
				<span>Thể loại:</span>
				<strong>${product.category.name}</strong>
			</p>
			<p>
				<span>Giá:</span>
				<strong>${product.price }</strong>
			</p>
			<p>
				<span>Mô tả:</span>
				<strong>${product.description }</strong>
			</p>
			<p>
				<span>Trạng thái:</span>
				<strong>${product.stock ? 'Còn hàng' : 'Hết hàng' }</strong>
			</p>
			
			<p>
				<span>Loại hàng:</span>
				<strong>${product.isNew() ? 'Hàng mới' : 'Hàng bình thường' }</strong>
			</p>
		</div>
	</div>
	</div>
</body>
</html>