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
			
				<h1>아이디 혹은 비밀번호가 틀렸습니다.</h1>
				<a class="btn btn-lg btn-info btn-block text-uppercase" href="/">메인페이지 돌아가기</a>
				<a class="btn btn-lg btn-info btn-block text-uppercase" href="/member/login">로그인창으로 돌아가기</a>
				<a class="btn btn-lg btn-info btn-block text-uppercase" href="/member/findid">아이디 찾기</a>
				<a class="btn btn-lg btn-info btn-block text-uppercase" href="/member/selectpw">비밀번호 찾기</a>
				
		</div>
	</div>
<script type="text/javascript">
		$(document).ready(function(){
		
		});
	</script>
</body>
</html>