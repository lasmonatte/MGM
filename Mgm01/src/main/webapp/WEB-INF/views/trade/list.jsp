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
	<table class="table" >
		<thead>
			<tr>
				<th class="th">종류</th>
				<th class="th">아이디</th>
				<th class="th">신청자이름</th>
				<th class="th">은행명</th>
				<th class="th">예금주</th>
				<th class="th">계좌번호</th>
				<th class="th">신청날짜</th>
				<th class="th">신청금액</th>
				<th class="th">처리결과</th>
				<th class="th">처리날짜</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach var="item" items="${list }">
			<tr class="tr">
				<td class="td">
				<c:if test="${item.type eq 'charge' }">
					충전
				</c:if>
				<c:if test="${item.type eq 'exchange' }">
					환전
				</c:if>
				</td>
				<td class="td">${item.id }</td>
				<td class="td">${item.name }</td>
				<td class="td">${item.b_bankname }</td>
				<td class="td">${item.b_username }</td>
				<td class="td">${item.b_account }</td>
				<td class="td">${item.date }</td>
				<td class="td">${item.amount }</td>
				<c:if test="${item.result_date eq null }">
					<td class="td">처리중</td>
				</c:if>
				<c:if test="${item.result_date ne null }">
					<td class="td">처리완료</td>
				</c:if>
				<td class="td">${item.result_date }</td>
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