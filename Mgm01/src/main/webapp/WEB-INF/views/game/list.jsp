<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="/mgm01/resources/tablecloth/tablecloth.css" rel="stylesheet" type="text/css" media="screen" />
<style>

a:VISITED, a:LINK {
	color: #C98500;
	text-decoration: none;
}
</style>

<script type="text/javascript">
	var isIn = ${isInner };
	var cash = ${cash };
	var prize_cash = 0;
	function showDetail(num) {
		var loc = "/board/detailPop.it?num=" + num;
		//	location.href=loc;
	}
	
	function reLoad(prize_cash){
		
		$.ajax({ // feed_num과 input으로 댓글작성하는 inner 작동.
		      method : 'POST', // post!
		      url : '/mgm01/user/updateCash', // url
		      data : { // 데이타!
				 cash : cash,
				 prize_cash : prize_cash,
				 isInner : isIn
		      },
		      success : function() { // 댓글작성이 성공하면
				   alert("수령에 성공하셨습니다.");
				   location.reload();
				   },
		      error :function() { // 댓글작성이 성공하면
				   alert("수령에 실패하셨습니다.");
				}
		   })
		   		   
	}
</script>
</head>
<body>
<div align="center">
<c:forEach var="item" items="${list }">
	<table class="table" >
		<thead>
			<tr>
				<th class="th" colspan="2"><span>${item.ordernum }회차</span></th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td class="td">배팅일시</td>
				<td class="td"><fmt:formatDate value="${item.date }" pattern="yy년 MM월 dd일 hh시 mm분"/></td>
			</tr>
			<c:if test="${item.betting_oe ne 'null' }">
				<tr>
					<td class="td">홀짝</td>
					<c:if test="${item.result_oe eq true  }">
						<td class="td">적중</td>
					</c:if>
					<c:if test="${item.result_oe eq false  }">
						<td class="td">실패</td>
					</c:if>
				<tr>
			</c:if>
			<c:if test="${item.betting_lr ne 'null' }">
				<tr>
					<td class="td">좌우</td>
					<c:if test="${item.result_lr eq true  }">
						<td class="td">적중</td>
					</c:if>
					<c:if test="${item.result_lr eq false  }">
						<td class="td">실패</td>
					</c:if>
				<tr>
			</c:if>
			<c:if test="${item.betting_line ne 'null' }">
				<tr>
					<td class="td">사다리수</td>
					<c:if test="${item.result_line eq true  }">
						<td class="td">적중</td>
					</c:if>
					<c:if test="${item.result_line eq false  }">
						<td class="td">실패</td>
					</c:if>
				<tr>
			</c:if>
			<tr>
				<td class="td">배팅액</td>
				<td class="td">${item.betting_money }</td>
			</tr>
			<tr>
				<td class="td">배당</td>
				<td class="td">${item.dividend }</td>
			</tr>
			<tr>
				<td class="td">당첨금</td>
				<td class="td">${item.prize_money }</td>
			</tr>
			<c:if test="${item.received eq 'N' }">
				<tr>
					<td class="td" colspan="2">
						<input type="button" value="당첨금을 받으세요" onclick="reLoad('${item.prize_money}')"/>
					</td>
				</tr>
			</c:if>
		</tbody>
	</table>

</c:forEach>

<!-- p=1 or p=2 이런식으로 갈수 있게 링크를 만들어두자. -->
<c:forEach var="num" begin="1" end="${size }">
	<c:choose>
		<c:when test="${param.start eq null and num eq 1 }">
			<b style="color: #FF5E00">${num }</b>
		</c:when>
		<c:when test="${num ne param.start }">
			<c:if test="${isInner eq true }">
				<a href="/mgm01/game/betlist_inner?start=${num }"><b>${num }</b></a>
			</c:if>
			<c:if test="${isInner eq false }">
				<a href="/mgm01/game/betlist?start=${num }"><b>${num }</b></a>
			</c:if>
		</c:when>
		<c:otherwise>
			<b style="color: #FF5E00">${num }</b>
		</c:otherwise>
	</c:choose>
</c:forEach>
</div>
</body>
</html>