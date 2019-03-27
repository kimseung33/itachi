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
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<form action="/aop/create" method="post">

				<div class="form-group">
					<label for="mid">Mid</label> <input class="form-control" id="mid"
						name="mid">
				</div>

				<div class="form-group">
					<label for="sender">Sender</label> <input required="required"
						class="form-control" id="sender" name="sender">
				</div>

				<div class="form-group">
					<label for="targetId">TargetId</label> <input required="required"
						class="form-control" id="targetId" name="targetId">
				</div>

				<div class="form-group">
					<label for="message">Message</label>
					<textarea required="required" class="form-control" id="message"
						name="message" rows="3"></textarea>
				</div>
			</form>

			<div class="form-group">
				<button class="btn btn-info" type="submit">보내기</button>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(document).ready(function() {
			$("button[type='submit']").click(function() {
				$("form").submit();
			});
		});
	</script>
</body>

</html>