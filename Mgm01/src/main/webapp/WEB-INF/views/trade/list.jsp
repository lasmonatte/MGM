<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="/mgm01/resources/css/table-dark-styles.css" />
<style>
a:VISITED, a:LINK {
	color: #C98500;
	text-decoration: none;
}

a:HOVER {
	color: #FF5E00;
	text-decoration: none;
}

.title a:VISITED, a:LINK{
	color: #ffffff;
	text-decoration: none;
	
}
</style>
<script type="text/javascript">
	function reLoad(){
		location.reload();
	}
</script>
</head>
<body>
<div id="container" align="center">  
    <div class="transparency">  
    </div>  
    <div class="content">  
   <h2 style="color:#C98500;">충 환 전 기 록</h2>
	<table class="dark" width="80%" style="margin-top:2%;">
		<thead>
			<tr>
				<th >종류</th>
				<th >아이디</th>
				<th >신청자이름</th>
				<th >은행명</th>
				<th >예금주</th>
				<th >계좌번호</th>
				<th >신청날짜</th>
				<th >신청금액</th>
				<th >처리결과</th>
				<th >처리날짜</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach var="item" items="${list }">
			<tr >
				<c:if test="${item.type eq 'charge' }">
				<td style="color:orange">충전</td>
				</c:if>
				<c:if test="${item.type eq 'exchange' }">
				<td style="color:gray">환전</td>
				</c:if>
				<c:if test="${item.type eq 'charge' }">
				<td style="color:orange">${item.id }</td>
				<td style="color:orange">${item.name }</td>
				<td style="color:orange">${item.b_bankname }</td>
				<td style="color:orange">${item.b_username }</td>
				<td style="color:orange">${item.b_account }</td>
				</c:if>
				<c:if test="${item.type eq 'exchange' }">
				<td style="color:gray">${item.id }</td>
				<td style="color:gray">${item.name }</td>
				<td style="color:gray">${item.b_bankname }</td>
				<td style="color:gray">${item.b_username }</td>
				<td style="color:gray">${item.b_account }</td>
				</c:if>
				<td ><fmt:formatDate value="${item.date }" pattern="yy/MM/dd HH:mm:ss"/></td>
				<td style="color: gold;"><fmt:formatNumber value="${item.amount }" pattern="###,###,###,###,###,###,###" />원</td>
				<c:if test="${item.result_date eq null }">
					<td style="color:red;" >처리중</td>
				</c:if>
				<c:if test="${item.result_date ne null }">
					<td style="color:blue;">처리완료</td>
				</c:if>
				<td style="color:blue;">
				<c:if test="${item.result_date ne null }">
					<fmt:formatDate value="${item.result_date }" pattern="yy/MM/dd HH:mm:ss"/>
				</c:if>
				</td>
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
</div>
</body>
</html>