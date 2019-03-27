<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<style type="text/css">
.fileDrop {
	width: 100%;
	height: 100px;
	border: 1px dotted gray;
}

small {
	margin-left: 3px;
	color: red;
	cursor: pointer;
}
</style>
<title>Insert title here</title>
</head>
<body>

	<div class="container">
		<div class="row">
			<div class="fileDrop"></div>
			<div class="uploadedList"></div>
		</div>
	</div>
	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							$(".uploadedList").on(
									"click",
									"small",
									function(event) {
										var $that = $(this);
										$.ajax({
											url : "deletefile",
											type : "post",
											data : {
												fileName : $that
														.attr("data-src")
											},
											dataType : "text",
											success : function(result) {
												alert("삭제되었습니다.");
												$that.parent("div").remove();
											}
										})
									});

							$(".fileDrop").on("dragenter dragover",
									function(event) {
										event.preventDefault();
									});

							$(".fileDrop").on("drop",function(event) {
								event.preventDefault();
								var files = event.originalEvent.dataTransfer.files;
								for (var i = 0; i < files.length; i++) {
									var file = files[i];
									var formData = new FormData();
									formData.append("file",	file);
										$.ajax({
											url : "/uploadAjax",
											type : "post",
											data : formData,
											dataType : "text",
											processData : false,
											contentType : false,
											success : function(data) {
												var str = "";
												if (checkImageType(data)) {
													str = "<div><a target='_blank' href='displayfile?fileName="+ getImageLink(data)
																				+ "'><img src='displayfile?fileName="
																				+ data
																				+ "'/>"
																				+ getOriginalName(data)
																				+ "</a><small data-src='"+data+"'>X</small></div>";
																	} else {
																		str = "<div><a href='displayfile?fileName="
																				+ data
																				+ "'><img src='../resources/img/gagi.jpg' style='width:100px;height:100px;'/>"
																				+ getOriginalName(data)
																				+ "</a><small data-src='"+data+"'>X</small ></div>";
																	}
																	$(
																			".uploadedList")
																			.append(
																					str);
																}

															});
												}
											})
						});

		function getImageLink(fileName) {
			if (checkImageType(fileName)) {
				// "/년/월/일/" 제거
				var front = fileName.substring(0, 12);
				// "_s" 제거
				var end = fileName.substring(14);
				// 원본 이미지 파일명 반환
				return front + end;
			}
			return null;
		}

		function getOriginalName(fileName) {

			var originalName = "";
			if (checkImageType(fileName)) {
				var idx = fileName.indexOf("_", 14) + 1;
				originalName = fileName.substring(idx);
			} else {
				var idx = fileName.indexOf("_") + 1;
				originalName = fileName.substring(idx);
			}
			return originalName;
		}

		function checkImageType(fileName) {
			var pattern = /jpg|gif|png|jpeg/i;
			return fileName.match(pattern);
		}
	</script>
</body>

</html>