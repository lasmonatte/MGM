<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	function check(admin_num){
		if(confirm("해당 총판을 삭제하시겠습니까?")){
			location.href("/mgm01/admin/deleteAdmin?admin_num="+admin_num);
			alert("삭제되었습니다.");
		}
	}
</script>
</head>
<body>
<div id="content" align="center">
	
		<div id="main" align="center">
			<div class="full_w">
				<h2>전 체 현 황</h2>
				<!-- list로  all, charge, exchange, win, lose -->
				<div class="entry">
					<div class="sep"></div>
				</div>
				<table>
					<thead>
						<tr>
							<th scope="col">아이디</th>
							<th scope="col">총액</th>
							<th scope="col">충전총액</th>
							<th scope="col">환전총액</th>
							<th scope="col">배팅총액</th>
							<th scope="col">당첨총액</th>
							<th scope="col">유저수</th>
							<th scope="col">적립총액</th>
						</tr>
					</thead>
					<tbody align="center">
					<c:forEach var="item" items="${list }">
					<c:if test="${item.id ne 'aa00' }">
						<tr>
							<td>
								${item.id }
							</td>
							<td>
								${item.total_cash }
							</td>
							<td style="color: blue;">
								${item.total_charge }
							</td>
							<td style="color: red;">
								- ${item.total_exchange }
							</td>
							<td>
								${item.total_betting }
							</td>
							<td>
								${item.total_win }
							</td>
							<td>
								${item.total_user }
							</td>
							<td>
								${item.total_salary }
							</td>
						</tr>
					</c:if>
					</c:forEach>
						<tr style="background: #DDDDDD;">
							<th scope="col">총계</th>
							<td>
								${total.total_cash }
							</td>
							<td style="color: blue;">
								${total.total_charge }
							</td>
							<td style="color: red;">
								- ${total.total_exchange }
							</td>
							<td>
								${total.total_betting }
							</td>
							<td>
								${total.total_win }
							</td>
							<td>
								${total.total_user }
							</td>
							<td>
								${total.total_salary }
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
							<a href="/mgm01/admin/AdminInfo?start=${num }&type=${type }"><b>${num }</b></a>
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