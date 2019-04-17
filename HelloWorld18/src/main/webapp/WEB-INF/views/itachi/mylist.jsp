<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
<style>
table.tbl_list {
    border-collapse: separate;
    border-spacing: 1px;
    text-align: center;
    line-height: 1.5;
    margin: 20px 10px;
}
table.tbl_list th {
	padding: 10px;
    font-weight: bold;
    vertical-align: top;
    color: #bd7031;
    border-bottom: 3px solid #a35d18;
}
table.tbl_list td {
    width: 350px;
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
}
</style>
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
                                                <div class="wrapper p4">
	                                                <c:if test="${not empty mylist}">
		                                                <table class="tbl_list">
															<thead>
																<tr>
																	<th width="10%">상품번호</th>
																	<th width="20%">제목</th>
																	<th width="10%">경매시작일</th>
																	<th width="10%">경매종료일</th>
																	<th width="10%">입찰수</th>
																	<th width="10%">종료여부</th>
																	<th width="10%">낙찰여부</th>
																	<th width="10%">자세히</th>
																</tr>
															</thead>
															<tbody> 
																<!-- 현재시간 date format  -->
																<c:set var="today_date" value="<%=new java.util.Date()%>"/>
																<!-- datetime 비교하기쉽게 yyyyMMddHHmmss 방식으로 저장 --> 
																<fmt:formatDate var="nowdateString" value="${today_date}" pattern="yyyyMMddHHmmss"/>
																
				                                                <c:forEach var="view" items="${mylist}">
				                                                	<!-- 경매종료시간 date format -->
				                                                	<!-- dateformat을 하기 위해 date를 java.util.date형식으로 초기화 -->
																	<fmt:parseDate value="${view.endDate}" var="endDate" pattern="yyyy-MM-dd HH:mm:ss"/>
																	<!-- datetime 비교하기쉽게 yyyyMMddHHmmss 방식으로 저장 -->
																	<fmt:formatDate var="enddateString" value="${endDate}" pattern="yyyyMMddHHmmss"/>	
				                                                	
																	<tr>
																		<td>${view.productNumber}</td>
																		<td>${view.title}</td>
																		<td>${view.writedate}</td>
																		<td>${view.endDate}</td>
																		<td>${view.usellCount}</td>
																		
																		<!-- 경매종료시간 vs 현재시간 비교 -->
																		<c:choose>
																			<c:when test="${enddateString > nowdateString}">
																				<td>경매중</td>
																				<td>낙찰<br>불가능</td>
																			</c:when>
																			<c:otherwise>
																				<td>경매종료</td>
																				
																				<c:if test="${view.usellCount > 0}">
																					<c:if test="${view.endflag eq 'N' }">
																						<td><a href="javascript:alert('낙찰가능url연결좀')">낙찰가능</a></td>
																					</c:if>
																					<c:if test="${view.endflag eq 'Y' }">
																						<td>낙찰완료</td>
																					</c:if>
																				</c:if>
																				<c:if test="${view.usellCount <= 0}">
																					<td>입찰없음</td>
																				</c:if>
																			</c:otherwise>
																		</c:choose>															
																		
																		<td><a href="/board/view?productNumber=${view.productNumber}" style="color:#bd7031">자세히</a></td>
																	</tr>
																</c:forEach>
															</tbody>
														</table>
													</c:if>
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
