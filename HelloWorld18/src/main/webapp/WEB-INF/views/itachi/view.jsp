<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>경매 자세히 보기</title>
<link rel="stylesheet" type="text/css" href="//script.auction.co.kr/pc/style/css/common.css ">
<link rel="stylesheet" type="text/css" href="http://script.auction.co.kr/style/css/frame/vip_all.css">
<script src="../../resources/js/upload.js"></script>
</head>
<body>


<pre>${view}</pre>

<div id="locbar" class="crop">
	<div class="holder">
		<div class="loc">
			<a href="#" class="home">홈</a>
			<span class="sep">&gt;</span>
			<a href="#">노트북/PC</a>
			<span class="sep">&gt;</span>
			<a href="#">브랜드 데스크탑</a>
			<span class="sep">&gt;</span>
			<a href="#;">삼성</a>
			<span class="sep">&gt;</span>
			<a href="#"><strong>본체</strong></a>
		</div>
	</div>
</div>






	<div id="body">
		<!-- CONTENTS -->
		<div id="contents">

			<iframe id="iframeCart" style="DISPLAY: none" frameborder="0"
				width="0" height="0" scrolling="no"
				src="http://buy.auction.co.kr/buy/AutoGoCart.aspx?itemno=B034919150&amp;WeblogYN=N"></iframe>
			<script type="text/javascript">
	var frmsearchValue = "";

	var referrerValue = document.referrer;
	var locationValue = document.location.href;

	try {
		if (parent != window && parent.location.href.toLowerCase().indexOf("detailview.aspx") > 0) {
			referrerValue = parent.document.referrer;
			locationValue = parent.document.location.href;
		}
	} catch (ex) { }


	if (referrerValue.length > 0
	&& (referrerValue.toLowerCase().split("/")[2] == "search.auction.co.kr" || referrerValue.toLowerCase().split("/")[2] == "listings.auction.co.kr")
	&& (locationValue.indexOf("keyword=") > 0 || locationValue.indexOf("acode=") > 0)) {
		var refValue = referrerValue.toLowerCase().split("?")[1];
		var locValue = locationValue.toLowerCase().split("?")[1];

		refValue = unescape(refValue);
		locValue = unescape(locValue);

		var splitRefValue = refValue.split("&");
		var splitLocValue = locValue.split("&");

		frmsearchValue = "";

		for (var i = 0; i < splitRefValue.length; i++) {
			if (splitRefValue[i].indexOf("keyword=") != 0) {
				if (splitRefValue[i].indexOf("=") > 0) {
					if (frmsearchValue == "") frmsearchValue = splitRefValue[i];
					else frmsearchValue = frmsearchValue + "^" + splitRefValue[i];
				}
				else {
					if (frmsearchValue == "") frmsearchValue = splitRefValue[i];
					else frmsearchValue = frmsearchValue + "+" + splitRefValue[i];
				}
			}
		}
		for (var i = 0; i < splitLocValue.length; i++) {
			if (splitLocValue[i].indexOf("keyword=") == 0) {
				frmsearchValue = frmsearchValue + "^" + splitLocValue[i];
			}
			else if (splitLocValue[i].indexOf("scoredtype=") == 0) {
				frmsearchValue = frmsearchValue + "^" + splitLocValue[i];
			}
			else if (splitLocValue[i].indexOf("acode=") == 0) {
				frmsearchValue = frmsearchValue + "^" + splitLocValue[i];
			}
		}
		frmsearchValue = "&frmsearch=" + escape(frmsearchValue);
	}

	document.getElementById("iframeCart").src = "http://buy.auction.co.kr/buy/AutoGoCart.aspx?itemno=B034919150&WeblogYN=N" + frmsearchValue;
