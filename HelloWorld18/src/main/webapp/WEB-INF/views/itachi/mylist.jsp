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
                                                	<h3 class="p0">��� ����Ʈ</h3>
                                                </div>
                                                <div class="wrapper p4">
	                                                <c:if test="${not empty mylist}">
		                                                <table class="tbl_list">
															<thead>
																<tr>
																	<th width="10%">��ǰ��ȣ</th>
																	<th width="20%">����</th>
																	<th width="10%">��Ž�����</th>
																	<th width="10%">���������</th>
																	<th width="10%">������</th>
																	<th width="10%">���Ῡ��</th>
																	<th width="10%">��������</th>
																	<th width="10%">�ڼ���</th>
																</tr>
															</thead>
															<tbody> 
																<!-- ����ð� date format  -->
																<c:set var="today_date" value="<%=new java.util.Date()%>"/>
																<!-- datetime ���ϱ⽱�� yyyyMMddHHmmss ������� ���� --> 
																<fmt:formatDate var="nowdateString" value="${today_date}" pattern="yyyyMMddHHmmss"/>
																
				                                                <c:forEach var="view" items="${mylist}">
				                                                	<!-- �������ð� date format -->
				                                                	<!-- dateformat�� �ϱ� ���� date�� java.util.date�������� �ʱ�ȭ -->
																	<fmt:parseDate value="${view.endDate}" var="endDate" pattern="yyyy-MM-dd HH:mm:ss"/>
																	<!-- datetime ���ϱ⽱�� yyyyMMddHHmmss ������� ���� -->
																	<fmt:formatDate var="enddateString" value="${endDate}" pattern="yyyyMMddHHmmss"/>	
				                                                	
																	<tr>
																		<td>${view.productNumber}</td>
																		<td>${view.title}</td>
																		<td>${view.writedate}</td>
																		<td>${view.endDate}</td>
																		<td>${view.usellCount}</td>
																		
																		<!-- �������ð� vs ����ð� �� -->
																		<c:choose>
																			<c:when test="${enddateString > nowdateString}">
																				<td>�����</td>
																				<td>����<br>�Ұ���</td>
																			</c:when>
																			<c:otherwise>
																				<td>�������</td>
																				
																				<c:if test="${view.usellCount > 0}">
																					<c:if test="${view.endflag eq 'N' }">
																						<td><a href="javascript:alert('��������url������')">��������</a></td>
																					</c:if>
																					<c:if test="${view.endflag eq 'Y' }">
																						<td>�����Ϸ�</td>
																					</c:if>
																				</c:if>
																				<c:if test="${view.usellCount <= 0}">
																					<td>��������</td>
																				</c:if>
																			</c:otherwise>
																		</c:choose>															
																		
																		<td><a href="/board/view?productNumber=${view.productNumber}" style="color:#bd7031">�ڼ���</a></td>
																	</tr>
																</c:forEach>
															</tbody>
														</table>
													</c:if>
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
