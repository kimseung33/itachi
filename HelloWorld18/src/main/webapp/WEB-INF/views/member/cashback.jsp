<%@page import="itachi.uchiha.domain.MemberDTO"%>
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
		<form action="/member/cashback" method="post">
		<%
			MemberDTO dto=(MemberDTO)session.getAttribute("login");
			String id=dto.getMb_Id();
		%>
			<input readonly="readonly" name="mb_Id" value=<%=id %>>
			<input type="number" min="0" name="mb_cashback" id="mb_cashback">
			
		</form>
			<input id="ca" type="submit" value="확인">
		</div>
	</div>
<script type="text/javascript">
		$(document).ready(function(){
			$("#ca").click(function() {
				var mb_cashback=$("#mb_cashback").val();
				
				if(mb_cashback.length == 0){
					alert("입력된 정보가 없습니다.")
					return false;
				}
				
				if ((mb_cashback%10)!=0) {
					alert("1의자리가 0이 아닙니다.")
					return false;
				}
				
				$("form").submit();
			})
		});
	</script>
</body>
</html>