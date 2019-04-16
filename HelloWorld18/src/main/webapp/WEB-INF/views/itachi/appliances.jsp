<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<jsp:include page="/WEB-INF/views/include/header.jsp" />

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
                                                	<h3 class="p0">���� ��ǰ</h3>
                                                </div>
                                                <div class="wrapper p4">
	                                                <c:forEach var="ctgrview" items="${ctgrview}">
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
	                                                            <figure class="frame2 p2" style="text-align:center;"><img src="/displayfile?fileName=${ctgrview.files[0]}" width="200px" /></figure>
	                                                            <p class="color-4 prev-indent-bot">${ctgrview.title}</p>
	                                                            <p style="font-size:">��� ���� : ${ctgrview.endDate} ������:${ctgrview.usellCount}</p>
	                                                            <div class="wrapper">
	                                                            	<span class="price fleft">��Ű�:${ctgrview.directMoney}</span> <span style="font-size:25px;">��</span>
	                                                                <a class="button fright" href="/board/view?productNumber=${ctgrview.productNumber}">�ڼ�������</a>
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
