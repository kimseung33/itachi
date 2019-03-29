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
				<div >
					<h1>아이디 찾기</h1>
				</div>
				<select id="find_check" class="form-control" style="width:40%;margin:10px 0;">
					<option value="email">이메일로 찾기</option>
					<option value="hp">휴대폰번호로 찾기</option>
				</select>
				<div id="final_check">
				
				</div>
				<div class="form-group">
					<button id="find" class="btn btn-primary form-control"
						style="width: 33%; margin-right:10px;">찾기</button>
					<button id="clear" class="btn btn-danger form-control"
						style="width: 33%;">취소</button>
				</div>
			</form>
		</div>
	</div>
	
	
	<!-- 휴대전화로 찾기 -->
	<div id="check_hp" style="display:none;">
		<div class="form-group" style="width: 33%; display: inline-block;">
			<label>이름 입력</label> 
			<input class="form-control" id="mb_name" name="mb_name">
		</div>
		<div class="form-group" style="width: 33%; display: inline-block;">
			<label>생년 월일 입력</label> 
			<input class="form-control" id="mb_birth" name="mb_birth">
		</div>
		<div class="form-group" style="width: 33%; display: inline-block;">
			<label>핸드폰 번호 입력</label> 
			<input class="form-control" id="mb_hp" name="mb_hp">
		</div>
	</div>

	<!-- 휴대전화로 찾기 -->
	<!-- 이메일로 찾기 -->

	<div id="check_email" style="display:none;">
		<div class="form-group" style="width: 33%; display: inline-block;">
			<label>이름 입력</label> 
			<input class="form-control" id="mb_name" name="mb_name">
		</div>
		<div class="form-group" style="width: 33%; display: inline-block;">
			<label>email 입력</label> 
			<input class="form-control" id="mb_email" name="mb_email">
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