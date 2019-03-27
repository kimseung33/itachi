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
<h1>회원 등록</h1>
<form method="post" action="/member/insert">
ID:<input name="id" type="number"><br>
name:<input name="name"><br>
age:<input name="age" tyep="number"><br>
<input type="submit" value="등록">
</form>


</body>
</html>