</script>
			<form method="post"
				action="./DetailView.aspx?ItemNo=B034919150&amp;scoredtype=0&amp;frm3=V3"
				id="frmMain" style="DISPLAY: inline"
				onsubmit="javascript:return false">
				<div class="aspNetHidden">
					<input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE"
						value="/wEPDwUKLTUxOTEzNzk3MGRk6JiMgfKODkzEoLx9eA+oO8Kh0Kw=">
				</div>


				<script language="javascript">
	<!--
		function Patrol() { }
		Patrol.submit = function (actionUrl) {
			var form = document.getElementById("frmMain1");
			if (!form) throw new "No form element exist.";
			form.action = actionUrl;
			form.submit();
		}

		//-->
	</script>

				<div class="aspNetHidden">

					<input type="hidden" name="__VIEWSTATEGENERATOR"
						id="__VIEWSTATEGENERATOR" value="8F40308D">
				</div>
				<script type="text/javascript">
	<!--
		System.loadFile("http://script.auction.co.kr/sell/favoriteitem.js");
		System.loadFile("http://script.auction.co.kr/sell/favoritestore.js");
	//-->
	</script>
				<script type="text/javascript"
					src="http://script.auction.co.kr/sell/favoriteitem.js"></script>
				<div id="_FavoriteItemLayer"
					style="display: none; position: absolute; z-index: 11000;"></div>
				<div id="_FavoriteItemGroupManageLayer"
					style="display: none; position: absolute; z-index: 11000; left: 249px; top: 142px;"></div>
				<div id="_FavoriteItemClosingAlarmRegistLayer"
					style="display: none; position: absolute; z-index: 11000;"></div>
				<input type="hidden" id="hdnData" name="hdnBulkRegistInfo">
				<input type="hidden" id="hdnCaller" name="hdnCaller">
				<script type="text/javascript"
					src="http://script.auction.co.kr/sell/favoritestore.js"></script>
				<div id="_FavoriteStoreLayer"
					style="display: none; position: absolute; z-index: 1000;"></div>
				<div id="_FavoriteStoreGroupManageLayer"
					style="display: none; position: absolute; z-index: 1000;"></div>

				<input type="hidden" id="imporidx" value=""> <input
					type="hidden" id="importy" value="">

				<script type="text/javascript">
<!--
document.domain = 'auction.co.kr';//-->
</script>
			</form>

			<!-- 상품상세정보 & 상품관련정보 -->
			<div class="mainarea">
				<!-- 좌측 상품상세정보 -->
				<div class="info">
					<!-- 이미지 -->

					<script type="text/javascript">
<!--
	if (typeof (System) == "undefined")
		document.writeln("<script type='text/javascript' src='http://script.auction.co.kr/arche.main.js'></" + "script>");
//-->
</script>
					<script type="text/javascript">
<!--
	System.loadFile("http://script.auction.co.kr/itempage/arche.itempage.js");
	System.loadFile("http://script.auction.co.kr/style/js/common.js");
//-->
</script>
					<input type="hidden" id="htxtShortCutName"
						value="삼성고사양슬림데스크탑6코어16램SSD_원_20190405"> <input
						type="hidden" id="htxtTargetImagePath"
						value="http://image.auction.co.kr/itemimage/18/82/5d/18825df700.jpg">
					<!-- 이미지 -->
					<div class="image">

						<!-- 큰 이미지 -->
						<div class="big01">
							<div class="biglbtn" style="display: inline">
								<img id="himgLeftArrow"
									src="http://pics.auction.co.kr/itempage/bigimg_lbtn.png"
									class="png24" alt="이전" title="이전"
									onclick="javascript:ItemImageObject.PrevItemImage('ucImageNavigator_himgBig', 'himgLeftArrow', 'himgRightArrow');"
									style="cursor: pointer">
							</div>
							<div class="bigrbtn" style="display: inline">
								<img id="himgRightArrow"
									src="http://pics.auction.co.kr/itempage/bigimg_rbtn.png"
									class="png24" alt="다음" title="다음"
									onclick="javascript:ItemImageObject.NextItemImage('ucImageNavigator_himgBig', 'himgLeftArrow', 'himgRightArrow');"
									style="cursor: pointer">
							</div>
							<img
								src="http://image.auction.co.kr/itemimage/18/82/5d/18825df720.jpg"
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

					<script type="text/javascript" language="javascript">
	var ItemImageObject = new SummaryItemImage();
	
	function InitSummaryItemImage() 
	{			
		if (!ItemImageObject.bItemImageLoaded) ItemImageObject.LoadItemImages('http://image.auction.co.kr/itemimage/18/82/5d/18825df700.jpg','http://image.auction.co.kr/itemimage/18/82/5d/18825df720.jpg','http://image.auction.co.kr/itemimage/18/82/5d/18825df740.jpg');			
		ItemImageObject.InitItemImage('ucImageNavigator_himgBig', 'himgLeftArrow', 'himgRightArrow');			
	}

	function shortCut_Click()
	{
		document.getElementById("frmShortCut").src = "http://itempage3.auction.co.kr/Popup/CreateShortCut.html";
		openLayer("saveBatangLayer");
	}
	
