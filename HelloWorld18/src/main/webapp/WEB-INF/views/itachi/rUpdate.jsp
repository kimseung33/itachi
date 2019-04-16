<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"  %>
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
						<h3 class="card-title text-center">경매물품 수정하기</h3>
						<form class="form-signin" action="/board/Rupdate" method="post">
							<p>
								<strong>카테고리 :
									<c:choose>
										<c:when test="${fn:substring(rid.productNumber, 0, 1) eq 'A'}">
											의류
										</c:when>
										<c:when test="${fn:substring(rid.productNumber, 0, 1) eq 'B'}">
											뷰티
										</c:when>
										<c:when test="${fn:substring(rid.productNumber, 0, 1) eq 'C'}">
											잡화
										</c:when>
										<c:when test="${fn:substring(rid.productNumber, 0, 1) eq 'D'}">
											가전(전자)제품
										</c:when>
										<c:when test="${fn:substring(rid.productNumber, 0, 1) eq 'E'}">
											도서/티켓
										</c:when>
										<c:otherwise>
											기타
										</c:otherwise>
									</c:choose>
								</strong>
							</p>
							<label for="mb_Id">ID</label> 
							<input type="text" id="mb_Id"	name="mb_Id" class="form-control" value="${rid.mb_Id}" readonly="readonly">
							 
							<label for="productNumber">상품번호</label> 
							<input type="text" id="productNumber"	name="productNumber" class="form-control" value="${rid.productNumber}" readonly="readonly"> 
							
							<label for="title">제목</label> 
							<input type="text" id="title" name="title" class="form-control"	value="${rid.title}" required autofocus> 
							
							<label for="setence">내용</label> 
							<input type="text" id="setence" name="setence" class="form-control" value="${rid.setence}" required autofocus>
											
							<label for="directMoney">즉구가</label> 
							<input type="text"	id="directMoney" name="directMoney" class="form-control" value="${rid.directMoney}" required autofocus>

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
    var productNumber="${rid.productNumber}";
    
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
		      
         getAllAttach(productNumber);
			});
    
    function getAllAttach(productNumber){
		$.getJSON("/board/getAttach/"+productNumber, function(data) {
			
			$(data).each(function(){
				var data2 = getFileInfo(this);
				$(".uploadedList").append(template(data2));
			});
			
		});
	}
</script>
</body>
</html>