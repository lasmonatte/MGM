<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

</head>
<body>
게임결과
<div align="center">
<c:if test="${gameResultDtoList ne null}">
	<c:forEach var="gameResultDto" items="${gameResultDtoList }">
	<table class="table">
	<thead>
		<tr class="tr">
			<th class="th">
				<div>경기일시</div>
			</th>
			<th class="th">
				<div>회차</div>
			</th>
			<th class="th">
				<div>홀/짝</div>
			</th>
			<th class="th">
				<div>좌/우</div>
			</th>
			<th class="th">
				<div>사다리 줄 수</div>
			</th>
		</tr>
	</thead>
	<tbody>
		<tr class="tr">
			<td class="td">
				<div><fmt:formatDate pattern="yyyy년 MM월 dd일 HH시 mm분" value="${gameResultDto.date }"/></div>
			</td>
			<td class="td">
				<div>${gameResultDto.ordernum }</div>
			</td>
			<td class="td">
				<div>${gameResultDto.getOe() }</div>
			</td>
			<td class="td">
				<div>${gameResultDto.getLr() }</div>
			</td>
			<td class="td">
				<div>${gameResultDto.getLine() }</div>
			</td>
		</tr>	
	</tbody>
	</table>	
	</c:forEach>

</c:if>
</div>
</body>
</html>