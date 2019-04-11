<%@page import="itachi.uchiha.domain.MemberDTO"%>
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
<title>경매 입찰</title>
</head>
<body>
<%
MemberDTO dto = (MemberDTO)session.getAttribute("login");
%>
	<div class="container">
		<div class="row">
			<form action="/board/sellin" id="frm" method="post">
				<input type="hidden" name="sellId" value="<%=dto.getMb_Id()%>">
				<input type="hidden" name="sellNumber" value="${list.productNumber}">
				<div>
					<h5>입찰 상품</h5>
					<table class="table table-hober">
						<thead>
							<tr>
								<th>상품명</th>
								<th>상품 번호</th>
								<th>경매 마감 일자</th>
							</tr>

						</thead>
						<tbody>
							<tr>
								<td>${list.title}</td>
								<td>${list.productNumber}</td>
								<td>${list.endDate}</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div>
					<h5>입찰하기</h5>
					<table class="table table-hober">
						<thead>
							<tr>
								<th>현재가</th>
								<th>입찰 금액</th>								
							</tr>

						</thead>
						<tbody>
							<tr>
								<td>${list.nowMoney}</td>
								<td>현재${list.nowMoney+1}원 부터 입찰 하실수 있습니다.<br><input min="${list.nowMoney+1}" value="${list.nowMoney+1}" type="number" id="nowMoney" name="nowMoney">원</td>								
							</tr>
						</tbody>
					</table>
				</div>
			</form>
			<button id="frm_submit">입찰하기</button>
		</div>
	</div>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#frm_submit").on("click", function(){
				$("#frm").submit();
			})
		});
	</script>
</body>

</html>