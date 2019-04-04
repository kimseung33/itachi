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
					<h3 class="card-title text-center">비밀번호 찾기</h3>
					<form class="form-signin" action="/member/selectpw" method="post">
						<div class="form-label-group">
							<input type="text" id="mb_Id" name="mb_Id" class="form-control" placeholder="이름 입력">
							<label for="mb_Name">아이디 입력</label>
						</div>
						<div class="form-label-group">
							<input class="form-control" id="mb_Email" name="mb_Email" placeholder="E-mail 입력">
							<label for="mb_Email">E-mail 입력</label>
						</div>
						<div class="form-label-group"> 
							<input class="form-control" type="number" id="mb_Birth" name="mb_Birth" placeholder="생년 월일 입력">
							<label for="mb_birth">생년 월일 입력</label>
						</div>
						<button id="find" class="btn btn-primary btn-block text-uppercase" type="submit">비밀번호 찾기</button>
					</form>
					
					<div id="certify_form" style="display:block;">
						<hr class="my-4">
						<form action="/member/emailCertify" method="post">
							<div class="alert alert-info">
								작성하신 이메일로 인증번호가 발송되었습니다.
							</div>
							<div class="form-group">
								<div class="input-group">
									<input required placeholder="인증번호" class="form-control" name="certify_num" id="certify_num">
									<div class="input-group-btn">
								      <button class="btn btn-danger" id="certify_check" type="submit">인증하기</button>
								    </div>
							    </div>
							</div>
						</form>
					</div>
					<hr class="my-4">
					<div class="btn-group btn-group-justified">
						<a class="btn btn-info btn-block text-uppercase" href="/member/login">로그인 하기</a>
						<a class="btn btn-default btn-block text-uppercase" href="/">메인페이지로 돌아가기</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	$(document).ready(function() {
		/* $("#find").click(function(event) {
			event.preventDefault();
			var mb_Name = $("#mb_Name").val();
			var mb_Birth = $("#mb_Birth").val();
			var mb_Email = $("#mb_Email").val();


				$.ajax({
					type : 'post',
					url : '/member/selectpw',
					data : JSON.stringify({
						mb_Name : mb_Name,
						mb_Birth : mb_Birth,
						mb_Email : mb_Email
						}),

				dataType : "text",
				success : function(result) {
					alert(result);
					$("#mb_Name").val("");
					$("#mb_Birth").val("");
					$("#mb_Email").val("");								
				},
				error : function(request, status, error) {
					alert("code:" + request.status + "\n"
							+ "msg:" + request.responseText
							+ "\n" + "error:" + error);
				}
			});
		});
		 */
	});
	</script>
</body>

</html>