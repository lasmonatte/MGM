<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
게임결과
<c:if test="${gameDtoList ne null}">
<table>
<tbody>
	<c:forEach var="gameDto" begin="1" end="${gameDtoList.size()}">
		<tr>
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
				<div>${gameDto.getOrderNum() }</div>
			</td>
			<td>
				<div>${gameDto.getOE() }</div>
			</td>
			<td>
				<div>${gameDto.getLE() }</div>
			</td>
			<td>
				<div>${gameDto.getLine() }</div>
			</td>
		</tr>		
	</c:forEach>
</tbody>
</table>
</c:if>

</body>
</html>