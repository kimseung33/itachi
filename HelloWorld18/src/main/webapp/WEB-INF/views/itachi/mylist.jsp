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
                                                	<h3 class="p0">��� ����Ʈ</h3>
                                                </div>
                                                <c:if test="${not empty mylist}">
                                                <div class="wrapper p4">
                                                <table class="table table-hover">
												<thead>
													<tr>
														<th>��ǰ��ȣ</th>
														<th>����</th>
														<th>���������</th>
														<th>������</th>
														<th>��Ű�</th>
														<th></th>
													</tr>
												</thead>

												
												<tbody>
	                                                <c:forEach var="view" items="${mylist}">


														<tr>
															<td>${view.title}</td>
															<td>${view.endDate}</td>
															<td>${view.usellCount}</td>
															<td>${view.directMoney}��</td>
															<td><a href="/board/view?productNumber=${view.productNumber}">�ڼ�������</a></td>
														</tr>



													</c:forEach>
													</tbody>
													</c:if>
													</table>
													<c:if test="${empty mylist}">
                                                		����Ͻ� ���� �����ϴ�.
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
