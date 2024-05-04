<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="/all_components/taglib.jsp" %>

<div style="z-index: 10" class="position-sticky top-0">

<div class="container-fluid bg-body-tertiary p-3">
	<div class="container">
		<div class="row align-items-center">
			<div class="col-md-3">
				<h3 class="text-success mb-0"><i class="fa-solid fa-shop"></i> ShoesStore</h3>
			</div>
			
			<div class="col-md-5">
				   <form method="GET" action="tim-kiem" class="d-flex" role="search">
			        <input required="required" 
			        name="search" class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
			    	    <button class="btn btn-outline-success d-flex gap-1" type="submit"><span>Tìm</span><span>kiếm</span></button>
			      </form>
			</div>
			
			<c:choose>
				<c:when test = "${not empty userObj }">
	           <div class="col-md-4 d-flex align-items-center justify-content-end gap-5">
				<div class="mt-2">
					<div class="position-relative cart">
						<i class="fa-solid fa-cart-shopping fs-5 text-success"></i>
						<span class="cart-quantity position-absolute d-block bg-danger text-white">0</span>
					</div>
				</div>
				
				<div class="d-flex align-items-center gap-2">
					<button class="btn btn-info d-flex align-items-center gap-2">
						<div>
							<img style="width: 22px; border-radius: 50%" 
								src="${pageContext.request.contextPath }/images/photos/${userObj.photo}" alt=""/>
						</div>
						<span class="text-white">${userObj.fullName }</span>
					</button>
					<a href="dang-xuat" class="btn btn-primary">
						<i class="fa-solid fa-right-from-bracket"></i>
						<span>Logout</span>
					</a>
				</div>
				</div>
	         	</c:when>
	         	
	         	    <c:otherwise>
	         	    
	         	    <div class="col-md-4 text-end">
						<a href="dang-nhap" class="btn btn-success">
							<i class="fa-solid fa-right-to-bracket"></i>
							Đăng nhập</a>
						<a href="dang-ky" class="btn btn-primary">
							<i class="fa-solid fa-user-plus"></i>
							Đăng ký</a>
					</div> 
        			 </c:otherwise>
				
			</c:choose>
		</div>
	</div>
</div>

<div class="container-fluid bg-custom">
	<nav class="navbar navbar-expand-lg bg-custom">
		<div class="container">
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" 
			    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" 
			    aria-expanded="false" aria-label="Toggle navigation">
			  	<span class="navbar-toggler-icon"></span>
			 </button>
			 
	    <div class="collapse navbar-collapse" id="navbarSupportedContent">
		      <ul class="navbar-nav me-auto mb-2 mb-lg-0 gap-2">
		        <li class="nav-item">
		          <a class="nav-link" aria-current="page" href="trang-chu">
			      <i class="fa-solid fa-house"></i>
			          Home</a>
		        </li>
		        <li class="nav-item dropdown">
		          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
		           	<i class="fa-solid fa-list"></i>  Thể loại giày
		          </a>
		          <ul class="dropdown-menu">
		          	<c:forEach var="item" items="${cateList }">
		          		<li><a class="dropdown-item" href="san-pham?cateId=${item.id}&page=1">${item.name }</a></li>
		          	</c:forEach>
		          </ul>
		        </li>
		        <li class="nav-item">
		          <a href="san-pham-moi" class="nav-link">Giày mới nhất</a>
		        </li>
		        
		         <li class="nav-item">
		          <a class="nav-link">Giày phổ thông</a>
		        </li>
		      </ul>
		      <div>
		      	<button class="btn btn-light my-2 me-1 my-sm-0" type="submit">
		      		<i class="fa-solid fa-user-gear"></i>
		      		Cài đặt</button>
		      	<button class="btn btn-light my-2 my-sm-0" type="submit">
			      		<i class="fa-solid fa-phone"></i>
			      		Contact Us</button>
		     </div>
		    </div>
		  </div>
	</nav>
</div>

</div>