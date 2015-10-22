<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<script type="text/javascript">
		function userInfo(id){
			url = "/mgm01/admin/userInfo?id=" + id;
			var	openNewWindow = window.open("about:blank");
			openNewWindow.location.href = url;
		}
	</script>
	</head>
    <body>
	<div id="content" align="center">
	
		<div id="main" align="center">
			<div class="full_w">
				<h2>회 원 관 리</h2>
				<p>회원을 클릭하시면 해당 회원의 캐시내역을 볼 수 있습니다. </p>
				<!-- list로  all, charge, exchange, win, lose -->
				
				<div class="entry">
					<div class="sep"></div>
				</div>
				<table>
					<thead>
						<tr>
							<th scope="col">아이디</th>
							<th scope="col">이름</th>
							<th scope="col">닉네임</th>
							<th scope="col">전화번호</th>
							<th scope="col">보유금액</th>
							<th scope="col">은행명</th>
							<th scope="col">계좌번호</th>
							<th scope="col">예금주</th>
							<th scope="col">차단여부</th>
							<th scope="col">추천인</th>
							<th scope="col" style="width: 65px;">관리</th>
						</tr>
					</thead>
						
							
					<tbody align="center">
					<c:forEach var="item" items="${list }">
						<tr onclick="userInfo('${item.id}')" >
							<td>
								${item.id }
							</td>
							<td>
								${item.name }
							</td>
							<td>
								${item.nickname }
							</td>
							<td>
								${item.phone }
							</td>
							<td>
								${item.cash }
							</td>
							<td>
								${item.b_bankname }
							</td>
							<td>
								${item.b_account }
							</td>
							<td>
								${item.b_username }
							</td>
							<td>
								<c:if test="${item.enabled eq true }">
									허용
								</c:if>
								<c:if test="${item.enabled eq false }">
									차단
								</c:if>
							</td>
							<td>
								${item.recmd_id }
							</td>
							<td>
								<a href="'/mgm01/admin/userInfo?id=' + '${item.id }'" class="table-icon edit" title="배팅내역"></a>
								<a href="#" class="table-icon archive" title="캐쉬내역"></a>
								<a href="#" class="table-icon delete" title="차단하기"></a>
							</td>
							
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
							<a href="/mgm01/admin/cashInfo?start=${num }"><b>${num }</b></a>
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
<!-- 				p=1 or p=2 이런식으로 갈수 있게 링크를 만들어두자. -->
<%-- <c:forEach var="num" begin="1" end="${size }"> --%>
<%-- 	<c:choose> --%>
<%-- 		<c:when test="${param.start eq null and num eq 1 }"> --%>
<%-- 			<b style="color: #FF5E00">${num }</b> --%>
<%-- 		</c:when> --%>
<%-- 		<c:when test="${num ne param.start }"> --%>
<%-- 				<a href="/mgm01/game/betlist_inner?start=${num }"><b>${num }</b></a> --%>
<%-- 		</c:when> --%>
<%-- 		<c:otherwise> --%>
<%-- 			<b style="color: #FF5E00">${num }</b> --%>
<%-- 		</c:otherwise> --%>
<%-- 	</c:choose> --%>
<%-- </c:forEach> --%>
<!-- 				<div class="entry"> -->
<!-- 					<div class="pagination"> -->
<!-- 						<span>Â« First</span> -->
<!-- 						<span class="active">1</span> -->
<!-- 						<a href="">2</a> -->
<!-- 						<a href="">3</a> -->
<!-- 						<a href="">4</a> -->
<!-- 						<span>...</span> -->
<!-- 						<a href="">23</a> -->
<!-- 						<a href="">24</a> -->
<!-- 						<a href="">Last Â»</a> -->
<!-- 					</div> -->
<!-- 					<div class="sep"></div>		 -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 		<div class="clear"></div> -->
<!-- 	</div> -->
<!-- </body> -->
<!-- </html> -->