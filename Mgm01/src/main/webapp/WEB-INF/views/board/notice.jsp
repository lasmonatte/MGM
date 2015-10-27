<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
	function showDetail(num) {
		var loc = "details?num=" + num;
		location.href=loc;

// 		window.open(loc, "dts", "parent=opener,width=400,height=600,", false);
		// 띄울 경로 , 윈도우 프레임이름, 기타옵션
	}
</script>
</head>
<body>
<div id="container" align="center">  
    <div class="transparency"> 	
     
    </div>  
    <div class="content">
    	<h2> 공 지 사 항 </h2>  
	<table class="dark" width="80%" style="margin-top:2%;">
	<thead>
		<tr >
			<th style="border-right:5px solid #1a1a1a;">번호</th>
			<th width="60%" style="border-right:5px solid #1a1a1a;">타이틀</th>
			<th style="border-right:5px solid #1a1a1a;">작성자</th>
			<th >등록일</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="item" items="${list }">
			<tr >
				<td style="border-right:5px solid #1a1a1a;">${item.board_num }</td>
				<td style="border-right:5px solid #1a1a1a;" class="title">
					<a href="javascript:showDetail('${item.board_num }')"> ${ item.title }</a>
				</td>
				<td style="border-right:5px solid #1a1a1a;">${item.nickname }</td>
				<td ><fmt:formatDate value="${item.date }"
						pattern="yyyy/MM/dd HH:mm " /></td>
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
			<a href="/mgm01/board/notice?start=${num }"><b>${num }</b></a>
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









