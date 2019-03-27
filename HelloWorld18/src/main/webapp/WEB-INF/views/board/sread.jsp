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
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

<title>Insert title here</title>
</head>
<body>



	<div class="container">
		<div class="row">

			<div class="form-group">
				<label for="title">제목</label> <input class="form-control" readonly
					name="title" id="title" value=${vo.title}>
			</div>

			<div class="form-group">
				<label for="writer">작성자</label> <input class="form-control" readonly
					name="writer" id="writer" value=${vo.writer}>
			</div>

			<div class="form-group">
				<label for="content">내용</label>
				<textarea class="form-control" readonly name="content" id="content">${vo.content}</textarea>
			</div>

			<div class="form-group">
				<button id="update" class="btn btn-warning">수정</button>
				<button id="delete" class="btn btn-danger">삭제</button>
				<button id="list" class="btn btn-info">목록</button>
			</div>

		</div>

	</div>

	<form>
		<input value="${vo.bno}" name="bno" type="hidden">
		<input value="${cri.page}" name="page" type="hidden">
		<input value="${cri.perPage}" name="perpage" type="hidden">
		<input value="${cri.keyword}" name="keyword" type="hidden">
		<input value="${cri.searchType}" name="searchType" type="hidden">
	</form>
	<!-- 	여러개일경우를 대비해서 이렇게 만들엇쪄 -->

	<script type="text/javascript">
		$(document).ready(function() {
			$("#update").click(function() {
				$("form").attr("action", "supdateui");
				$("form").attr("method", "get");
				$("form").submit();
			});
			
			$("#delete").click(function() {
				$("form").attr("action", "sdelete");
				$("form").attr("method", "get");
				$("form").submit();
			});
			$("#list").click(function() {
				$("form").attr("action", "search");
				$("form").attr("method", "get");
				$("form").submit();
			});

			
		});
	</script>


</body>
</html>