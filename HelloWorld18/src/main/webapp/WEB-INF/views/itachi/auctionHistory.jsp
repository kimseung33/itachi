<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="http://script.auction.co.kr/style/css/frame/itempage.css">
<title>Insert title here</title>
</head>
<body>
<div id="contents">
	<!--ReturnValue==0-->
	<!--panBidMessage-->
	<!-- 경매정보 -->
	<div style="margin-top:25px;">
		<h2 style="padding: 0 0 0 10px;font-size: 15px;color: #dc2c09;font-weight: bold;">입찰 상품</h2>
		<div class="mtxxs">
			<table cellpadding="0" cellspacing="0" class="bid_tbl">
				<colgroup>
					<col width="30%">
					<col>
				</colgroup>
				<tbody>
					<tr>
						<th>상품번호</th>
						<td>${view.productNumber}</td>
					</tr>
					<tr>
						<th>상품명</th>
						<td>${view.title}</td>
					</tr>
					<tr>
						<th>경매마감일자</th>
						<td>${view.endDate}</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<!-- 경매정보 //-->
	
	<a name="list"><font color="white">.</font></a>
	
	<!-- Bidder List -->
	<div>
		<div class="ar bid_text mts">
			구분 : <!-- <strong class="org">● 낙찰자</strong>  --><strong class="blue">●
				낙찰가능자</strong>
		</div>
		<div class="scrollybase bidscroll mtxxs">

			<table cellpadding="0" cellspacing="0" class="bid_tbl2">
				<colgroup>
					<col width="18%">
					<col width="27%">
					<col width="21%">
					<col width="12%">
				</colgroup>
				<tbody>
					<tr>
						<th>입찰자 ID</th>
						<th>입찰일자</th>
						<th>입찰가격</th>
						<th>수량</th>
					</tr>
					<!-- v3 -->
					<c:forEach var="item" items="${list}" varStatus="status">
						<tr>
							<c:choose>
								<c:when test="${status.first}">
									<td class="bidid">${item.sellId}</td>
								</c:when>
								<c:otherwise>
									<td>${item.sellId}</td>
								</c:otherwise>
							</c:choose>
							<td>${item.sellDate}</td>
							<td>${item.nowMoney } 원</td>
							<td>1 <!-- 적은 수량 입찰 허용 --> 개
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<!-- Bidder List //-->
				
	<!-- <div class="mts basicbtns">
		<a href="javascript:window.open('bid.aspx?itemno=B035083069','bid','toolbar=0,location=0,directories=0,status=0,menubar=0,resizable=1, scrollbars=1').focus();"><img src="http://pics.auction.co.kr/popup/btn_bid.gif" alt="입찰하기" border="0"></a>
	    <a href="http://itempage.auction.co.kr/detailview.aspx?itemno=B035083069"><img src="http://pics.auction.co.kr/popup/btn_detailbtn.gif" alt="상품상세정보" border="0"></a>
	</div> -->

</div>
</body>
</html>