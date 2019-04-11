<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<title>Insert title here</title>
</head>
<body>

	<div class="container">
		<div class="row">
			<form action="/member/cash" method="post">
				ID:<input readonly="readonly" id="mb_Id" name="mb_Id" value="${readid.mb_Id}">
				케시잔액:<input id="mb_cash" type="number" name="mb_cash">
				<input type="submit" value="충전">
			</form>
		</div>
	 </div>
<script type="text/javascript">
	$(document).ready(function() {
		
	});
</script>
</body>
</html>