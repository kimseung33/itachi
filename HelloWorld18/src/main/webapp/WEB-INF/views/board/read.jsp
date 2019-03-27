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
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script src="../../resources/js/upload.js"></script>
<style type="text/css">
.uploadedList{
list-style: none;
margin-bottom: 50px;

}

</style>
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
				<label>첨부파일</label>
				<ul class="uploadedList clearifx">
					
				</ul>			
			</div>

			<div class="form-group">
				<button id="update" class="btn btn-warning">수정</button>
				<button id="delete" class="btn btn-danger">삭제</button>
				<button id="list" class="btn btn-info">목록</button>
				<button id="reply" class="btn btn-primary">댓글</button>
			</div>
		</div>

<!-- 		<div class="row">
			<input type="number" id="inputID">
			<button id="inputCheckBtn">rno체크</button>
			<p id="msgforuse"></p>
		</div>

		<div class="row">
			<input type="number" id="inputID2">
			<button id="inputCheckBtn2">rno체크</button>
			<p id="msgforuse2"></p>
		</div>
 -->

		<div class="row">
			<div id="myCollapsible" class="collapse">
				<div class="form-group">
					<label for="replyer">작성자</label> <input class="form-control"
						id="replyer">
				</div>


				<div class="form-group">
					<label for="replyText">내용</label> <input class="form-control"
						id="replyText">
				</div>

				<div class="form-group">
					<button id="replyInsertBtn" class="btn btn-success">등록</button>
					<button id="replyResetBtn" class="btn btn-default">초기화</button>
				</div>


			</div>
		</div>


		<div class="row" id="replies"></div>
		<div class="row">
			<ul class="pagination"></ul>
		</div>


	</div>

	<div class="row">
		<div id="myModal" class="modal fade">
			<div class="modal-dialog">
				<div class="modal-header">
					<button data-dismiss="modal" class="close">&times;</button>
					<p id="modal_rno"></p>
				</div>
				<div class="modal-body">
					<input id="modal_replyText" class="form-control">
				</div>
				<div class="modal-footer">
					<button id="modal_update" data-dismiss="modal" class="btn btn-xs">수정</button>
					<button id="modal_delete" data-dismiss="modal" class="btn btn-xs">삭제</button>
					<button id="modal_close" data-dismiss="modal" class="btn btn-xs">닫기</button>
				</div>
			</div>
		</div>
	</div>



	<!-- 클래스 컨테이너 div 엔드태그 -->

	<form>
		<input value="${vo.bno}" name="bno" type="hidden"> <input
			value="${cri.page}" name="page" type="hidden"> <input
			value="${cri.perPage}" name="perpage" type="hidden">
	</form>
	<!-- 	여러개일경우를 대비해서 이렇게 만들엇쪄 -->
<script id="sourceAttach" type="text/x-handlebars-template">
	<li class="col-xs-3 pull-reft">
		<span>
			<img src="{{imgsrc}}">
		</span>
		<div>
			<a href="{{getLink}}" target={{target}}>{{fileName}}</a>
		</div>
	</li>				
