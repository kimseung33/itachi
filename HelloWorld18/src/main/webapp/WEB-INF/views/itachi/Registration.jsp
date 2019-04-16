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
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">
<link rel="stylesheet" href="../resources/css/login.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.bundle.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"
	type="text/javascript"></script>
<script src="../../resources/js/upload.js"></script>
<style type="text/css">
.fileDrop {
	width: 80%;
	height: 150px;
	border: 1px dotted #a9a9a9;
	background-color: #e2e2e2;
	margin: auto;
}

ul li {
	list-style-type: none;
}
</style>
<title>Insert title here</title>
</head>
<body>

	<div class="container">
		<div class="row">
			<div class="card-main mx-auto">
				<div class="card card-signin my-5">
					<div class="card-body">
						<h3 class="card-title text-center">경매물품 등록하기</h3>
						<form class="form-signin" action="/board/registrationC"
							method="post">
							<div>
								<p>항목을 선택해주세여</p>
								<input type="radio" name="category" value="clothing">의류
								<input type="radio" name="category" value="beauty">뷰티
								<input type="radio" name="category" value="merchandise">잡화
								<input type="radio" name="category" value="appliances">가전제품
								<input type="radio" name="category" value="bookorticket">도서/티켓
							</div>
							<label for="mb_Id">ID</label> <input type="text" id="mb_Id"
								name="mb_Id" class="form-control" value="${write.mb_Id}"
								readonly="readonly"> <label for="title">제목</label> <input
								type="text" id="title" name="title" class="form-control"
								placeholder="제목" required autofocus> <label
								for="setence">내용</label> <input type="text" id="setence"
								name="setence" class="form-control" placeholder="내용" required
								autofocus>

							<!-- <label for="endDate">경매기간을 입력해주세여</label>
							<input type="text" id="endDate" name="endDate" class="form-control" placeholder="endDate" required autofocus>
							 -->
							<label for="deadline">경매기간</label> <select name="deadline"
								class="form-control">
								<option value="1">24시간</option>
								<option value="2">48시간</option>
								<option value="3">72시간</option>
								<option value="4">96시간</option>
								<option value="5">120시간</option>
							</select> <label for="startMoney">경매시작액</label> <input type="text"
								id="startMoney" name="startMoney" class="form-control"
								placeholder="경매시작액" required autofocus> <label
								for="directMoney">즉구가</label> <input type="text"
								id="directMoney" name="directMoney" class="form-control"
								placeholder="즉구가" required autofocus>

							<div class="from-group">
								<label>업로드할 파일을 올려주세요</label>
								<div class="fileDrop"></div>
							</div>

							<ul class="uploadedList clearfix">
							</ul>

							<button type="submit"
								class="btn btn-lg btn-primary btn-block text-uppercase">물품등록</button>
						</form>
					</div>
				</div>

			</div>
		</div>
	</div>


	<script id="source" type="text/x-handlebars-template">
      <li class="col-xs-3">
         <span>
            <img src="{{imgsrc}}">
         </span>
         <div>
            <a href="{{getLink}}">{{fileName}}</a>
            <a class="btn btn-danger btn-xs pull-right delbtn" href="{{fullName}}">
               <span class="glyphicon glyphicon-remove"></span>
            </a>
         </div>
      </li>
   </script>

	<script type="text/javascript">
	var source = $("#source").html();
    var template = Handlebars.compile(source);
		
    $(document).ready(function(){
	
    	$(".uploadedList").on("click",".delbtn",function(event) {
    		event.preventDefault();
			var $delbtn = $(this);
			var $delLi=$(this).parent("div").parent("li");
				$.ajax({
					url : "/deletefile",
					type : "post",
					data : {
						fileName : $delbtn.attr("href")
					},
					dataType : "text",
					success : function(result) {					
						$delLi.remove();
				}
			})
		})
    	  
    	  
         $(".fileDrop").on("dragenter dragover", function(event){
            event.preventDefault();
         });
         
         $(".fileDrop").on("drop", function(event){
            event.preventDefault();
            
            
            //여러개의 파일가져옴
            var files = event.originalEvent.dataTransfer.files;
            
            var file = files[0];
            
            var formData = new FormData();
            formData.append("file", file);
            
            $.ajax({
               url : "/uploadAjax",
               type : "post",
               data : formData,
               dataType : "text",
               processData : false,
               contentType : false,
               success : function(data){
                  var result = getFileInfo(data);
                  $(".uploadedList").append(template(result));
               }
            });
         });
         
         
         $("button[type='submit']").click(function(event) {
           /*  $("form").submit(); */
           event.preventDefault();
           var $form=$("form");
           var str="";
           $(".delbtn").each(function(index){
        	   str+="<input type='hidden' value='"+$(this).attr("href")+"' name='files["+index+"]'/>";         	   
           });
           $form.append(str);
           $form.get(0).submit();
         })
		      
		     
			});
</script>
</body>
</html>