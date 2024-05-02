<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="/all_components/taglib.jsp" %>

<div style="z-index: 10" class="position-sticky top-0">

<div class="container-fluid bg-body-tertiary p-2">
	<div class="container">
		<div class="row">
			<div class="col-md-3">
				<h3 class="text-success"><i class="fa-solid fa-shop"></i> ShoesStore</h3>
			</div>
			<div class="offset-md-6 col-md-3 text-end">
				<a href="auth?action=login" class="btn btn-success">
					<i class="fa-solid fa-right-to-bracket"></i>
					Đăng nhập</a>
				<a href="auth?action=register" class="btn btn-primary">
					<i class="fa-solid fa-user-plus"></i>
					Đăng ký</a>
			</div>
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