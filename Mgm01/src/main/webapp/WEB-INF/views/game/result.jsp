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
<c:if test="${gameResultDtoList ne null}">
	<c:forEach var="gameResultDto" items="${gameResultDtoList }">
	<fmt:parseDate var="dateFmt" pattern="yyyy-MM-dd HH:mm:ss.SSS" value="${gameResultDto.date }"/>
	<fmt:formatDate var="dateTempParse" pattern="yyyy년 MM월 dd일 HH시 mm분" value="${dateFmt }"/>
	<table cellpadding="0" cellspacing="0" border="1px" width="90%" height="35" align="center"  >
	<tbody>
		<tr>
			<td>
				<div>경기일시</div>
			</td>
			<td>
				<div>회차</div>
			</td>
			<td>
				<div>홀/짝</div>
			</td>
			<td>
				<div>좌/우</div>
			</td>
			<td>
				<div>사다리 줄 수</div>
			</td>
		</tr>
		<tr>
			<td>
				<div>${dateTempParse }</div>
			</td>
			<td>
				<div>${gameResultDto.ordernum }</div>
			</td>
			<td>
				<div>${gameResultDto.getOe() }</div>
			</td>
			<td>
				<div>${gameResultDto.getLr() }</div>
			</td>
			<td>
				<div>${gameResultDto.getLine() }</div>
			</td>
		</tr>	
	</tbody>
	</table>	
	</c:forEach>

</c:if>

</body>
</html>