<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="content" align="center">
		<div id="main" align="center">
			<div class="full_w">
				<c:choose>
				<c:when test="${type eq 'all'}">
					<h2>전 체 내 역</h2>
				</c:when>
				<c:when test="${type eq 'ex_ch'}">
					<h2>충 환 전 내 역</h2>
				</c:when>
				<c:when test="${type eq 'charge'}">
					<h2>충 전 내 역</h2>
				</c:when>
				<c:when test="${type eq 'exchange'}">
					<h2>환 전 내 역</h2>
				</c:when>
				<c:when test="${type eq 'betting'}">
					<h2>배 팅 내 역</h2>
				</c:when>
				
				</c:choose>
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
						<c:if test="${item.type eq 'charge' }">
							<td style="color: blue;">
								${item.id }
							</td>
							<td style="color: blue;">
								충전
							</td>
							<td style="color: blue;">
								${item.breakdown }
							</td>
							<td style="color: blue;">
								<fmt:formatDate value="${item.date }" pattern="yy년 MM월 dd일 hh시 mm분 ss초"/>
							</td>
						</c:if>
						<c:if test="${item.type eq 'exchange' }">
							<td style="color: red;">
								${item.id }
							</td>
							<td style="color: red;">
								환전
							</td>
							<td style="color: red;">
								-${item.breakdown }
							</td>
							<td style="color: red;">
								<fmt:formatDate value="${item.date }" pattern="yy년 MM월 dd일 hh시 mm분 ss초"/>
							</td>
						</c:if>
							<c:if test="${item.type eq 'lose' }">
							<td style="color: green;">
								${item.id }
							</td>
							<td style="color: green;">
								미당첨
							</td>
							<td style="color: green;">
								${item.breakdown }
							</td>
							<td style="color: green;">
								<fmt:formatDate value="${item.date }" pattern="yy년 MM월 dd일 hh시 mm분 ss초"/>
							</td>
						</c:if>
							<c:if test="${item.type eq 'win' }">
							<td style="color: orange;">
								${item.id }
							</td>
							<td style="color: orange;">
								당첨
							</td>
							<td style="color: orange;">
								-${item.breakdown }
							</td>
							<td style="color: orange;">
								<fmt:formatDate value="${item.date }" pattern="yy년 MM월 dd일 hh시 mm분 ss초"/>
							</td>
						</c:if>
						</tr>
					</c:forEach>
					</tbody>
				</table>
				
				
				<div class="entry">
					<div class="pagination">
					<c:forEach var="num" begin="1" end="${size }">
						<c:choose>
						<c:when test="${param.start eq null and num eq 1 }">
							<span>처음으로</span>
							<span class="active">${num }</span>
						</c:when>
						<c:when test="${num ne param.start }">
							<a href="/mgm01/game/betlist_inner?start=${num }&type=${type }"><b>${num }</b></a>
						</c:when>
					</c:choose>
					</c:forEach>
					</div>
					<table>
				<thead>
					<tr>
						<th scope="col">총 충전금액</th>
						<th scope="col">총 환전금액</th>
						<th scope="col">총 배팅금액</th>
						<th scope="col">총 당첨금액</th>
						<th scope="col">총 미당첨금액</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				</tbody>
		</table>
				
					<div class="sep"></div>		
				</div>
			</div>
		</div>
		
		
		<div class="clear"></div>
		</div>
</body>
</html>