</script>
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
							</div>
						</div>
						<!-- 해외쇼핑 -->

						<!-- 해외쇼핑 // -->

						<script type="text/javascript">
<!--
	document.domain = "auction.co.kr";

	if (typeof (System) == "undefined")
		document.writeln("<script type='text/javascript' src='http://script.auction.co.kr/arche.main.js'></" + "script>");
//-->
</script>
						<script type="text/javascript">
<!--
	System.loadFile("http://script.auction.co.kr/style/js/common.js");
//-->
</script>

						<script type="text/javascript" language="javascript">
	function OpenCouponDownload(itemno, category, methodCode, price) {
		window.open("http://reward.auction.co.kr/Coupon/CouponDownload.aspx?itemno=" + itemno + "&category=" + category + "&method=" + methodCode + "&buyPrice=" + price, 'CouponDownloadPopup', 'toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no, resizable=yes,copyhistory=no ,width=342, height=288, left=200,top=260').focus();
	}

	function openCalculator() {
		if (window.OrderRequest && document.getElementById(OrderRequest.RequestClientID) != null && document.getElementsByName("htxtSelectedRequestStock").length == 0) {
			alert("주문옵션을 선택하시기 바랍니다.");
			return;
		}

		var queryString = "itemno=B034919150&MethodCode=4410&AsrtCode=22310101&SellerID=jkgg21&SellPricceControlID=ucSellPrice";
		var prePayShipping = document.getElementById("hddlPrePaidCost");
		var itemInfo = document.getElementById("htxtItem");

		if (itemInfo != null) {
			queryString += "&Price=" + itemInfo.getAttribute("Price");
		}

		if (prePayShipping != null) {
			if (prePayShipping.value == "2") {
				queryString += "&IsPrePaid=N";
			} else {
				queryString += "&IsPrePaid=Y";
			}
		} else {
			queryString += "&IsPrePaid=N";
		}

		if (queryString != "") {
			var url = "http://itempage.auction.co.kr/Popup/PreCalculator.aspx?" + encodeURI(queryString);
			window.open(url, 'Coupon', 'toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no,copyhistory=no ,width=450, height=605, left=100,top=100');
		}
	}
