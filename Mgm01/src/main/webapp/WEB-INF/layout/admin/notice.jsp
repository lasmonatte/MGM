<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="main" align="center">
			<div class="full_w">
				<h2>전 체 내 역</h2>
				
				<div class="entry">
					<div class="sep"></div>
				</div>
				<table>
					<thead>
						<tr>
							<th scope="col">아이디</th>
							<th scope="col">종류</th>
							<th scope="col">금액</th>
							<th scope="col">날짜</th>
						</tr>
					</thead>
						
					<tbody align="center">
					<c:forEach var="item" items="${list }">
						<tr>
						<td>
							${item.id }
						</td>
						<td>
							배팅당첨
						</td>
						<td>
							${item.breakdown }
						</td>
						<td>
							${item.date }
						</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
<c:forEach var="num" begin="1" end="${size }">
	<c:choose>
		<c:when test="${param.start eq null and num eq 1 }">
			<b style="color: #FF5E00">${num }</b>
		</c:when>
		<c:when test="${num ne param.start }">
				<a href="/mgm01/game/betlist_inner?start=${num }"><b>${num }</b></a>
		</c:when>
		<c:otherwise>
			<b style="color: #FF5E00">${num }</b>
		</c:otherwise>
	</c:choose>
</c:forEach>
</div>
</div>
</body>
</html>