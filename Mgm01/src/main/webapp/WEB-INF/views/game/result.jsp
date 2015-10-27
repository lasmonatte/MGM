<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="/mgm01/resources/css/table-dark-styles.css" />
</head>

<body>
<div id="container" align="center">  
    <div class="transparency"> 	
    </div>  
    <div class="content">  
<c:if test="${gameResultDtoList ne null}">
	<h2>경 기 결 과 </h2>
	<table class="dark" width="80%" style="margin-top: 2%;">
	<thead>
		<tr >
			<th >
				<div>경기일시</div>
			</th>
			<th width="20%" >
				<div>회차</div>
			</th>
			<th width="10%">
				<div>홀/짝</div>
			</th>
			<th width="10%">
				<div>좌/우</div>
			</th>
			<th width="10%">
				<div>사다리 줄수</div>
			</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach var="gameResultDto" items="${gameResultDtoList }">
		<tr >
			<td >
				<div><fmt:formatDate pattern="yyyy년 MM월 dd일 HH시 mm분" value="${gameResultDto.date }"/></div>
			</td>
			<td >
				<div>${gameResultDto.ordernum }</div>
			</td>
			<td >
				<div>${gameResultDto.getOe() }</div>
			</td>
			<td >
				<div>${gameResultDto.getLr() }</div>
			</td>
			<td >
				<div>${gameResultDto.getLine() }</div>
			</td>
		</tr>	
		</c:forEach>
	</tbody>
	</table>	
	

</c:if>
</div>
</div>
</body>
</html>