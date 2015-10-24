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
						<h2>배 팅 내 역</h2>
					</c:when>
					<c:when test="${type eq 'win'}">
						<h2>적 중 내 역</h2>
					</c:when>
				</c:choose>
				<div class="entry">
					<div class="sep"></div>
				</div>
				<table>
					<thead>
						<tr>
							<th scope="col">아이디</th>
							<th scope="col">날짜</th>
							<th scope="col">회차</th>
							<th scope="col">배팅금액</th>
							<th scope="col">배당</th>
							<th scope="col">예상금액</th>
							<th scope="col">적중금액</th>
							<th scope="col">좌우</th>
							<th scope="col">홀짝</th>
							<th scope="col">사다리수</th>
							<th scope="col">당첨여부</th>
							<th scope="col">수령여부</th>
						</tr>
					</thead>
						
					<tbody align="center">
					<c:forEach var="item" items="${list }">
						<c:if test="${type eq 'all' }">
						<tr>
							<td style="color: navy;">
								${item.id }
							</td>
							<td>
								<fmt:formatDate value="${item.date }" pattern="yy년 MM월 dd일"/>
							</td>
							<td>
								${item.ordernum }회차							
							</td>
							<td>
								${item.betting_money }
							</td>
							<td>
								${item.dividend }
							</td>
							<td>
								${item.expect_money }
							</td>
							<td style="color: brown;">
								${item.prize_money }
							</td>
							<c:choose>
							<c:when test="${item.result_oe eq true}">
								<td style="color: skyblue;">
									당첨
								</td>
							</c:when>
							<c:when test="${item.result_oe eq false}">
								<td style="color: orange;">
									미당첨
								</td>
							</c:when>
							</c:choose>
							<c:choose>
							<c:when test="${item.result_lr eq true}">
								<td style="color: skyblue;">
									당첨
								</td>
							</c:when>
							<c:when test="${item.result_lr eq false}">
								<td style="color: orange;">
									미당첨
								</td>
							</c:when>
							</c:choose>
							<c:choose>
							<c:when test="${item.result_line eq true}">
								<td style="color: skyblue;">
									당첨
								</td>
							</c:when>
							<c:when test="${item.result_line eq false}">
								<td style="color: orange;">
									미당첨
								</td>
							</c:when>
							</c:choose>
							<c:choose>
								<c:when test="${item.received ne 'F'}">
									<td style="color: blue;">
										당첨
									</td>
								</c:when>
								<c:otherwise>
									<td style="color: red;">
										미당첨
									</td>
								</c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${item.received eq 'Y'}">
									<td style="color: green;">
										수령
									</td>
								</c:when>
								<c:when test="${item.received eq 'N'}">
									<td style="color: orange;">
										미수령
									</td>
								</c:when>
								<c:otherwise>
									<td>
										미당첨
									</td>
								</c:otherwise>
							</c:choose>							
						</tr>
						</c:if>
						<c:if test="${type eq 'win' }">
						<c:if test="${item.received ne 'F' }">
						<tr>
							<td style="color: navy;">
								${item.id }
							</td>
							<td>
								<fmt:formatDate value="${item.date }" pattern="yy년 MM월 dd일"/>
							</td>
							<td>
								${item.ordernum }회차							
							</td>
							<td>
								${item.betting_money }
							</td>
							<td>
								${item.dividend }
							</td>
							<td>
								${item.expect_money }
							</td>
							<td style="color: brown;">
								${item.prize_money }
							</td>
							<c:choose>
							<c:when test="${item.result_oe eq true}">
								<td style="color: skyblue;">
									당첨
								</td>
							</c:when>
							<c:when test="${item.result_oe eq false}">
								<td style="color: orange;">
									미당첨
								</td>
							</c:when>
							</c:choose>
							<c:choose>
							<c:when test="${item.result_lr eq true}">
								<td style="color: skyblue;">
									당첨
								</td>
							</c:when>
							<c:when test="${item.result_lr eq false}">
								<td style="color: orange;">
									미당첨
								</td>
							</c:when>
							</c:choose>
							<c:choose>
							<c:when test="${item.result_line eq true}">
								<td style="color: skyblue;">
									당첨
								</td>
							</c:when>
							<c:when test="${item.result_line eq false}">
								<td style="color: orange;">
									미당첨
								</td>
							</c:when>
							</c:choose>
							<c:choose>
								<c:when test="${item.received ne 'F'}">
									<td style="color: blue;">
										당첨
									</td>
								</c:when>
								<c:otherwise>
									<td style="color: red;">
										미당첨
									</td>
								</c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${item.received eq 'Y'}">
									<td style="color: green;">
										수령
									</td>
								</c:when>
								<c:when test="${item.received eq 'N'}">
									<td style="color: orange;">
										미수령
									</td>
								</c:when>
								<c:otherwise>
									<td>
										미당첨
									</td>
								</c:otherwise>
							</c:choose>							
						</tr>
						</c:if>
						</c:if>
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
							<a href="/mgm01/admin/bettingList?start=${num }&type=${type }"><b>${num }</b></a>
						</c:when>
						<c:otherwise>
							<span class="active">${num }</span>
						</c:otherwise>
					</c:choose>
					</c:forEach>
					</div>
					<div class="sep"></div>		
				</div>
			</div>
		</div>
		<div class="clear"></div>
		</div>
</body>
</html>