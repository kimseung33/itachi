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
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">
<link rel="stylesheet" href="../resources/css/login.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.bundle.min.js"></script>

<title>Insert title here</title>
</head>
<body>
<div class="container">
	<div class="row">
		<div class="card-main mx-auto">
			<div class="card card-signin my-5">
				<div class="card-body">
						<div class="alert alert-danger" style="text-align:center;">
							<strong>아이디 혹은 비밀번호가 틀렸습니다.</strong>
						</div>
						<hr class="my-4">
						<div class="btn-group btn-group-justified">
							<a class="btn btn-info btn-block text-uppercase" href="/member/findid">아이디 찾기</a>
							<a class="btn btn-info btn-block text-uppercase" href="/member/selectpw">비밀번호 찾기</a>
						</div>
						<hr class="my-4">
						<div class="btn-group btn-group-justified">
							<a class="btn btn-success btn-block text-uppercase" href="/member/login">로그인창으로 돌아가기</a>
							<a class="btn btn-default btn-block text-uppercase" href="/">메인페이지로 돌아가기</a>
						</div>
				</div>
			</div>
		</div>
	</div>
</div>
				
<script type="text/javascript">
		$(document).ready(function(){
		
		});
	</script>
</body>
</html>