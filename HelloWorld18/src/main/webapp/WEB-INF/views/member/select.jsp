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

<a href="/member/insertui">회원 등록</a><br>




<table>
<thead>
<tr>
<th>
ID
</th>
<th>
NAME
</th>
<th>
AGE
</th>
<th>
등록일
</th>
</tr>
</thead>
<tbody>

<c:forEach var="dto" items="${list}">
<tr>
<td>
${dto.id}
</td>
<td><a href="/member/selectbyid?id=${dto.id}">
${dto.name}
</a>
</td>
<td>
${dto.age}
</td>
<td>
${dto.regdate}
</td>
</tr>

</c:forEach>

 
</tbody>


</table>

</body>
</html>