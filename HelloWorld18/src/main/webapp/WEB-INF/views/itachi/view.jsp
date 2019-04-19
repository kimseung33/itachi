<%@page import="itachi.uchiha.domain.RegistrationDTO"%>
<%@page import="itachi.uchiha.domain.MemberDTO"%>
<%@page import="itachi.uchiha.domain.LoginDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>경매 자세히 보기</title>
<link rel="stylesheet" type="text/css" href="//script.auction.co.kr/pc/style/css/common.css ">
<link rel="stylesheet" type="text/css" href="http://script.auction.co.kr/style/css/frame/vip_all.css">
<script src="../../resources/js/upload.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.bundle.min.js"></script> -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js" type="text/javascript"></script>
<style type="text/css">
.modify_btn {
    display: inline-block;
    padding: 10px 25px 11px;
    color: #fff;
    font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
    font-size: 18px;
    line-height: 1.22em;
    /* background: url(../images/button-tail.gif) 0 0 repeat-x #000; */
    background-color:#ff6e00;
    text-transform: uppercase;
    letter-spacing: -1px;
}
</style>
</head>
<body>
<div id="locbar" class="crop">
	<div class="holder">
		<div class="loc">
			<a href="/" class="home">홈</a>
			<span class="sep">&gt;</span>
			<a href="#">
				<strong>
					<c:choose>
						<c:when test="${fn:substring(view.productNumber, 0, 1) eq 'A'}">
							의류
						</c:when>
						<c:when test="${fn:substring(view.productNumber, 0, 1) eq 'B'}">
							뷰티
						</c:when>
						<c:when test="${fn:substring(view.productNumber, 0, 1) eq 'C'}">
							잡화
						</c:when>
						<c:when test="${fn:substring(view.productNumber, 0, 1) eq 'D'}">
							가전(전자)제품
						</c:when>
						<c:when test="${fn:substring(view.productNumber, 0, 1) eq 'E'}">
							도서/티켓
						</c:when>
						<c:otherwise>
							기타
						</c:otherwise>
					</c:choose>
				</strong>
			</a>
		</div>
	</div>
