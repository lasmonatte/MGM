<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
.tr1 {
	text-align: center;
	background-color: #FAF4C0;
}

.tr2 {
	background-color: #FAE0D4;
}

.th10 {
	text-align: center;
	width: 10%;
}

.th15 {
	text-align: center;
	width: 15%;
}

.th40 {
	text-align: center;
	width: 40%;
}

a:VISITED, a:LINK {
	color: #000000;
	text-decoration: none;
}

a:HOVER {
	color: #FF5E00;
	text-decoration: none;
}
</style>

</head>
<body>
<script type="text/javascript">
	function reLoad(){
		location.reload();
	}
</script>
<div align="center">
	<table border="1" >
		<thead>
			<tr>
				<td>종류</td>
				<td>아이디</td>
				<td>신청자이름</td>
				<td>은행명</td>
				<td>예금주</td>
				<td>계좌번호</td>
				<td>신청날짜</td>
				<td>신청금액</td>
				<td>처리결과</td>
				<td>처리날짜</td>
			</tr>
		</thead>
		<tbody>
		<c:forEach var="item" items="${list }">
			<tr>
				<td>${item.type }</td>
				<td>${item.id }</td>
				<td>${item.name }</td>
				<td>${item.b_bankname }</td>
				<td>${item.b_username }</td>
				<td>${item.b_account }</td>
				<td>${item.date }</td>
				<td>${item.amount }
				<td>${item.result }</td>
				<c:if test="${item.result_date eq null }">
					<td>처리중</td>
				</c:if>
				<c:if test="${item.result_date eq null }">
					<td>${item.result_date }</td>
				</c:if>
			</tr>
		</c:forEach>
		</tbody>
	</table>


<!-- p=1 or p=2 이런식으로 갈수 있게 링크를 만들어두자. -->
<c:forEach var="num" begin="1" end="${size }">
	<c:choose>
		<c:when test="${param.start eq null and num eq 1 }">
			<b style="color: #FF5E00">${num }</b>
		</c:when>
		<c:when test="${num ne param.start }">
				<a href="/mgm01/trade/list?start=${num }"><b>${num }</b></a>
		</c:when>
		<c:otherwise>
			<b style="color: #FF5E00">${num }</b>
		</c:otherwise>
	</c:choose>
</c:forEach>
</div>

</body>
</html>