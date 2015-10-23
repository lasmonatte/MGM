<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	function trade(t_num) { 
	
		$.ajax({ 
	      	method : 'POST',
		      url : '/mgm01/admin/trade',
		      data : {
	    	     t_num: t_num
		      },
	    	  success : function(msg) {
		    	  alert(msg);
				   location.reload();
				   },
		      error :function(msg) { 
	    	  		alert(msg);
				}
	   	})
}
	   
</script>
</head>
<body>
	<div id="content" align="center">
		<div id="main" align="center">
			<div class="full_w">
				<c:choose>
				<c:when test="${type eq 'charge'}">
					<h2>충 전 신 청</h2>
				</c:when>
				<c:when test="${type eq 'exchange'}">
					<h2>환 불 신 청</h2>
				</c:when>
				</c:choose>
				<div class="entry">
					<div class="sep"></div>
				</div>
				<table>
					<thead>
						<tr>
							<th scope="col">아이디</th>
							<th scope="col">이름</th>
							<th scope="col">은행명</th>
							<th scope="col">예금주</th>
							<th scope="col">계좌번호</th>
							<th scope="col">신청일자</th>
							<th scope="col">신청금액</th>
							<th scope="col">처리결과</th>
							<th scope="col">처리일자</th>
						</tr>
					</thead>
						
					<tbody align="center">
					<c:forEach var="item" items="${list }">
						<tr>
								<td style="color: red;">
									${item.id }
								</td>
								<td style="color: blue;">
									${item.name }
								</td>
								<td>
									${item.b_bankname }
								</td>
								<td>
									${item.b_username }
								</td>
								<td>
									${item.b_account }
								</td>
								<td>
									${item.date }
								</td>
								<td style="color: brown;">
									${item.amount }
								</td>
								<c:if test="${item.result eq false }">
									<td style="color: red;">
										처리중
									</td>
									<td>
										<input type="button" value="처리하기" onclick="trade(${item.t_num })" />
									</td>
								</c:if>
								<c:if test="${item.result eq true }">
									<td style="color: blue;">
										처리완료
									</td>
									<td>
										${item.result_date }
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
							<a href="/mgm01/admin/tradeInfo?start=${num }&type=${type }"><b>${num }</b></a>
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