<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
	<div id="content" align="center">
		<div id="main" align="center">
			<div class="full_w">
				<c:if test="${type eq 'notice' }">
					<h2>공 지 사 항</h2>
				</c:if>
				<c:if test="${type eq 'customer' }">
					<h2>고 객 센 터</h2>
				</c:if>
				<div class="entry">
					<div class="sep"></div>
				</div>
				<table>
					<thead>				
						<tr>
							<th scope="col">번호</th>
							<th scope="col">타이틀</th>
							<th scope="col">작성자</th>
							<th scope="col">등록일</th>
						</tr>
					</thead>
					<tbody align="center">
					<c:forEach var="item" items="${list }">
						<tr onclick="showDetail(${item.board_num })">
							<td>
								${item.board_num }
							</td>
							<td>
								${item.title }
							</td>
							<td>
								${item.nickname }
							</td>
							<td>
								<fmt:formatDate value="${item.date }" pattern="yyyy/MM/dd HH:mm " />
							</td>
						</tr>
					</c:forEach>
					<tr>
			<td colspan="4" align="center">
				<form action="write" method="GET">
					<input type="hidden" name="type" value="notice"/>
					<input type="submit" value="글쓰기"/>				
				</form>
			</td>
		</tr>
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
							<a href="/mgm01/admin/board?start=${num }&type=${type }"><b>${num }</b></a>
						</c:when>
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