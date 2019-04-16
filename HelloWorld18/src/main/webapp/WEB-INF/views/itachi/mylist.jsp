<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
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
                                                	<h3 class="p0">경매 리스트</h3>
                                                </div>
                                                <c:if test="${not empty mylist}">
                                                <div class="wrapper p4">
                                                <table class="table table-hover">
												<thead>
													<tr>
														<th>상품번호</th>
														<th>제목</th>
														<th>경매종료일</th>
														<th>입찰수</th>
														<th>즉매가</th>
														<th></th>
													</tr>
												</thead>

												
												<tbody>
	                                                <c:forEach var="view" items="${mylist}">


														<tr>
															<td>${view.title}</td>
															<td>${view.endDate}</td>
															<td>${view.usellCount}</td>
															<td>${view.directMoney}원</td>
															<td><a href="/board/view?productNumber=${view.productNumber}">자세히보기</a></td>
														</tr>



													</c:forEach>
													</tbody>
													</c:if>
													</table>
													<c:if test="${empty mylist}">
                                                		등록하신 글이 없습니다.
                                                	</c:if>
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
