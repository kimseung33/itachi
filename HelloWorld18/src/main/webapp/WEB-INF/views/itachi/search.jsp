<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<title>Insert title here</title>
</head>
<body>

	<div class="container">
		<div class="row">
			<h1 class="text-center">검색 결과|${lsit}|</h1>
		</div>
	 </div>
	 
	 <div class="row">

			<table class="table table-hober">
				<thead>

					<tr>
						<th>파일이름</th>
						<th>작성자</th>						
						<th>제목</th>
					</tr>

				</thead>
				<tbody>
					<c:forEach var="src" items="${list}">
						<tr>
							<td>|${src.fileOriginame}|파일이름</td>
							<td>|${src.mb_Id}|작성자</td>
							<td>|${src.title}|제목</td>
						</tr>
					</c:forEach>

				</tbody>
			

			</table>
		</div>
<script type="text/javascript">
	$(document).ready(function() {
		
	});
</script>
</body>
</html>