<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
<title>ID찾기</title>
</head>
<body>
	<div class="container">
	  <div class="row">
	    <div class="card-main mx-auto">
	      <div class="card card-signin my-5">
	        <div class="card-body">
	          <h3 class="card-title text-center">아이디 찾기</h3>
	          <form class="form-signin" action="/member/findid" method="get">
	          	<select id="find_check" class="form-control" style="width:40%;margin:10px 0;">
					<option value="email">이메일로 찾기</option>
					<option value="hp">휴대폰번호로 찾기</option>
				</select>
				<div id="final_check">
				
				</div>
	            <button id="find" class="btn btn-lg btn-primary btn-block text-uppercase" type="submit">아이디 찾기</button>
	            <hr class="my-4">
	            <a class="btn btn-lg btn-info btn-block text-uppercase" href="/member/login">로그인 하기</a>
	            <a class="btn btn-lg btn-default btn-block text-uppercase" href="/">메인페이지로 돌아가기</a>
	          </form>
	        </div>
	      </div>
	    </div>
	  </div>
	</div>
	
	
	<!-- 휴대전화로 찾기 -->
	<div id="check_hp" style="display:none;">
		<div class="form-label-group">
			<input class="form-control" id="mb_name" name="mb_name" placeholder="이름 입력">
			<label for="mb_name">이름 입력</label> 
		</div>
		<div class="form-label-group"> 
			<input class="form-control" type="number" id="mb_birth" name="mb_birth" placeholder="생년 월일 입력">
			<label for="mb_birth">생년 월일 입력</label>
		</div>
		<div class="form-label-group">
			<input class="form-control" type="number" id="mb_hp" name="mb_hp" placeholder="핸드폰 번호 입력">
			<label for="mb_hp">핸드폰 번호 입력</label> 
		</div>
	</div>

	<!-- 휴대전화로 찾기 -->
	<!-- 이메일로 찾기 -->

	<div id="check_email" style="display:none;">
        <div class="form-label-group">
          <input type="text" id="mb_name" name="mb_name" class="form-control" placeholder="이름 입력">
          <label for="mb_name">이름 입력</label>
        </div>
		<div class="form-label-group">
			<input class="form-control" id="mb_email" name="mb_email" placeholder="E-mail 입력">
			<label for="mb_email">E-mail 입력</label> 
		</div>
	</div>
	<!-- 이메일로 찾기 -->
	<script type="text/javascript">
		$(document).ready(function() {
			$("#find").click(function() {
				
			})

			$("#final_check").html($("#check_email").html());
			
			$("#find_check").change(function() {
				var val = this.value;
				if(val=="email"){
					var email_form = $("#check_email").html();
					$("#final_check").html(email_form);
				} else if(val=="hp"){
					var hp_form = $("#check_hp").html();
					$("#final_check").html(hp_form);
				}
			});
		});
		
		
		function check_form() {
			alert(this.value);
		}
	</script>
</body>

</html>