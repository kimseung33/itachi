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

								<li>
									<a href="javascrit:void(0);">Category</a>
									<ul>
										<li><a href="/board/clothing?productNumber=A">�Ƿ�</a></li>
										<li><a href="/board/beauty?productNumber=B">��Ƽ</a></li>
										<li><a href="/board/merchandise?productNumber=C">��ȭ</a></li>
										<li><a href="/board/appliances?productNumber=D">������ǰ</a></li>
										<li><a href="/board/bookorticket?productNumber=E">���� Ƽ��</a></li>
									</ul>
								</li>

								<%
									LoginDTO dto = new LoginDTO();
									MemberDTO dto1 = new MemberDTO();
									Object session1 = session.getAttribute("login");
									if (session1 != null) {
								%>
										<li><a href="/member/update?id=${login.mb_Id}">������������</a></li>
										<li><a href="/member/cashui?id=${login.mb_Id}">ĳ������</a></li>
										<li><a href="/board/Registration?id=${login.mb_Id}">�۾���</a></li>
										
										
										<li>
											<a href="javascrit:void(0);" style="width:752px !important">
												${login.mb_Id}�� ȯ���մϴ�
												<br>
												�ܾ�:<fmt:formatNumber value="${login.mb_cash}" pattern="#,###"/> ��
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
							<a class="logo" href="#"><strong>A</strong>katsuki</a> <span>���(Itachi)</span>
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
                                                	<h3 class="p0">�α� TOP100</h3>
                                                </div>
                                                <div class="wrapper p4">
	                                                <c:forEach var="view" items="${view}">
														<%-- <div class="navigation">
															<ul class="thumbs noscript">
																<div>
																<a href="/board/view?productNumber=${view.productNumber}"><img
																src="/displayfile?fileName=${view.files[0]}" /></a>
																<li><a
																href="/board/view?productNumber=${view.productNumber}">${view.title}</a>
																�ﱸ��:${view.directMoney} ${view.endDate}</li>
															</div>
															</ul>
														</div> --%>
														<article class="grid_4 alpha" style="margin-bottom: 20px;">
	                                                        <div class="indent3">
	                                                            <figure class="frame2 p2" style="text-align:center;"><img src="/displayfile?fileName=${view.files[0]}" width="200px" /></figure>
	                                                            <p class="color-4 prev-indent-bot">${view.title}</p>
	                                                            <p style="font-size:">��� ���� : ${view.endDate} ������:${view.usellCount}</p>
	                                                            <div class="wrapper">
	                                                            	<span class="price fleft">��Ű�:${view.directMoney}</span> <span style="font-size:25px;">��</span>
	                                                                <a class="button fright" href="/board/view?productNumber=${view.productNumber}">�ڼ�������</a>
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
    </section>
    


	<!--==============================footer=================================-->
	<footer>
		<div class="main">
			<div class="container_12">
				<div class="wrapper">
					<div class="grid_4">
						<!-- {%FOOTER_LINK} -->
					</div>
					<div class="grid_4">
						<!-- <span class="phone-numb"><span>02)</span> 123-1234</span> -->
					</div>
					<div class="grid_4">
					</div>
				</div>
			</div>
		</div>


	</footer>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#gnb > li").bind("mouseenter focusin", function() {
				//���� ���õ� ���� onŬ������ �ְ� ������ ���� ��ҵ鿡�� onŬ���� ����
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