</script>


	<script id="source" type="text/x-handlebars-template">
{{#each.}}
	<div class="panel panel-info">
			
			<div class="panel-heading">
			<span> rno : {{rno}}, 작성자: {{replyer}}</span>
			<span class="pull-right">{{updateDate}}</span>
			</div>
			
			<div class="panel-body">
			<p>{{replyText}}</p>
			<button data-replyText="{{replyText}}" data-rno="{{rno}}"class="callModal btn btn-sm btn-success">수정/삭제</button>
			</div>
		</div>

{{/each}}
</script>


	<script type="text/javascript">
		$(document).ready(
				function() {

					var page = 1;
					var bno = ${vo.bno};

					$("#inputCheckBtn2").click(	function() {
						var inputID2 = $("#inputID2").val();
							$.getJSON("/replies/checkid2/" + inputID2,function(data) {
								$("#msgforuse2").text(data.msg);
								});
							});

					$("#inputCheckBtn").click(function() {
						var inputID = $("#inputID").val();
							$.getJSON("/replies/checkid/" + inputID,function(data) {
								if (data) {
									$("#msgforuse").text("사용가능");
								} else {
									$("#msgforuse").text("사용불가");
								}
							});
						});

					$(".pagination").on("click", "li a", function(event) {
						event.preventDefault();
						page = $(this).attr("href");
						getList(bno, page);
					});

					$("#replies").on("click", ".callModal", function() {

						var rno = $(this).attr("data-rno");
						var replyText = $(this).attr("data-replyText");

						$("#modal_rno").text(rno);
						$("#modal_replyText").val(replyText);

						$("#myModal").modal("show");
					});

					$("#modal_update").click(
							function() {
								var rno = $("#modal_rno").text();
								var replyText = $("#modal_replyText").val();
								$.ajax({
									type : "put",
									url : "/replies/" + rno,
									headers : {
										"Content-Type" : "application/json",
										"X-HTTP-Method-Override" : "PUT"
									},
									data : JSON.stringify({
										replyText : replyText
									}),
									dataType : "text",
									success : function() {

									},
									error : function(request, status, error) {
										alert("fail");
										alert("code:" + request.status + "\n"
												+ "msg:" + request.reponseText
												+ "\n" + "error:" + error)
									},
									complete : function() {
										getList(bno, page);
									}
								})
							});

					$("#modal_delete").click(
							function() {
								var rno = $("#modal_rno").text();
								$.ajax({
									type : "delete",
									url : "/replies/" + rno,
									headers : {
										"Content-Type" : "application/json",
										"X-HTTP-Method-Override" : "DELETE"
									},
									data : JSON.stringify({
										replyText : replyText
									}),
									dataType : "text",
									success : function() {

									},
									error : function(request, status, error) {
										alert("fail");
										alert("code:" + request.status + "\n"
												+ "msg:" + request.reponseText
												+ "\n" + "error:" + error)
									},
									complete : function() {
										getList(bno, page);
									}
								})
							});

					$("#reply").click(function() {
						$("#myCollapsible").collapse("toggle");
					});

					$("#replyInsertBtn").click(
							function() {
								var replyer = $("#replyer").val();
								var replyText = $("#replyText").val();

								$.ajax({
									type : 'post',
									url : '/replies',
									headers : {
										"Content-Type" : "application/json",
										"X-HTTP-Method-Override" : "POST"
									},
									data : JSON.stringify({
										replyer : replyer,
										replyText : replyText,
										bno : bno
									}),
									dataType : "text",
									success : function(result) {
										alert(result);
										$("#replyer").val("");
										$("#replyText").val("");
										$("#myCollapsible").collapse("toggle");
										getList(bno, page);

									},
									error : function(request, status, error) {
										alert("code:" + request.status + "\n"
												+ "msg:" + request.responseText
												+ "\n" + "error:" + error);
									},
									complete : function() {

									}
								});

							});

					$("#update").click(function() {
						$("form").attr("action", "updateui");
						$("form").attr("method", "get");
						$("form").submit();
					});

					$("#delete").click(function() {
						$("form").attr("action", "delete");
						$("form").attr("method", "get");
						$("form").submit();
					});
					$("#list").click(function() {
						$("form").attr("action", "list");
						$("form").attr("method", "get");
						$("form").submit();
					});

					getList(bno, page);
					getAllAttach(bno);

				});
		function getAllAttach(bno){
			$.getJSON("/board/getAttach/"+bno, function(result){
				var source=$("#sourceAttach").html();
				var template=Handlebars.compile(source);
				$(result).each(function(){
					var data=getFileInfo(this);
					$(".uploadedList").append(template(data));
				});
			});
		}

		function printPaging(pm) {
			var str = "";
			if (pm.cri.page > 1) {
				str += "<li><a href='" + (pm.cri.page - 1)
						+ "'>&laquo;</a></li>";
			}
			for (var i = pm.beginPageNum; i <= pm.stopPageNum; i++) {
				var strClass = pm.cri.page == i ? 'active' : '';
				str += "<li class='"+strClass+"'><a href='"+i+"'>" + i
						+ "</a></li>";
			}
			if (pm.cri.page < pm.totalPage) {
				str += "<li><a href='" + (pm.cri.page + 1)
						+ "'>&raquo;</a></li>";
			}
			$(".pagination").html(str);

		}

		function getList(bno, page) {
			$.getJSON("/replies/" + bno + "/" + page, function(data) {
				var source = $("#source").html();
				var template = Handlebars.compile(source);
				var gab = data.list;

				$("#replies").html(template(gab));
				printPaging(data.pm);

			});
		}
	</script>

</body>
</html>