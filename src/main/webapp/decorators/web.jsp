<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@include file="/all_components/taglib.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<meta name="viewport" content="width=device-width, initial-scale=1">
<head>
<title><dec:title default="Trang chủ" /></title>

<link rel="stylesheet" href="<c:url value="/bootstrap/css/bootstrap.min.css"/>" />
<link rel="stylesheet" href="<c:url value="/icons/css/all.css"/>" />
<link rel="stylesheet" type="text/css" href="<c:url value="/all_components/styles.css"/>" />
<script src="<c:url value="/bootstrap/js/bootstrap.bundle.min.js"/>"></script>
<script src="http://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twbs-pagination/1.4.2/jquery.twbsPagination.min.js"></script>
</head>
<body>
	<%@ include file="/all_components/navbar.jsp"%>

	<dec:body />

	<%@ include file="/all_components/footer.jsp"%>

	<script type="text/javascript">
		if (window.history.replaceState) {
			window.history.replaceState(null, null, window.location.href);
		}
	</script>
</body>
</html>