<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>글 자세히 보기</h1>
ID: ${dto.num}<br>
이름: ${dto.tname}<br>


<a href="/test/updateui?num=${dto.num}">수정</a><a href="/test/delete?num=${dto.num}">삭제</a><a href="/test/list">목록</a>



</body>
</html>