</div>

	<div id="body">
		<!-- CONTENTS -->
		<div id="contents">
			<!-- 상품상세정보 & 상품관련정보 -->
			<div class="mainarea">
				<!-- 좌측 상품상세정보 -->
				<div class="info">
					<div class="image">

						<!-- 큰 이미지 -->
						<div class="big01">
							<!-- <div class="biglbtn" style="display: inline">
								<img id="himgLeftArrow"
									src="http://pics.auction.co.kr/itempage/bigimg_lbtn.png"
									class="png24" alt="이전" title="이전"
									style="cursor: pointer">
							</div>
							<div class="bigrbtn" style="display: inline">
								<img id="himgRightArrow"
									src="http://pics.auction.co.kr/itempage/bigimg_rbtn.png"
									class="png24" alt="다음" title="다음"
									style="cursor: pointer">
							</div> -->
							<img
								src=""
								id="ucImageNavigator_himgBig" width="300" height="300"
								style="display: inline">
						</div>
						<!-- 큰 이미지 //-->
					</div>
					<!-- 이미지 //-->

					<!-- 바탕화면에 저장 -->
					<div id="saveBatangLayer"
						style="display: none; position: absolute; top: 145px; left: 18px; z-index: 1000">
						<iframe id="frmShortCut" src="" width="295" height="154"
							frameborder="0" scrolling="no"></iframe>
					</div>
					<!-- 바탕화면에 저장 //-->
					<!-- 이미지 //-->
					<div id="hdivBnnerLayer"
						style="Z-INDEX: 1; position: absolute; left: 585px; top: 48px; width: 122px;"></div>
					<div id="hdivItemInfo">
						<input name="htxtItem" type="hidden" id="htxtItem"
							value="B034919150">
					</div>
					<!-- 설명 -->
					<div class="detail">
						<!-- 설명 -->
						<!-- 상품명 -->
						<div class="titlev3">
							<h2 id="hdivItemTitle">${view.title}</h2>
							<div class="stitev3">
								<em class="first">상품번호 : <span>${view.productNumber}</span></em>
								<em class="first" style="float:right">판매자 : <span>${view.mb_Id}</span></em>
							</div>
						</div>
						<!-- 해외쇼핑 -->

						<!-- 해외쇼핑 // -->
						<!-- 미리계산하기 Data -->

						<!-- 미리계산하기 Data -->
						<dl class="nv3 nfirst  present">

							<dt class="redprice">현재가</dt>

							<dd class="redprice">
								<div class="present_price" id="Price">
								<c:choose>
									<c:when test="${view.nowMoney<view.startMoney}">
										<span class="present_num"><fmt:formatNumber value="${view.startMoney}" pattern="#,###"/></span> 원
									</c:when>
									<c:otherwise>
										<span class="present_num"><fmt:formatNumber value="${view.nowMoney}" pattern="#,###"/></span> 원
									</c:otherwise>
								</c:choose>									
								</div>
								<div class="point">
									<span class="sf fc6">시작가 <span class="num_thm"><fmt:formatNumber value="${view.startMoney}" pattern="#,###"/></span>원
									</span>
								</div>
							</dd>

						</dl>


						<dl class="nv3">
							<dt>입찰수</dt>
							<dd>
								<span class="fss"><span class="num_thm">${sellCount}</span>회 </span> 
								<a href="javascript:void(0);" onclick="auction_history('${view.productNumber}');">
									<span class="sf01 uline">경매기록</span>
								</a>
							</dd>

							<dt>남은시간</dt>
							<dd style="margin-top: 1px;">
								<span class="fss" id="txtLeftPeriod"></span>
								<%-- <span> (종료 : ${view.endDate} ) </span> --%>
								<!-- 1일 21시간 38분 37초 (종료 : 19-04-07 12:33) -->
							</dd>

						</dl>
						
						<dl class="nv3">

							<dt>즉시구매가</dt>
							<dd>
								<span class="direct"><fmt:formatNumber value="${view.directMoney}" pattern="#,###"/></span>원
							</dd>
						</dl>

						<!-- 구매버튼-->
						
						
					
						<div id="ucControls_hdivUpper" class="mainbtnv3">
                  		<%
                           RegistrationDTO view=(RegistrationDTO)request.getAttribute("view");
                           LoginDTO dto=new LoginDTO();
                           MemberDTO dto1=(MemberDTO)session.getAttribute("login");
                           Object session1=session.getAttribute("login");
                           
                           if (session1 == null) {
                        %>
	                        <a id="ucControls_btn1"
	                        href="/member/login"><img
	                        src="http://pics.auction.co.kr/listing/used/2014/btn_bidding.gif"
	                        alt=""></a>                      
                        <%
                           } else {
                        %>
                        <c:if test="${login.mb_Id ne view.mb_Id}">
                        	 <a id="ucControls_btn1"
                      			 href="/board/sellin?productNumber=${view.productNumber}"><img
                        		 src="http://pics.auction.co.kr/listing/used/2014/btn_bidding.gif"
                        		 alt=""></a>
                        </c:if>
                                             
                        <c:if test="${login.mb_Id eq view.mb_Id}">
                        	<a href="/board/Rupdateui?id=${login.mb_Id}&productNumber=${view.productNumber}" class="modify_btn">글수정</a>
                        	<%-- <a href="/member/cashgetui?nowMoney=${view.nowMoney}&productNumber=${view.productNumber}" class="modify_btn">금액수령</a> --%>     	
                        </c:if>	
                        <%
                           }
                        %>
                  </div>
                  <!-- 문제되면 바로 삭제  -->
                 
                  <a id="ucControls_hdivUpper3" href="/member/cashgetui?nowMoney=${view.nowMoney}&productNumber=${view.productNumber}" class="modify_btn">금액수령3</a>
                  
                 	
                  <!--  -->
						<!-- 주버튼 -->


						<!-- 구매버튼-->

					</div>
					<!-- 설명 //-->
				</div>
				<!-- 좌측 상품상세정보 //-->

			</div>
			<!-- 상품상세정보 & 상품관련정보 //-->

			<a name="Question2"></a>
			<!--resize 문제때문에 물품문의 관리를 이곳으로 링크-->

			<!-- 한정특가상품 -->
			<div class="uxb-timesale-prd" style="display: none">
				<strong><img
					src="http://pics.auction.co.kr/itempage/stit_time_sale.gif"
					alt="한정특가상품"></strong>
				<div>
					<img src="http://pics.auction.co.kr/itempage/txt_time_sale.gif"
						alt="">
				</div>
				<ul class="invisible">
					<li>옥션이 선정한 최상의 상품을 한정특가로 구매하실 수 있습니다.</li>
					<li>본 상품은 오직 이메일이나 한정특가 이벤트페이지를 통해서만 구매하실 수 있으며 옥션 내 상세페이지에서는
						찾으실 수 없습니다.</li>
					<li>한정수량 판매이므로 조기 품절될 수 있습니다.</li>
				</ul>
			</div>
			<!-- //한정특가상품 -->

			<!-- 상품정보 -->
			<div id="product_info">

				<!-- 탭 -->
				<ul class="gtab gtab3">
					<li class="fir active"><strong><img
							src="http://pics.auction.co.kr/itempage/gtab_01.gif" alt="상품정보"></strong></li>

					<!-- <li><a href="#product_comment"><img class="txt"
							src="http://pics.auction.co.kr/itempage/gtab_061.gif"
							onclick="javascript:fnGoSellerTalk();" alt="판매자가 받은 상품평/상품후기"></a></li> -->

					<!-- <li><a href="#product_qna" class="stab"><img
							src="http://pics.auction.co.kr/itempage/gtab_03.gif" class="txt"
							alt="상품문의" onclick="javascript:fnGoQuestion();"><span
							class="txt" id="spnQNA1">1</span></a></li> -->
				</ul>
				<!-- 탭 //-->

				<!-- 물품상태및 as 정보-->

				<!-- 정보 -->
				<table class="info-detail">
					<colgroup>
						<col width="15%">
						<col width="35%">
						<col width="15%">
						<col width="35%">
					</colgroup>
					<tbody>
						<tr>
							<th><span>물품상태</span></th>
							<td colspan="1"></td>
							<th><span>판매지역</span></th>
							<td colspan="1">전국</td>
						</tr>
						<tr>
							<th><span>AS정보</span></th>
							<td colspan="1"></td>
							<th><span>부가세 면세여부</span></th>
							<td colspan="1">과세상품</td>
						</tr>
						<tr>
							<th><span>원산지</span></th>
							<td colspan="3">기타</td>
						</tr>
						<tr>
							<th><span>영수증 발행가능여부</span></th>
							<td colspan="3">발행가능 - 신용카드 전표, 온라인 현금영수증</td>
						</tr>
					</tbody>
				</table>

				<!-- 정보 //-->
				<!-- 물품상태및 as 정보-->

				<!-- 상세정보 -->
				<div class="detailinfo">
					<h4>
						<img src="http://pics.auction.co.kr/itempage/tit_detailinfo.gif" alt="상세정보">
					</h4>
				</div>
				<!-- 상세정보 //-->


				<div class="sellercontents1">
					<!-- 판매자 상품설명 -->

					<!-- 사진자세히보기 -->
					<div id="parentImgListArea" class="mtxs">
						<h5>[사진 자세히보기]</h5>
						<br>
						<ul class="uploadedList">
							<!-- <li>
								<div class="view">
									<a href="javascript:onclick=ImgPopUp(1);"> <img
										src="http://pics.auction.co.kr/button/viewdetail_s.gif"
										alt="확대보기">
									</a>
								</div>
								<div>
									<a href="javascript:onclick=ImgPopUp(1);"> <img
										id="imgStand1"
										src=""
										alt="" width="400">
									</a>
								</div>
							</li> -->
						</ul>
					</div>
					<!-- 사진자세히보기 //-->
					<div class="sellercontents">
						<div class="noticenew">
							<p>${view.setence}</p>
						</div>
					</div>
					<!-- 판매자 상품설명// -->
				</div>
			</div>
			<!-- 상품정보 -->

		</div>
		<!-- CONTENTS //-->
	</div>
	
	<!-- <li>
		<span>
			<img src="{{imgsrc}}" style="width:100px;hegith:100px;">
		</span>
		<div>
			<a href="{{getLink}}" target={{target}}>{{fileName}}</a>
		</div>
	</li>
 -->
	<script id="sourceAttach" type="text/x-handlebars-template">
	<li>
		<div class="view">
			<a href="{{getLink}}" target={{target}}> 
				<img src="http://pics.auction.co.kr/button/viewdetail_s.gif" alt="확대보기">
			</a>
		</div>
		<div>
			<a href="{{getLink}}" target={{target}}> 
				<img id="imgStand1" src="{{getLink}}" alt="" width="400">
			</a>
		</div>
	</li>
	</script>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#ucControls_hdivUpper3").hide();
			var productNumber = "${view.productNumber}";
			getAllAttach(productNumber);

			var seconds = "80000";
			//var seconds = setSeconds();
			//countdown('txtLeftPeriod', seconds);	 // second base
			Countdown();
		})
		
		function getAllAttach(productNumber){
			$.getJSON("/board/getAttach/"+productNumber, function(data) {
				var source=$("#sourceAttach").html();
				var template = Handlebars.compile(source);
				
				$(data).each(function(index){
					var data2 = getFileInfo(this);
					$(".uploadedList").append(template(data2));
					
					if(index == 0){
						$("#ucImageNavigator_himgBig").attr("src", data2.getLink);
					}
				});
				
				
			});
		}
		
		/* seconds 계산
		function setSeconds(){
			//var deadLine = ${view.deadline};
			var n = new Date();

			//2019-04-09 16:29:17
			var endDate = "${view.endDate}";	//마감날짜,시간
			var endDate2 = endDate.split(" ");	//마감날짜와 시간 나누기
			
			var strDate1 = endDate2[0];			//마감날짜만 지정
			var arr1 = strDate1.split('-');		//마감날짜 년,월,일 나누기
			var dat1 = new Date(arr1[0], arr1[1], arr1[2]);		//date함수에 지정
			var dat2= new Date(n.getFullYear(), n.getMonth()+1, n.getDate());	//현재 date
			
			
			var diff = dat1 - dat2;
			//var currDay = 24 * 60 * 60 * 1000;// 시 * 분 * 초 * 밀리세컨
			//var date = parseInt(diff/currDay);
			//alert(diff);
			var deadLine_date = 0;
			if(diff > 0){
				deadLine_date = diff;
				//deadLine_date = dat1; 
			}
			
			
			var strTime1 = endDate2[1];
			var arr2 = strTime1.split(":");
			var tim1 = new Date(arr1[0], arr1[1], arr1[2], arr2[0], arr2[1], arr2[2]);
			var tim2 = new Date(n.getFullYear(), n.getMonth(), n.getDate(), n.getHours(), n.getMinutes(), n.getSeconds());
			
			//var deadLine_time= Math.floor(tim1.getTime() - tim2.getTime() ) / 1000;
			var deadLine_time= Math.floor(tim1.getTime() - tim2.getTime() );
			//var deadLine_time= tim1.getTime() / 1000;
			
			 
			var deadLine = deadLine_date + deadLine_time;
			
			return deadLine;
		}
		 */

		var g_Timer = 0;
		 
		var endDate = "${view.endDate}";
		var endDate2 = endDate.split(" ");	//마감날짜와 시간 나누기
		
		var strDate1 = endDate2[0];			//마감날짜만 지정
		var arr1 = strDate1.split('-');		//마감날짜 년,월,일 나누기
		
		var strTime1 = endDate2[1];
		var arr2 = strTime1.split(":");
		
		var g_LastTime = new Date(arr1[0], (arr1[1]-1), arr1[2], arr2[0], arr2[1], arr2[2]); //LastTime 
		var g_DBNowTime = new Date();
		var g_reload = "";
		var g_Extending = false;
		var g_LastTimeString = "${view.endDate}";
		
		function Countdown()
		{
			var NowTime = new Date(g_DBNowTime.getTime() + (g_Timer * 1000));			
			var iGap =  Math.floor((g_LastTime.getTime() - NowTime.getTime())/(1000));	
			var strLeftTime="", strLeftTime2="";
			
			if(iGap == 0){
				if (g_reload == "1")
				{
					setTimeout("Wait()",1000);
					return;
				}
				//document.location.href = location.pathname + "?itemno=B035144987&reload=1";
				return;
			}
			else if(iGap > 0){
				//alert(iGap);
				strLeftTime = FormatGap(iGap, "full");
				//alert(strLeftTime);
				
				if (!g_Extending){
					strLeftTime = strLeftTime + " (종료 : " + g_LastTimeString +")"
				}
				setTimeout("Countdown()",1000);
				g_Timer = g_Timer + 1;
				
			}
			else{
				strLeftTime = "경매종료";
				strLeftTime2 = "";		
				$("#ucControls_hdivUpper").hide();
				$("#ucControls_hdivUpper3").show();
			}
			

			if((typeof(self.parent.document.getElementById("txtLeftPeriod")) != "undefined" )) 
				self.parent.document.getElementById("txtLeftPeriod").innerHTML = strLeftTime;
		}
		
		function FormatGap(iGap, format){
			var iGapTime = new Date(2000, 0, 1, 0, 0, iGap);
			var strLeftTime = "";
			
 			if(format == "full"){
				if(iGapTime.getMonth() > 0 || iGapTime.getDate() > 1) strLeftTime = Math.floor(iGap/(60*60*24)) + "일 ";
				return strLeftTime + iGapTime.getHours() + "시간 " + iGapTime.getMinutes() + "분 " + iGapTime.getSeconds() + "초 ";
			}
			else{
				return iGapTime.getMinutes() + "분 " + iGapTime.getSeconds() + "초 ";
			}
		}	
		
			
		function auction_history(productNumber){
			//alert(productNumber);
			//var ret = window.open(url, name, specs, replace);
			var win = window.open("/board/auctionHistory?productNumber="+productNumber, "actionHistory", "width=600,height=700");
			
		}
	</script>

</body>
</html>