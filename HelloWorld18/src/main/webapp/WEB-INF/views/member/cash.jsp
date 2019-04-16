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
			<form action="/member/cash" method="post">
				ID:<input readonly="readonly" id="mb_Id" name="mb_Id" value="${readid.mb_Id}">
				케시잔액:<input id="mb_cash" type="number" name="mb_cash">
			</form>
				<input id="ca" type="submit" value="충전">
		</div>
	 </div>
<script type="text/javascript">
	$(document).ready(function() {
		$("#ca").click(function() {
			var mb_cash = $("#mb_cash").val();
			
			if(mb_cash.length == 0){
				alert("입력된 정보가 없습니다.")
				return false;
			}
			
			if ((mb_cash%10)!=0) {
				alert("1의자리가 0이 아닙니다.")
				return false;
			}
			
			$("form").submit();
			
		});
		
		if("${form_ok}" == "ok"){
			opener.document.location.reload();
			window.close();
		}
		
		
	});
</script>
</body>
</html>