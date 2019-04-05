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
						<h3 class="card-title text-center">경매물품 등록하기</h3>
						<form class="form-signin" action="/board/registrationC" method="post">
							<div>
								항목을 선택해주세여
								<input type="radio" name="category" value="clothing">의류
								<input type="radio" name="category" value="beauty">뷰티
								<input type="radio" name="category" value="merchandise">잡화<br>
								<input type="radio" name="category" value="appliances">가전제품
								<input type="radio" name="category" value="bookorticket">도서/티켓
							</div>
							<label for="mb_Id">ID</label>
							<input type="text" id="mb_Id" name="mb_Id" class="form-control" value="${write.mb_Id}" readonly="readonly">
							
							<label for="title">제목</label>
							<input type="text" id="title" name="title" class="form-control" placeholder="제목" required autofocus>
							
							<label for="setence">내용</label>
							<input type="text" id="setence" name="setence" class="form-control" placeholder="내용" required autofocus>
							
							<!-- <label for="endDate">경매기간을 입력해주세여</label>
							<input type="text" id="endDate" name="endDate" class="form-control" placeholder="endDate" required autofocus>
							 -->
							<label for="deadline">경매기간</label>
							<select name="deadline" class="form-control">
								<option value="1">24시간</option>
								<option value="2">48시간</option>
								<option value="3">72시간</option>
								<option value="4">96시간</option>
								<option value="5">120시간</option>
							</select>
							
							<label for="startMoney">경매시작액</label>
							<input type="text" id="startMoney" name="startMoney" class="form-control" placeholder="경매시작액" required autofocus>
							
							<label for="directMoney">즉구가</label>
							<input type="text" id="directMoney" name="directMoney" class="form-control" placeholder="즉구가" required autofocus>
							
							
							<button type="submit" class="btn btn-lg btn-primary btn-block text-uppercase">물품등록</button>
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