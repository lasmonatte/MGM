<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
a:VISITED, a:LINK {
	color: #C98500;
	text-decoration: none;
}

a:HOVER {
	color: #FF5E00;
	text-decoration: none;
}
</style>

<script type="text/javascript">
	function showDetail(num) {
		var loc = "details?num=" + num;
		location.href=loc;

// 		window.open(loc, "dts", "parent=opener,width=400,height=600,", false);
		// 띄울 경로 , 윈도우 프레임이름, 기타옵션
	}
</script>
</head>
<body>
<div align="center">
<table class="table">
	<thead>
		<tr class="tr">
			<th class="th">번호</th>
			<th class="th">타이틀</th>
			<th class="th">작성자</th>
			<th class="th">등록일</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="item" items="${list }">
			<tr class="tr">
				<td class="td">${item.board_num }</td>
				<td class="td"><a href="javascript:showDetail('${item.board_num }')"> ${ item.title }
				</a></td>
				<td class="td">${item.nickname }</td>
				<td class="td"><fmt:formatDate value="${item.date }"
						pattern="yyyy/MM/dd HH:mm " /></td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="4" align="center">
				<form action="write" method="GET">
					<input type="hidden" name="type" value="customer"/>
					<input type="submit" value="글쓰기"/>				
				</form>
			</td>
		</tr>
	</tbody>
</table>
<!-- p=1 or p=2 이런식으로 갈수 있게 링크를 만들어두자. -->
<c:forEach var="num" begin="1" end="${size }">
	<c:choose>
		<c:when test="${param.start eq null and num eq 1 }">
			<b style="color: #FF5E00">${num }</b>
		</c:when>
		<c:when test="${num ne param.start }">
			<a href="/mgm01/board/customer?start=${num }"><b>${num }</b></a>
		</c:when>
		<c:otherwise>
			<b style="color: #FF5E00">${num }</b>
		</c:otherwise>
	</c:choose>
</c:forEach>
</div>
</body>
</html>









