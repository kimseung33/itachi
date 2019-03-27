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
   ul.uploadedList{
      margin-bottom:50px;
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
         <form action="/board/update" method="post">
            <div class="form-group">
               <label>제목</label> <input class="form-control" id="title"
                  name="title" required="required" value="${vo.title }">
            </div>

            <div class="form-group">
               <label for="writer">작성자</label> <input class="form-control"
                  id="writer" name="writer" value="${vo.writer}" readonly="readonly">
            </div>

            <div class="form-group">
               <label for="content">내용</label>
               <textarea class="form-control" rows="3" id="content" name="content"
                  required="required">${vo.content}</textarea>
            </div>

            <input type="hidden" name="bno" value="${vo.bno}"> 
            <input type="hidden" value="${cri.page}" name="page"> 
            <input type="hidden" value="${cri.perPage}" name="perPage">

         </form>
         
         <div class="form-group">
            <label>업로드할 파일을 올려주세요</label>
            <div class="fileDrop"></div>            
         </div>
         
         <ul class="uploadedList clearfix">
         </ul>
         <div class="form-group">
            <button class="btn btn-info" type="submit">수정</button>
         </div>
      </div>
   </div>
   <script id="source" type="text/x-handlebars-template">
      <li class="col-xs-3">
         <span>
            <img src="{{imgsrc}}" style="width:100px;hegith:100px;">
         </span>
         <div>
            <a href="{{getLink}}">{{fileName}}</a>
            <a class="btn btn-danger btn-xs pull-right delbtn" href="{{fullName}}">
               <span class="glyphicon glyphicon-remove btn_remove"></span>
            </a>
         </div>
      </li>
   </script>
   <script type="text/javascript">
      var bno = ${vo.bno};
      var source = $("#source").html();
      var template = Handlebars.compile(source);
      
      $(document).ready(function() {
    	  
    	  
    	  
         $(".fileDrop").on("dragenter dragover", function(event){
            event.preventDefault();
         });
         
         $(".fileDrop").on("drop", function(event){
            event.preventDefault();
            
            //여러개의 파일가져옴
            var files = event.originalEvent.dataTransfer.files;
            
            //for(var i=0; i<files.length; i++){
               //var file = files[i];
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
            //}
         });
         $(".uploadedList").on("click", ".delbtn", function(event){
            event.preventDefault();
            var $that = $(this);
            
            $.ajax({
               url:"/board/deletefile",
               type:"post",
               data:{
                  fileName:$that.attr("href"),
                  bno:bno
               },
               dataType:"text",
               success:function(data){
                  alert("삭제되었습니다.");
                  $that.parent("div").parent("li").remove();
               }
            });
            
         });
         $("button[type='submit']").click(function(event) {
            event.preventDefault();
            var $form = $("form");
            var str = "";
            
            $(".delbtn").each(function(index){
               str += "<input type='hidden' name='files["+index+"]' value='" + $(this).attr("href")+"'>";
            });
            
            $form.append(str).attr("action","update").attr("method","post");          
            $form.get(0).submit();
         });
         
         getAllAttach(bno);
      });
      function getAllAttach(bno){
         $.getJSON("/board/getAttach/"+bno, function(data) {
            
            $(data).each(function(){
               var data2 = getFileInfo(this);
               $(".uploadedList").append(template(data2));
            });
            
         });
      }
   </script>
</body>
</html>