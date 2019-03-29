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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<title>ID찾기</title>
</head>
<body>

	<div class="container">
		<div class="row">
			<form action="/member/findid" method="get">
				<div class="w3-center w3-large w3-margin-top">
					<h1>아이디 찾기</h1>
				</div>
				<div class="form-group" style="width: 33%; display: inline-block;">
					<label>생년 월일 입력</label> <input class="form-control" id="mb_birth"
						name="mb_birth">
				</div>
				<div class="form-group" style="width: 33%; display: inline-block;">
					<label>핸드폰 번호 입력</label> <input class="form-control" id="mb_hp"
						name="mb_hp">
				</div>
				<div class="form-group" style="width: 33%; display: inline-block;">
					<label>email 입력</label> <input class="form-control" id="mb_email"
						name="mb_email">
				</div>
				<button type="button" id=findBtn class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round">찾기</button>
				<button>취소</button>
			</form>
		</div>
	</div>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#findBtn").click(function(){
				location.href='/member/login';
			})
		});
	</script>
</body>

</html>