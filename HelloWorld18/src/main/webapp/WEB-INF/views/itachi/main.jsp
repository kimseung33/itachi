<%@page import="itachi.uchiha.domain.LoginDTO"%>
<%@page import="itachi.uchiha.domain.MemberDTO"%>
<%@page import="org.springframework.ui.Model"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
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


								<li><a href="/board/main" class="active">home</a></li>

								<li><a href="#">Category</a>
									<ul>
										<li><a href="/board/clothing?productNumber=A">의류</a></li>
										<li><a href="/board/beauty?productNumber=B">뷰티</a></li>
										<li><a href="/board/merchandise?productNumber=C">잡화</a></li>
										<li><a href="/board/appliances?productNumber=D">가전제품</a></li>
										<li><a href="/board/bookorticket?productNumber=E">도서
												티켓</a></li>
									</ul></li>
								<li><a href="#">AAAAA</a></li>
								<li><a href="#">BBBBBB</a></li>
								<%
									LoginDTO dto = new LoginDTO();
									MemberDTO dto1 = new MemberDTO();
									Object session1 = session.getAttribute("login");

									if (session1 == null) {
								%>

								<li><a href="/member/login">Login</a></li>
								<%
									} else {
								%>
								<li><a href="/member/logout">Logout</a></li>
								<%
									}
								%>

								<%
									if (session1 != null) {
								%>
								<li><a href="/member/update?id=${login.mb_Id}">개인정보수정</a></li>
								<%
									}
								%>
								<%
									if (session1 != null) {
								%>
								<li><a href="/board/Registration?id=${login.mb_Id}">글쓰기</a></li>
								<%
									}
								%>
								<%
									if (session1 != null) {
								%>
								<li><a href="/member/cashui?id=${login.mb_Id}">캐쉬충전</a></li>
								<%
									}
								%>
								<%
									if (session1 != null) {
								%>
								<li>${login.mb_Id}님환영합니다</li>
								<li>잔액:${login.mb_cash}</li>
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
	<div class="ic">More Website Templates @ TemplateMonster.com -
		August22nd 2011!</div>

	<!-- content -->
	<section id="content">
		<div class="bg-top">
			<div class="bg-top-2">
				<div class="bg">
					<div class="bg-top-shadow">
						<div class="main">
							<div class="gallery p3">
								<div class="wrapper indent-bot">
								<c:forEach var="view" items="${view}">
										<div class="navigation">
											<ul class="thumbs noscript">
												<div>
													<a href="/board/view?productNumber=${view.productNumber}"><img
														src="/displayfile?fileName=${view.files[0]}" /></a>
													<li><a
														href="/board/view?productNumber=${view.productNumber}">${view.title}</a>
														즉구가:${view.directMoney} ${view.endDate}</li>
												</div>
											</ul>
										</div>
									</c:forEach>				
								
									<div id="gallery" class="content">
										<div class="wrapper">
											<div class="slideshow-container">
												<div id="slideshow" class="slideshow"></div>
											</div>
										</div>
									</div>

									
								</div>
								<div class="inner">
									<div class="wrapper">
										<span class="title img-indent3">HELLO!</span>
										<div class="extra-wrap indent-top2">
											<strong>Interior Design</strong> is one of <a target="_blank"
												href="http://blog.templatemonster.com/free-website-templates/ ">free
												website templates</a> created by TemplateMonster.com team. This
											website template is opti mized for 1024X768 screen
											resolution. It is also XHTML &amp; CSS valid. It has several
											pages: <a class="color-3" href="index.html">About</a>, <a
												class="color-3" href="services.html">Services</a>, <a
												class="color-3" href="catalogue.html">Catalogue</a>, <a
												class="color-3" href="pricing.html">Pricing</a>, <a
												class="color-3" href="contacts.html">Contact Us</a> (note
											that contact us form _ doesn’t work).
										</div>
									</div>
								</div>
							</div>
							<div class="container_12">
								<div class="wrapper">
									<article class="grid_12">
										<h3 class="color-1">Our Services List</h3>
										<div class="wrapper">
											<article class="grid_6 alpha">
												<figure class="img-indent frame">
													<img src="../resources/images/page1-img1.jpg" alt="" />
												</figure>
												<div class="extra-wrap">
													<div class="indent-top">
														<ul class="list-1">
															<li><a href="#">Interior Decorating Services</a></li>
															<li class="last"><a href="#">Complete Color <br>Analysis
															</a></li>
														</ul>
													</div>
												</div>
												<div class="clear"></div>
											</article>
											<article class="grid_6 omega">
												<figure class="img-indent frame">
													<img src="../resources/images/page1-img2.jpg" alt="" />
												</figure>
												<div class="extra-wrap">
													<div class="indent-top">
														<ul class="list-1">
															<li><a href="#">Design Services <br>for
																	Home Construction
															</a></li>
															<li class="last"><a href="#">Interior Design
																	Remodeling</a></li>
														</ul>
													</div>
												</div>
												<div class="clear"></div>
											</article>
										</div>
									</article>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="bg-bot">
			<div class="main">
				<div class="container_12">
					<div class="wrapper">
						<article class="grid_4">
							<h3 class="prev-indent-bot">About Us</h3>
							<p class="prev-indent-bot">
								This <a target="_blank"
									href="http://blog.templatemonster.com/2011/08/22/free-website-template-clean-style-interior/ ">Interior
									Design Template</a> goes with two pack ages: with PSD source files
								and without them.
							</p>
							PSD source files are available for free for the registered
							members of Templates.com. The basic package (without PSD source)
							is available for anyone without registration.
						</article>
						<article class="grid_4">
							<h3 class="prev-indent-bot">Testimonials</h3>
							<div class="quote">
								<p class="prev-indent-bot">
									At vero eos et accusamus et iusto odio tium voluptatum deleniti
									atque corrupti quos<br> dolores et quas molestias
									excepturi sint occaecati cupiditate.
								</p>
								<h5>James Reese</h5>
								Managing Director
							</div>
						</article>
						<article class="grid_4">
							<h3 class="prev-indent-bot">What’s New?</h3>
							<time class="tdate-1" datetime="2011-08-15">
								<a class="link" href="#">15.08.2011</a>
							</time>
							<p class="prev-indent-bot">Sed ut perspiciatis unde omnis
								iste natus error sit voluptatem accusantium doloremque.</p>
							<time class="tdate-1" datetime="2011-08-11">
								<a class="link" href="#">11.08.2011</a>
							</time>
							Totam rem aperiam, eaque ipsa quae ab illo inven tore veritatis
							et quasi architecto.
						</article>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!--==============================footer=================================-->
	<footer>
		<div class="main">
			<div class="container_12">
				<div class="wrapper">
					<div class="grid_4">
						<div>
							Interior Design &copy; 2011 <a class="link color-3" href="#">Privacy
								Policy</a>
						</div>
						<div>
							<a rel="nofollow" target="_blank"
								href="http://www.templatemonster.com/">Website Template</a> by
							TemplateMonster.com | <a rel="nofollow" target="_blank"
								href="http://www.html5xcss3.com/">html5xcss3.com</a>
						</div>
						<!-- {%FOOTER_LINK} -->
					</div>
					<div class="grid_4">
						<span class="phone-numb"><span>+1(800)</span> 123-1234</span>
					</div>
					<div class="grid_4">
						<ul class="list-services">
							<li><a href="#"></a></li>
							<li><a class="item-2" href="#"></a></li>
							<li><a class="item-3" href="#"></a></li>
							<li><a class="item-4" href="#"></a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>


	</footer>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#gnb > li").bind("mouseenter focusin", function() {
				//현재 선택된 곳에 on클래스를 넣고 나머지 형제 요소들에서 on클래스 삭제
				$(this).addClass("on").siblings().removeClass("on");
			});
			$("#gnb > li").bind("mouseleave focusout", function() {
				$(this).removeClass("on");
			});

		});

		$(window).load(function() {
			// We only want these styles applied when javascript is enabled
			$('div.navigation').css({
				'width' : '320px',
				'float' : 'right'
			});
			$('div.content').css('display', 'block');

			// Initially set opacity on thumbs and add
			// additional styling for hover effect on thumbs
			var onMouseOutOpacity = 0.5;
			$('#thumbs ul.thumbs li span').opacityrollover({
				mouseOutOpacity : onMouseOutOpacity,
				mouseOverOpacity : 0.0,
				fadeSpeed : 'fast',
				exemptionSelector : '.selected'
			});

			// Initialize Advanced Galleriffic Gallery
			var gallery = $('#thumbs').galleriffic({
				delay : 7000,
				numThumbs : 12,
				preloadAhead : 6,
				enableTopPager : false,
				enableBottomPager : false,
				imageContainerSel : '#slideshow',
				controlsContainerSel : '',
				captionContainerSel : '',
				loadingContainerSel : '',
				renderSSControls : true,
				renderNavControls : true,
				playLinkText : 'Play Slideshow',
				pauseLinkText : 'Pause Slideshow',
				prevLinkText : 'Prev',
				nextLinkText : 'Next',
				nextPageLinkText : 'Next',
				prevPageLinkText : 'Prev',
				enableHistory : true,
				autoStart : 7000,
				syncTransitions : true,
				defaultTransitionDuration : 900,
				onSlideChange : function(prevIndex, nextIndex) {
					// 'this' refers to the gallery, which is an extension of $('#thumbs')
					this.find('ul.thumbs li span').css({
						opacity : 0.5
					})
				},
				onPageTransitionOut : function(callback) {
					this.find('ul.thumbs li span').css({
						display : 'block'
					});
				},
				onPageTransitionIn : function() {
					this.find('ul.thumbs li span').css({
						display : 'none'
					});
				}
			});

		});
	</script>
</body>
</html>
