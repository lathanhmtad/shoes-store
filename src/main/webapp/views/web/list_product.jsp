<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="/all_components/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trang sản phẩm</title>
</head>
<body>
<div class="container">
<div class="row">
	<div class="mt-5"></div>
		
	<div class="col-md-3">
		<h3>Danh mục giày</h3>
		<div class="list-group">
			 <a href="san-pham?&cateId=0&page=1" 
			 	class="list-group-item list-group-item-action ${currentCateId == 0 ? 'active' : '' }">
			    Tất cả
			  </a>
			<c:forEach var="item" items="${cateList }">
				<a href="san-pham?&cateId=${item.id}&page=1" 
					class="list-group-item list-group-item-action ${currentCateId == item.id ? 'active' : '' }">${item.name}
				</a>
			</c:forEach>
		</div>
	</div> 
		
	<div class="col-md-9">
	<h3 class="text-center">Tất cả sản phẩm</h3>
	<div class="row">
		<c:forEach var="item" items="${productList}">
		<div class="col-md-4 mb-4">
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
		
		<div class="d-flex justify-content-end">
		<div id="pagination"></div>
		</div>
	</div>
	</div>
</div>
</div>

<script type="text/javascript">
const url = new URL(window.location.href);
const params = new URLSearchParams(url.search); 
const cateId = params.get('cateId');

let itemsPerPage = ${itemsPerPage};
let totalPages = ${totalPages};
let currentPage = ${currentPage};

//Initialize pagination plugin
$('#pagination').twbsPagination({
    startPage: currentPage,
    totalPages: totalPages,
    visiblePages: 4,
    initiateStartPageClick: false,
    onPageClick: function(event, page) {
    	window.location.href = 'san-pham?cateId=' + cateId + '&page=' + page;
    }
});
</script>

</body>
</html>