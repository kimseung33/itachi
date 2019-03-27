<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<title>Insert title here</title>
</head>
<body>

	<div class="container">
		<div class="row">
			<h1 class="text-center">검색 결과</h1>
		</div>


		<div class="row">

			<table class="table table-hober">
				<thead>

					<tr>
						<th>글번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>

				</thead>


				<tbody>
					<c:forEach var="vo" items="${list}">
						<tr>
							<td>${vo.bno}</td>
							<td><a
								href="/board/sread${pm.makeSearch(pm.cri.page)}&bno=${vo.bno}">${vo.title}</a></td>
							<td>${vo.writer}</td>
							<td>${vo.updateDate}</td>
							<td>${vo.viewcnt}</td>
						</tr>
					</c:forEach>

				</tbody>
				<tr>
				</tr>

				</tbody>

			</table>
		</div>
		<!-- 클래스 로우 -->


		<div class="row text-center">
			<ul class="pagination">
				<c:if test="${pm.cri.page>1}">
					<li><a href="/board/search${pm.makeSearch(pm.cri.page-1)}">&laquo;</a></li>
				</c:if>


				<c:forEach var="idx" begin="${pm.beginPageNum}"
					end="${pm.stopPageNum}">
					<li class="${pm.cri.page==idx?'active':''}"><a
						href="/board/search${pm.makeSearch(idx)}">${idx}</a></li>
				</c:forEach>
				<c:if test="${pm.cri.page<pm.totalPage}">
					<li><a href="/board/search${pm.makeSearch(pm.cri.page+1)}">&raquo;</a></li>
				</c:if>
			</ul>


		</div>


	<!-- 	<div class="row">

			<form target="_blank" method="get" action="/board/search">

				<div class="col-xs-3 col-sm-2">
					<select class="form-control" id="ssel" name="serachType">
						<option disabled>검색 기준</option>
						<option value="title">제목</option>
						<option value="writer">작성자</option>
						<option value="content">내용</option>
					</select>
				</div> -->

	<!-- 			<div class="input-group col-xs-9 col-sm-10">
					<input class="form-control" id="keyword" name="keyword"> <span
						class="input-group-btn">
						<button class="btn btn-success">검색</button>
					</span>
				</div> -->


			</form>

		</div>
		<!-- 로우태그엔드 -->




	</div>
	<!-- 클래스 컨테이너 -->

	<script type="text/javascript">
		$(document).ready(function() {

			$(".btn-success").click(function() {
				$("form").submit();
			});

		});
	</script>




</body>
</html>