</script>
						<!-- 미리계산하기 Data -->

						<!-- 미리계산하기 Data -->
						<dl class="nv3 nfirst  present">

							<dt class="redprice">현재가</dt>

							<dd class="redprice">
								<div class="present_price" id="Price">
									<span class="present_num"><fmt:formatNumber value="${view.nowMoney}" pattern="#,###"/></span> 원
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
								<span class="fss"><span class="num_thm">27</span>회 </span> 
								<a href="javascript:checkEnd('/bidlist.aspx?ItemNo=B034919150');">
									<span class="sf01 uline">경매기록</span>
								</a>
							</dd>

							<dt>남은시간</dt>
							<dd style="margin-top: 1px;">
								<span class="fss" id="txtLeftPeriod">1일 21시간 38분 37초 (종료 : 19-04-07 12:33)</span> 
								<a href="javascript:HelpPop('A', 'D01015');">
									<span class="sf01 uline" id="txtExtendMessage"> 마감연장</span>
								</a>
							</dd>

						</dl>


						<script type="text/javascript">
	function DeliveryGridShippingInfo(val) {
		var valArray = val.split(",");

		this.ShippingTypeCode = valArray[0];
		this.IsFree = valArray[1];
		this.IsPrePayable = valArray[2];
		this.IsArrival = valArray[3];
		this.IsBundle = valArray[4];
		this.HasAddition = valArray[5];
		this.ShippingPaymentType = valArray[6];
		this.ShippingFee = valArray[7];
		this.IsMandatory = valArray[8];

		this.SetDeliveryAttribute = function() {
			var deliveryElement = document.getElementById("htxtDeliveryAndQty");
			if (deliveryElement == null)
				return;
			deliveryElement.setAttribute("PaymentType", this.ShippingPaymentType);
			deliveryElement.setAttribute("IsPrePayable", this.IsPrePayable == "1" ? "Y" : "N");
			deliveryElement.setAttribute("IsBundle", this.IsBundle == "1" ? "Y" : "N");
			deliveryElement.setAttribute("HasAddition", this.HasAddition == "1" ? "Y" : "N");
			deliveryElement.setAttribute("Fee", this.ShippingFee);
		}
	}
	
	function onShippingChange(onload) {
		var sShippingTypeCtrl = document.getElementById("sShippingType");

		if (sShippingTypeCtrl == null)
			return;

		var selectedIndex = sShippingTypeCtrl.selectedIndex;
		for (var i = 0; i < sShippingTypeCtrl.options.length; i++) {
			var dgsi = new DeliveryGridShippingInfo(sShippingTypeCtrl.options[i].value);
			if (i == selectedIndex) {
				dgsi.SetDeliveryAttribute();
				document.getElementById("st" + dgsi.ShippingTypeCode).style.display = "inline";
				if (dgsi.IsMandatory == "1")
					document.getElementById("additionalShippingTypeCode").value = "";
				else
					document.getElementById("additionalShippingTypeCode").value = dgsi.ShippingTypeCode;
					
				if (document.getElementById("selectPrePaidCost") == null)
					continue;

				if (dgsi.IsPrePayable == "1" && dgsi.IsArrival == "1" && dgsi.IsFree == "0") {
					document.getElementById("hdivPrePaidCost").style.display = "inline";
					document.getElementById("selectPrePaidCost").style.display = "inline";
					if (onload == null)
						document.getElementById("selectPrePaidCost").selectedIndex = 0;
				}
				else {
					document.getElementById("hdivPrePaidCost").style.display = "none";
					document.getElementById("selectPrePaidCost").style.display = "none";
					if (dgsi.IsFree == "1") document.getElementById("selectPrePaidCost").selectedIndex = 0;
					else if (dgsi.IsPrePayable == "1") document.getElementById("selectPrePaidCost").selectedIndex = 2;
					else if (dgsi.IsArrival == "1") document.getElementById("selectPrePaidCost").selectedIndex = 3;
					else document.getElementById("selectPrePaidCost").selectedIndex = 0;
				}
			}
			else
				document.getElementById("st" + dgsi.ShippingTypeCode).style.display = "none";
		}
	}

	var baseonload = window.onload;

	window.onload = function() {
		onShippingChange(true);
		baseonload();
	}

	function OpenStorePickupAddress(url) {
		window.open(url, 'StorePickupAddress', 'toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no,opyhistory=no,width=600,height=385').focus();
	}

	function OpenQuickServiceInfo(url) {
		window.open(url, 'QuickServiceInfo', 'toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no,opyhistory=no,width=600,height=335').focus();
	}
</script>
						<dl class="nv3">

							<dt>즉시구매가</dt>
							<dd>
								<span class="direct"><fmt:formatNumber value="${view.directMoney}" pattern="#,###"/></span>원
							</dd>
						</dl>

						<!-- 구매버튼-->


						<script type="text/javascript">
 	function FavoriteItemOpenSingleRegist(obj, catalogID, sell3URL, frameID) {
 		this.GetCookie = function(name) {
 			var prefix = name + "=";
 			var cookieStartIndex = document.cookie.indexOf(prefix);
 			if (cookieStartIndex == -1) { return (null); };
 			var cookieEndIndex = document.cookie.indexOf(";", cookieStartIndex + prefix.length);
 			if (cookieEndIndex == -1) { cookieEndIndex = document.cookie.length; };
 			return (unescape(document.cookie.substring(cookieStartIndex + prefix.length, cookieEndIndex)));
 		};
 		var loginCheck = (GetCookie("auction") != null) ? true : false;
 		if (!loginCheck) {
 			FavoriteItem.Login('http://www.auction.co.kr/login/?SELLER=AUCTION_HELP&url=http%3a%2f%2ffavorite.auction.co.kr%2fBuyerTools%2fFavorites%2fPopups%2fAfterLogin.html%3fWeblogYN%3dN');
 			return;
 		}
 		FavoriteItem.OpenSingleRegist(obj, catalogID, sell3URL, frameID);
 	}
