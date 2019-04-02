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
<title>비밀번호 찾기</title>
</head>
<body>
<div class="container">
	<div class="row">
		<div class="card-main mx-auto">
			<div class="card card-signin my-5">
				<div class="card-body">
					<h3 class="card-title text-center">아이디 찾기</h3>
					<form class="form-signin" action="/member/selectpw" method="get">
						<div class="form-label-group">
							<input type="text" id="mb_Name" name="mb_Name" class="form-control" placeholder="이름 입력">
							<label for="mb_Name">이름 입력</label>
						</div>
						<div class="form-label-group">
							<input class="form-control" id="mb_Email" name="mb_Email" placeholder="E-mail 입력">
							<label for="mb_Email">E-mail 입력</label>
						</div>
						<div class="form-label-group"> 
							<input class="form-control" type="number" id="mb_Birth" name="mb_Birth" placeholder="생년 월일 입력">
							<label for="mb_birth">생년 월일 입력</label>
						</div>
						<button id="find" class="btn btn-primary btn-block text-uppercase" type="submit">아이디 찾기</button>
						<hr class="my-4">
						<div class="btn-group btn-group-justified">
						<a class="btn btn-info btn-block text-uppercase" href="/member/login">로그인 하기</a>
						<a class="btn btn-default btn-block text-uppercase" href="/">메인페이지로 돌아가기</a>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	$(document).ready(function() {
		$("#find").click(function() {
			var sel = document.getElementById("find_check");
			var find_check = sel.options[sel.selectedIndex].value;
			var mb_Name = $("#mb_Name").val();
			var mb_Birth = $("#mb_Birth").val();
			var mb_Hp = $("#mb_Hp").val();
			var mb_Email = $("#mb_Email").val();


				$.ajax({
					type : 'post',
					url : '/member/findid',
					data : JSON.stringify({
						mb_Name : mb_Name,
						mb_Birth : mb_Birth,
						mb_Hp : mb_hp,
						mb_Email : mb_Email,
						find_check : find_check

				}),

				dataType : "text",
				success : function(result) {
					alert(result);
					$("#mb_name").val("");
					$("#mb_birth").val("");
					$("#mb_hp").val("");
					$("#mb_email").val("");								
				},
				error : function(request, status, error) {
					alert("code:" + request.status + "\n"
							+ "msg:" + request.responseText
							+ "\n" + "error:" + error);
				},
				complete : function() {
					
				}
			});
		});
		
	});
	</script>
</body>

</html>