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
<form method="post" action="/test/update">

NUM: <input readonly type="number" name="num" value="${dto.num}"><br>
TNAME: <input required name="tname" value="${dto.tname}"><br>
<input type="submit">

</form>

</body>
</html>