<%@page import="itachi.uchiha.domain.LoginDTO"%>
<%@page import="itachi.uchiha.domain.MemberDTO"%>
<%@page import="org.springframework.ui.Model"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title></title>
    <meta charset="utf-8">
    <link rel="stylesheet" href="../resources/css/reset.css" type="text/css" media="screen">
    <link rel="stylesheet" href="../resources/css/style.css" type="text/css" media="screen">
    <link rel="stylesheet" href="../resources/css/grid.css" type="text/css" media="screen"> 
    <script src="../resources/js/jquery-1.6.2.min.js" type="text/javascript"></script>
    <script src="../resources/js/jquery.galleriffic.js" type="text/javascript"></script>
    <script src="../resources/js/jquery.opacityrollover.js" type="text/javascript"></script>      
	<!--[if lt IE 7]>
        <div style=' clear: both; text-align:center; position: relative;'>
            <a href="http://www.microsoft.com/windows/internet-explorer/default.aspx?ocid=ie6_countdown_bannercode"><img src="http://storage.ie6countdown.com/assets/100/images/banners/warning_bar_0000_us.jpg" border="0"  alt="" /></a>
        </div>
	<![endif]-->
    <!--[if lt IE 9]>
   		<script type="text/javascript" src="js/html5.js"></script>
        <link rel="stylesheet" href="css/ie.css" type="text/css" media="screen">
	<![endif]-->
	
</head>
<style type="text/css">
#gnb { /*width:250px; background:#ccc;*/
	
}

#gnb>li { /* display:inline-block; */
	
}

#gnb>li>a {
	/* display:block; line-height:25px; width:80px; text-align:center; */
	
}

#gnb>li.on a {
	background: #777;
	color: #fff;
}

#gnb li ul {
	position: absolute;
	width: 100%;
	height: 0;
	overflow: hidden;
}

#gnb li.on ul {
	height: auto;
	background: #777;
	z-index: 9999;
}



#gnb li ul li a {
	margin: 3px 0;
	color: #fff;
}

#gnb li ul li a:hover {
	background: #fff;
	color: #000;
}
</style>


<body id="page1">

<!--==============================header=================================-->
<header>
	<div class="test">
		<ul>

		</ul>
	</div>

	<div class="row-1">
		<div class="main">
			<div class="container_12">
				<div class="grid_12">
					<nav>
						<div class="container"></div>
						<ul class="menu" id="gnb">
							<li><a href="/board/main" ${requestScope["javax.servlet.forward.request_uri"] eq "/board/main" ? "class='active'" : ""}>home</a></li>

							<li>
								<a href="javascrit:void(0);" ${ (requestScope["javax.servlet.forward.request_uri"] ne "/board/main") && (requestScope["javax.servlet.forward.request_uri"] ne "/board/search") ? "class='active'" : ""}>Category</a>
								<ul>
									<li><a href="/board/clothing?productNumber=A">의류</a></li>
									<li><a href="/board/beauty?productNumber=B">뷰티</a></li>
									<li><a href="/board/merchandise?productNumber=C">잡화</a></li>
									<li><a href="/board/appliances?productNumber=D">가전제품</a></li>
									<li><a href="/board/bookorticket?productNumber=E">도서 티켓</a></li>
								</ul>
							</li>

							<%
								LoginDTO dto = new LoginDTO();
								MemberDTO dto1 = new MemberDTO();
								Object session1 = session.getAttribute("login");
								if (session1 != null) {
							%>
									<li><a href="/member/update?id=${login.mb_Id}">개인정보수정</a></li>
									<li><a href="javascript:void(0)" onclick="cashui('${login.mb_Id}')">캐쉬충전</a></li>
									<li><a href="/board/Registration?id=${login.mb_Id}">글쓰기</a></li>
									<li><a href="/board/mylist?id=${login.mb_Id}">경매 리스트</a></li>
									
									
									<li>
										<a href="javascrit:void(0);" style="width:564px !important">
											${login.mb_Id}님 환영합니다
											<br>
											잔액:<fmt:formatNumber value="${login.mb_cash}" pattern="#,###"/> 원
										</a>
									</li>
									<li style="float:right;"><a href="/member/logout">Logout</a></li>
							<%
								} else {
							%>
									<li><a href="/member/login">Login</a></li>
							<%
								}
							%>
						</ul>

					</nav>
				</div>
			</div>
			<div class="clear"></div>
		</div>
	</div>
	<div class="row-2">
		<div class="main">
			<div class="container_12">
				<div class="grid_9">
					<h1>
						<a class="logo" href="#"><strong>A</strong>katsuki</a> <span>경매(Itachi)</span>
					</h1>
				</div>
				<div class="grid_3">
					<form id="search-form" action="/board/search" method="get"
						enctype="multipart/form-data">
						<input type="hidden" name="searchType" id="searchType"
							value="title">

						<fieldset>
							<div class="search-field">									
								<input class="form-control" id="keyword" name="keyword"
									type="text"> 
									<a class="search-button" href="#" onClick="document.getElementById('search-form').submit()"> <span>search</span></a>
							</div>
						</fieldset>
					</form>
				</div>
				<div class="clear"></div>
			</div>
		</div>
	</div>
</header>

<script type="text/javascript">
function cashui(mb_id){
	var win = window.open("/member/cashui?id="+mb_id, "actionHistory", "width=600,height=700");
}
</script>