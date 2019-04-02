<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">
<link rel="stylesheet" href="../resources/css/login.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.bundle.min.js"></script>
<title>ID찾기</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="card-main mx-auto">
				<div class="card card-signin my-5">
					<div class="card-body">
						<h3 class="card-title text-center">아이디 찾기</h3>
						<form class="form-signin" action="/member/findid_id" method="post">
							<div>
								<label>이름</label> <input class="form-control" type="text"
									id="mb_Name" name="mb_Name" required>
							</div>
							<div>
								<label>Email</label> <input class="form-control" type="text"
									id="mb_Email" name="mb_Email" required>
							</div>
							<br>
							<button id="find"
								class="btn btn-lg btn-primary btn-block text-uppercase"
								type="submit">아이디 찾기</button>
							<hr class="my-4">
							<a class="btn btn-lg btn-info btn-block text-uppercase"
								href="/member/login">로그인 하기</a> <a
								class="btn btn-lg btn-default btn-block text-uppercase" href="/">메인페이지로
								돌아가기</a>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>


	<script type="text/javascript">
		$(document).ready(function() {

			$("#find").click(function() {

			});
		});


	</script>
</body>

</html>