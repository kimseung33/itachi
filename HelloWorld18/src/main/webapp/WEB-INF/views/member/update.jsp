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
		<form action="/member/update" method="post">
			<div class="form-group">
				<label for="mb_id">ID</label>
				<input readonly="readonly" class="form-control" name="mb_id" id="mb_id" value="${dto.mb_id}">
			</div>
			
			<div class="form-group">
				<label for="mb_pw">PassWord</label>
				<input class="form-control" name="mb_pw" id="mb_pw" value="${dto.mb_pw}">
			</div>
			
			<div class="form-group">
				<label for="mb_zip">우편번호</label>
				<input class="form-control" name="mb_zip" id="mb_zip" value="${dto.mb_zip}">
			</div>
			
			<div class="form-group">
				<label for="mb_addr1">기본주소</label>
				<input class="form-control" name="mb_addr1" id="mb_addr1" value="${dto.mb_addr1}">
			</div>
			
			<div class="form-group">
				<label for="mb_addr2">상세주소</label>
				<input class="form-control" name="mb_addr2" id="mb_addr2" value="${dto.mb_addr2}">
			</div>
			
			<div class="form-group">
				<label for="mb_addr3">기타주소</label>
				<input class="form-control" name="mb_addr3" id="mb_addr3" value="${dto.mb_addr3}">
			</div>
			
			
			<div class="form-group">
				<label for="mb_email">이메일</label>
				<input class="form-control" name="mb_email" id="mb_email" value="${dto.mb_email}">
			</div>
		</form>
		
		<input id="up" type="submit" value="수정">			
			
		</div>
	 </div>
<script type="text/javascript">
	$(document).ready(function() {
		$("#up").click(function() {
			$("form").submit();
		});
	});
</script>
</body>
</html>