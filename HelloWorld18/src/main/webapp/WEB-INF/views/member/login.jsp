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

<!-- 	<div class="container">
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
	</div> -->
  <div class="container">
    <div class="row">
      <div class="card-main mx-auto">
        <div class="card card-signin my-5">
          <div class="card-body">
            <h3 class="card-title text-center">Sign In</h3>
            <form class="form-signin" action="/member/loginpost" method="post">
              <div class="form-label-group">
                <input type="text" id="mb_Id" name="mb_Id" class="form-control" placeholder="Login ID" required autofocus>
                <label for="mb_Id">Login ID</label>
              </div>

              <div class="form-label-group">
                <input type="password" id="mb_Pw" name="mb_Pw" class="form-control" placeholder="Password" required>
                <label for="mb_Pw">Password</label>
              </div>

              <!-- <div class="custom-control custom-checkbox mb-3">
                <input type="checkbox" class="custom-control-input" id="customCheck1">
                <label class="custom-control-label" for="customCheck1">Remember password</label>
              </div> -->
              <button type="submit" class="btn btn-lg btn-primary btn-block text-uppercase">Sign in</button>
              <a class="btn btn-lg btn-success btn-block text-uppercase" href="/member/insert">Register</a>
              <!-- <hr class="my-4">
              <button class="btn btn-lg btn-google btn-block text-uppercase" type="submit"><i class="fab fa-google mr-2"></i> Sign in with Google</button>
              <button class="btn btn-lg btn-facebook btn-block text-uppercase" type="submit"><i class="fab fa-facebook-f mr-2"></i> Sign in with Facebook</button> -->
            </form>
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