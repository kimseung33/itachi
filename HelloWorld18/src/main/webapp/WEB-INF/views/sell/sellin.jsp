<%@page import="itachi.uchiha.domain.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<HTML>
<HEAD>
	<title>ITACHI 경매 :: 입찰하기</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="http://script.auction.co.kr/style/css/myauction/popup.css">
	<script type="text/javascript" src="http://script.auction.co.kr/style/js/common.js"></script>
	<!-- <SCRIPT language="javascript" src="http://Script.auction.co.kr/common/itemLeftTime.js"></SCRIPT>
	<script type="text/javascript" src="http://script.auction.co.kr/arche.js"></script> -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</HEAD>
<body>
<%
MemberDTO dto = (MemberDTO) session.getAttribute("login");
%>
<!-- body -->
<div id="body" class="withname">

    <!-- 타이틀 -->
    <h1 class="fl"><img src="http://pics.auction.co.kr/popup/tit_bid01.gif" alt="경매입찰"></h1>
    <!-- 타이틀 //-->	

    <hr>

    <!-- 탑 15px, 좌우 5px영역 -->
    <div id="maxzone" style="clear:both;">

        <!-- CONTENTS -->
        <div id="contents">
	
			<form  action="/board/sellin" id="frm" method="post">
			<input type="hidden" name="sellId" value="<%=dto.getMb_Id()%>">
			<input type="hidden" name="sellNumber" value="${list.productNumber}">
			

	        <!-- 경매정보 -->
	        <div>

				<h2 class="bid">입찰 상품</h2>
				
				<div class="mtxxs">
					<table cellpadding="0" cellspacing="0" class="bid_tbl">
						<colgroup><col width="30%"><col></colgroup>
						<tr>
							<th>상품명</th>
							<td>${list.title}</td>
						</tr>
						<tr>
							<th>상품번호</th>
							<td>${list.productNumber}</td>
						</tr>
						<tr>
							<th>경매마감일자</th>
							<td>${list.endDate}</td>
						</tr>
					</table>
				</div>
			</div>
	        <!-- 경매정보 //-->

		    <!-- 입찰하기 -->
		    <div id="pnlBid">
	
			    <h2 class="bid mt">입찰하기</h2>
						 
				<div class="mtxxs">
			        <table cellpadding="0" cellspacing="0" class="bid_tbl">
						<colgroup><col width="30%"><col width="30%"><col width="20%"><col></colgroup>
						
					    <tr>
						    <th>현재가</th>
						    <c:choose>
								<c:when test="${list.nowMoney<list.startMoney}">
									<td><strong class="price"><fmt:formatNumber value="${list.startMoney}" pattern="#,###"/>원</strong></td>
								</c:when>
								<c:otherwise>
									<td><strong class="price"><fmt:formatNumber value="${list.nowMoney}" pattern="#,###"/>원</strong></td>
								</c:otherwise>
							</c:choose>
						    <th>즉구가</th>
						    <td><fmt:formatNumber value="${list.directMoney}" pattern="#,###"/>원</td>
					    </tr>
					    <tr>
						    <th>입찰금액</th>
						    <td colspan="3">
							    <b class="name">현재							    
								    <c:choose>
										<c:when test="${list.nowMoney<list.startMoney}">
											<span class="price"><fmt:formatNumber value="${list.startMoney + 100}" pattern="#,###"/>원</span>
										</c:when>
										<c:otherwise>
											<span class="price"><fmt:formatNumber value="${list.nowMoney+100}" pattern="#,###"/>원</span>
										</c:otherwise>
									</c:choose> 
									부터 입찰하실 수 있습니다.
							    </b>
							    </br>
							    							    
							    <c:choose>
									<c:when test="${list.nowMoney<list.startMoney}">
										<input type="number" id="nowMoney" maxlength="10" size="10" class="txt ar" name="nowMoney" min="${list.startMoney+100}" max="${list.directMoney}"  value="${list.startMoney+100}" style="text-align:Right;ime-mode:disabled;" /><b>원</b>
									</c:when>
									<c:otherwise>
										<input type="numbwer" id="nowMoney" maxlength="10" size="10" class="txt ar" name="nowMoney" min="${list.nowMoney+100}" max="${list.directMoney}"  value="${list.nowMoney+100}" style="text-align:Right;ime-mode:disabled;" /><b>원</b>
									</c:otherwise>
								</c:choose> 
							    
							    <span class="fc">(콤마(".")없이 100원 단위로 입력하세요.)</span>
							    
							    
						    </td>
					    </tr>
					</table> 
				</div>

		    
			</div>
		    <!-- 입찰하기 //-->
			</form>
    										
	        <div class="ac mtxs">
		        <input type="image" name="buttonBid" id="frm_submit" alt="입찰하기" src="http://pics.auction.co.kr/popup/btn_bid.gif" />
	        </div>

	        <div class="mt bid_ul">
		        <ul>
			        <li>경매 낙찰 건을 주문 취소하시면 구매거부가 되어 경매 패널티가 1점 부여됩니다.</li>
			        <li>최근 한 달 동안의 경매 패널티가 3점이 되면 한 달 동안 경매에 참여하시지 못합니다.</li>
		        </ul>
	        </div>
			
		</div>
		<!-- CONTENTS //-->
	</div>
	<!-- 탑 15px, 좌우 5px영역 //-->
</div>
<!-- body //-->
			
<hr>


<script>

$(document).ready(function() {
	if(!"<%=dto.getMb_Id()%>" || "<%=dto.getMb_Id()%>" == null){
		alert("로그인이 필요합니다.");
		location.href="/member/login";
	}
	$("#frm_submit").on("click", function() {
		$("#frm").submit();
	})
});
</script>
</body>
</HTML>
