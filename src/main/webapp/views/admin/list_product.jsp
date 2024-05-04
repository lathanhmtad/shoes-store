<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="/all_components/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quản lý sản phẩm</title>
</head>
<body>
<div class="container">
	
	<div class="mt-4">
		<div class="d-flex justify-content-between mb-3">
		<h3>Quản lý sản phẩm</h3>
		
		<a class="btn btn-primary" href="admin-product?action=add">
			<i class="fa-solid fa-plus"></i>
			Thêm sản phẩm</a>
		</div>
	
	<table class="table table-bordered">
		 <thead>
		    <tr>
		      <th scope="col">Id</th>
		      <th scope="col">Tên sản phẩm</th>
		      <th scope="col">Loại giày</th>
		      <th scope="col">Thương hiệu</th>
		      <th scope="col">Hình ảnh</th>
		      <th scope="col">Giá</th>
		      <th scope="col">Tình trạng</th>
		      <th scope="col">Loại hàng</th>
		      <th scope="col">Thao tác</th>
		    </tr>
		  </thead>
		  <tbody>
		  
		  	<c:forEach var="product" items="${products}">
		  	<tr style="vertical-align: middle">
		      <th>${product.id }</th>
		      <td>${product.name}</td>
		      <td>${product.category.name }</td>
		      <td>${product.brand}</td>
		      <td>
		      	<img alt="" style="width: 60px" src="${pageContext.request.contextPath}/images/shoes/${product.image}"/>
		      </td>
		      <td><span class="fw-bold product-price">
		      	${product.price}
		      </span></td>
		      <td>
		      	<c:choose>
				    <c:when test="${product.stock}">
				       <span class="badge text-bg-info rounded-pill text-white">Còn hàng</span>
				    </c:when>
				    <c:otherwise>
				      <span class="badge text-bg-danger rounded-pill">Hết hàng</span>
				    </c:otherwise>
				</c:choose>
		      </td>
		      <td>
		      	<c:choose>
				    <c:when test="${product.isNew()}">
				       <span class="badge text-bg-success rounded-pill text-white">Hàng mới</span>
				    </c:when>
				    <c:otherwise>
				      <span class="badge text-bg-warning text-white rounded-pill">Hàng bình thường</span>
				    </c:otherwise>
				</c:choose>
		      </td>
		      <td>
		      	<div class="d-flex gap-3">
		      		<a href="admin-product?action=view&idP=${product.id}" class="btn btn-warning text-white">
		      			<i class="fa-regular fa-eye"></i></a>
		      		<a href="admin-product?action=edit&idP=${product.id}" class="btn btn-primary">
		      			<i class="fa-solid fa-pen-to-square"></i></a>
		      		<button class="btnConfirmModal btn btn-danger" data-href="${product.id }" 
		      			class="btn btn-danger"><i class="fa-solid fa-trash"></i></button>
		      	</div>
		      </td>
		    </tr>
		  	</c:forEach>
		  </tbody>
		</table>
		
		<div class="d-flex justify-content-end mt-2">
			<div id="pagination"></div>
		</div>
		
	
	</div>
</div>


<!-- Modal -->
<div class="modal fade" id="modalConfirmDelete" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      	Bạn có chắc chắn muốn xóa sản phẩm có id là: <strong></strong>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
        <a href="#" id="btnConfirmDelete" type="button" class="btn btn-primary">Xóa</a>
      </div>
    </div>
  </div>
</div>
			
<div class="toast-container position-fixed top-0 end-0 pt-5 pe-3">

<c:if test="${not empty succMsg }">
	<div id="liveToast" class="toast fade show bg-white" role="alert" aria-live="assertive" aria-atomic="true">
	    <div class="toast-header">
	      <strong class="me-auto">Thông báo</strong>
	      <button type="button" class="btn-close me-0" data-bs-dismiss="toast" aria-label="Close"></button>
	    </div>
	    <div class="toast-body">
		     <div class="d-flex align-item-center">
			      <span class="text-success d-block me-auto">${succMsg }</span>
			      <i class="fa-solid fa-check text-success fs-5"></i>
		     </div>
	    </div>
  </div>
<c:remove var="succMsg" scope="session"/>
</c:if>

<c:if test="${not empty failedMsg }">
<div id="liveToast" class="toast fade show bg-white" role="alert" aria-live="assertive" aria-atomic="true">
    <div class="toast-header">
      <strong class="me-auto">Thông báo</strong>
      <button type="button" class="btn-close me-0" data-bs-dismiss="toast" aria-label="Close"></button>
    </div>
    <div class="toast-body">
     <div class="d-flex align-item-center">
      <span class="text-success d-block me-auto">${failedMsg }</span>
      <i class="fa-solid fa-circle-exclamation text-danger fs-5"></i>
     </div>
    </div>
  </div>
<c:remove var="failedMsg" scope="session"/>
</c:if>

</div>
	
	<script type="text/javascript">
	    if (window.performance && window.performance.navigation.type === 2) {
	    	var toastElement = document.getElementById('liveToast');
	        if (toastElement) {
	            var toast = new bootstrap.Toast(toastElement);
	            toast.hide();
	        }
	    }

	    // Setup variables for pagination
	    let itemsPerPage = ${itemsPerPage};
	    let totalPages = ${totalPages};
	    let currentPage = ${currentPage};

	    // Initialize pagination plugin
	    $('#pagination').twbsPagination({
	        startPage: currentPage,
	        totalPages: totalPages,
	        visiblePages: 4,
	        initiateStartPageClick: false,
	        onPageClick: function(event, page) {
	            window.location.href = 'admin-product?page=' + page;
	        }
	    });

	    // Set up event handler for delete confirmation
	    let productIdDelete = null;
	    $('.btnConfirmModal').on('click', function() {
	        productIdDelete = $(this).attr('data-href');
	        $('.modal-title').text('Xác nhận xóa');
	        $('.modal-body strong').text(productIdDelete);
	        $('#modalConfirmDelete').modal('show');
	    });

	    // Handle delete confirmation
	    $('#btnConfirmDelete').on('click', function(e) {
	        e.preventDefault();
	        const href = 'admin-product?action=delete&pId=' + productIdDelete;
	        window.location.href = href;
	    });

	</script>
</body>
</html>