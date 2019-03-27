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
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js" type="text/javascript"></script>
<script src="../../resources/js/upload.js"></script>
<style type="text/css">
   .fileDrop{
      width:80%;
      height:150px;
      border: 1px dotted #a9a9a9;
      background-color:#e2e2e2;
      margin:auto;
   }
   ul li{
      list-style-type:none;
   }
</style>
<title>Insert title here</title>
</head>
<body>
   <div class="container">
      <div class="row">
         <form action="/board/insert" method="post">

            <div class="form-group">
               <label for="title">제목</label> <input class="form-control"
                  id="title" name="title" required="required">
            </div>

            <div class="form-group">
               <label for="writer">작성자</label> <input class="form-control"
                  id="writer" name="writer" required="required">
            </div>

            <div class="form-group">
               <label for="content">내용</label>
               <textarea class="form-control" rows="3" id="content" name="content"
                  required="required"></textarea>
            </div>
         </form>
         <div class="form-group">
            <label>업로드할 파일을 올려주세요</label>
            <div class="fileDrop"></div>            
         </div>
         
         <ul class="uploadedList clearfix">
         </ul>
         
         
         <div class="form-group">
            <button class="btn btn-info" id = "g" type="submit">등록</button>
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
      
      $(document).ready(function() {
    	  
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