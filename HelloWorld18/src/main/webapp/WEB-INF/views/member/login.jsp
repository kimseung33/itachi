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
			<h1>로그인화면 테스트</h1>
			<form action="/member/loginpost" method="post">
				<div class="form-group">
					<label for="mb_Id">mbId</label>
					<input name="mb_Id" id="mb_Id" class="form-control">
				</div>
				
				<div class="form-group">
					<label for="mb_Pw">mbPw</label>
					<input name="mb_Pw" id="mb_Pw" class="form-control">
				</div>
				
				<div class="form-group">
					<button type="submit" class="btn btn-primary form-control">로그인</button>
				</div>
				
			</form>
		</div>
	</div>
<script type="text/javascript">
		$(document).ready(function(){
			
		});
	</script>
</body>
</html>