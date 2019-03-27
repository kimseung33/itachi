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
			<form action="/board/supdate" method="post">

				<div class="form-group">
					<label for="bno">글번호</label> <input readonly class="form-control"
						id="bno" name="bno" value="${vo.bno}">
				</div>



				<div class="form-group">
					<label for="title">제목</label> <input required class="form-control"
						id="title" name="title" value="${vo.title}">
				</div>

				<div class="form-group">
					<label for="writer">작성자</label> <input required
						class="form-control" id="writer" name="writer"
						value="${vo.writer}">
				</div>

				<div class="form-group">
					<label for="content">내용</label>
					<textarea required class="form-control" id="content" name="content"
						rows="3">${vo.content}</textarea>
				</div>
				<input value="${cri.page}" name="page" type="hidden"> <input
					value="${cri.perPage}" name="perpage" type="hidden"> <input
					value="${cri.keyword}" name="keyword" type="hidden"> <input
					value="${cri.searchType}" name="searchType" type="hidden">
			</form>

			<div class="form-group">
				<button class="btn" type="submit">수정</button>
			</div>


		</div>
	</div>


	<script type="text/javascript">
		$(document).ready(function() {
			$("button[type='submit']").click(function() {
				$("form").attr("action", "supdate");
				$("form").attr("method", "post");
				$("form").submit();
			});
		});
	</script>


</body>
</html>