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

<a href="/test/insertui">글쓰기</a><br>

<table>
<thead>
<tr>
<th>
번호
</th>
<th>
이름
</th>
<th>
등록일
</th>
</tr>
</thead>
<tbody>
<c:forEach var="list" items="${list}">
<tr>
<td>
${list.num}
</td>
<td><a href="/test/selectByNum?num=${list.num}">
${list.tname}</a>
</td>
<td>
${list.tday}
</td>
</tr>
</c:forEach>
</tbody>

</table>




</body>
</html>