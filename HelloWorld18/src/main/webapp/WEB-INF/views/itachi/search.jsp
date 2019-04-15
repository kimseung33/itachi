<%@page import="itachi.uchiha.domain.LoginDTO"%>
<%@page import="itachi.uchiha.domain.MemberDTO"%>
<%@page import="org.springframework.ui.Model"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	
	
<!-- content -->
    <section id="content">
        <div class="bg-top">
        	<div class="bg-top-2">
                <div class="bg">
                    <div class="bg-top-shadow">
                        <div class="main">
                            <div class="box">
                                <div class="padding">
                                    <div class="container_12">
                                        <div class="wrapper">
                                            <div class="grid_12">
                                            	<div class="indent-left p2">
                                                	<h3 class="p0">${fn:length(list)} <span style="font-size:25px;">개의 검색 결과</span></h3>
                                                </div>
                                                <div class="wrapper p4">
	                                                <c:forEach var="view" items="${list}">
														<article class="grid_4 alpha" style="margin-bottom: 20px;">
	                                                        <div class="indent3">
	                                                            <figure class="frame2 p2" style="text-align:center;"><img src="/displayfile?fileName=${view.files[0]}" width="200px" /></figure>
	                                                            <p class="color-4 prev-indent-bot">${view.title}</p>
	                                                            <p style="font-size:">경매 종료 : ${view.endDate} 입찰수:${view.usellCount}</p>
	                                                            <div class="wrapper">
	                                                            	<span class="price fleft">즉매가:${view.directMoney}</span> <span style="font-size:25px;">원</span>
	                                                                <a class="button fright" href="/board/view?productNumber=${view.productNumber}">자세히보기</a>
	                                                            </div>
	                                                        </div>
                                                    	</article>
													</c:forEach>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
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
                        	<h3 class="p2">New Furniture</h3>
                            <div class="wrapper">
                            	<figure class="img-indent frame2"><img src="../resources/images/page4-img7.jpg" alt="" /></figure>
                                <p class="prev-indent-bot color-4">At vero eos eaccusa mus etusto odio.</p>
                                <p class="prev-indent-bot">Tium voluptatum del eniti atque corrupti quos dolores.</p>
                                <a class="button" href="#">View More</a>
                            </div>
                        </article>
                        <article class="grid_8">
                        	<h3 class="prev-indent-bot2">Our Pricing</h3>
                            <div class="wrapper">
                            	<div class="grid_4 alpha">
                                	<div class="indent-right2">
                                        <ul class="price-list">
                                            <li><span>$6700.00</span><a href="#">Totam rem aperiam eaque</a><strong>&nbsp;</strong></li>
                                            <li><span>$4370.00</span><a href="#">Inventore veritatis quasi</a><strong>&nbsp;</strong></li>
                                            <li><span>$5780.00</span><a href="#">Nemo enim ipsam voluptatem</a><strong>&nbsp;</strong></li>
                                            <li><span>$2300.00</span><a href="#">Voluptas sit aspernatur aut</a><strong>&nbsp;</strong></li>
                                            <li><span>$3650.00</span><a href="#">Sed quia consequuntur magni</a><strong>&nbsp;</strong></li>
                                            <li class="last"><span>$7900.00</span><a href="#">Ratione voluptatem sequi</a><strong>&nbsp;</strong></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="grid_4 omega">
                                	<div class="indent-right2">
                                        <ul class="price-list">
                                            <li><span>$6700.00</span><a href="#">Totam rem aperiam eaque</a><strong>&nbsp;</strong></li>
                                            <li><span>$4370.00</span><a href="#">Inventore veritatis quasi</a><strong>&nbsp;</strong></li>
                                            <li><span>$5780.00</span><a href="#">Nemo enim ipsam voluptatem</a><strong>&nbsp;</strong></li>
                                            <li><span>$2300.00</span><a href="#">Voluptas sit aspernatur aut</a><strong>&nbsp;</strong></li>
                                            <li><span>$3650.00</span><a href="#">Sed quia consequuntur magni</a><strong>&nbsp;</strong></li>
                                            <li class="last"><span>$7900.00</span><a href="#">Ratione voluptatem sequi</a><strong>&nbsp;</strong></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
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

		});
	</script>
</body>
</html>
