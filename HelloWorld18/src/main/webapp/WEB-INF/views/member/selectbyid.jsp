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
<h1>회원 정보 자세히 보기</h1>
ID: ${dto.id}<br>
이름: ${dto.name}<br>
나이: ${dto.age}<br>
등록일: ${dto.regdate}<br>


<a href="/member/updateui?id=${dto.id}">수정</a> 
<a href="/member/delete?id=${dto.id}">삭제</a> 
<a href="/member/select">목록</a>



</body>
</html>