</script>

						<p class="no-activex" style="display: none;">
							<img
								src="http://pics.auction.co.kr/vip/2013/no_activex_small.gif"
								alt="회원님! 크롬, 사파리, 파이어폭스, 오페라에서도 주문할 수 있습니다.">
						</p>
						<div id="ucControls_hdivUpper" class="mainbtnv3">
							<a id="ucControls_btn1"
								href="javascript:checkEnd('/bid.aspx?itemno=B034919150')"><img
								src="http://pics.auction.co.kr/listing/used/2014/btn_bidding.gif"
								alt=""></a><a id="ucControls_btn8"
								href="javascript:FavoriteItemOpenSingleRegist(document.getElementById('ucControls_btn8'), 'B034919150', '4410', 'http://sell3.auction.co.kr')"><img
								src="http://pics.auction.co.kr/listing/used/2014/btn_interest.gif"
								alt=""></a>
						</div>

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

					<li><a href="#product_qna" class="stab"><img
							src="http://pics.auction.co.kr/itempage/gtab_03.gif" class="txt"
							alt="상품문의" onclick="javascript:fnGoQuestion();"><!-- <span
							class="txt" id="spnQNA1">1</span> --></a></li>
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
			<!-- 판매자 스토어의 다른 물품 //-->
			<div id="pnlItemsInStore"></div>

			<!-- 판매자 스토어의 다른 물품 //-->
			<div id="pnlUccBoard">

				<!-- 상품문의 -->
				<div id="product_qna">
					<!-- 탭 -->
					<a name="Question"></a>
					<ul class="gtab gtab3">
						<li class="fir"><a href="#product_info"><img
								src="http://pics.auction.co.kr/itempage/gtab_01.gif" alt="상품정보"
								onclick="javascript:fnGoQuestion2();"></a></li>

						<!-- <li><a href="#product_comment" class="btab"><img
								src="http://pics.auction.co.kr/itempage/gtab_061.gif"
								alt="판매자가 받은 상품평" onclick="javascript:fnGoSellerTalk();"></a>
						</li> -->

						<li class="active"><strong><img
								src="http://pics.auction.co.kr/itempage/bktxt_tab02on.gif"
								class="txt" alt="상품문의"><!-- <span class="txt" id="spnQNA2">1</span> --><a
								href="#product_qna"></a></strong></li>
					</ul>
					<!-- 탭 //-->
					<!-- 상품문의 보기 -->
					<div id="divQuestion">
						<iframe id="iframeQuestion"
							src="http://buy.auction.co.kr/buy/QnA/ItemQna.aspx?ItemNo=B034919150&amp;CategoryName=브랜드 데스크탑&amp;WeblogYN=N&amp;c2c=1&amp;vipC2CType=itempage"
							frameborder="0" scrolling="no" cellspacing="0" cellpadding="0"
							width="100%" marginwidth="0" marginheight="0"
							style="height: 178px;"></iframe>
					</div>
				</div>
				<!-- 상품문의 -->

			</div>

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
				<img id="imgStand1" src="{{imgsrc}}" alt="" width="400">
			</a>
		</div>
	</li>
	</script>
	<script type="text/javascript">
		$(document).ready(function(){
			var productNumber = ${view.productNumber};
			getAllAttach(productNumber);
		})
		
		function getAllAttach(productNumber){
			$.getJSON("/board_s/getAttach/"+productNumber, function(data) {
				var source=$("#sourceAttach").html();
				var template = Handlebars.compile(source);
				
				$(data).each(function(){
					var data2 = getFileInfo(this);
					$(".uploadedList").append(template(data2));
				});
				
			});
		}
	</script>

</body>
</html>