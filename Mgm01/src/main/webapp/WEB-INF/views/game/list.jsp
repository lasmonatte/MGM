<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
.tr1 {
	text-align: center;
	background-color: #FAF4C0;
}

.tr2 {
	background-color: #FAE0D4;
}

.th10 {
	text-align: center;
	width: 10%;
}

.th15 {
	text-align: center;
	width: 15%;
}

.th40 {
	text-align: center;
	width: 40%;
}

a:VISITED, a:LINK {
	color: #000000;
	text-decoration: none;
}

a:HOVER {
	color: #FF5E00;
	text-decoration: none;
}
</style>

<script type="text/javascript">
	var isIn = ${isInner };
	var cash = ${cash };
	function showDetail(num) {
		var loc = "/board/detailPop.it?num=" + num;
		//	location.href=loc;
	}
	
	function reLoad(prize_cash){
		var new_cash = cash+prize_cash;
		var url;
		if(isIn)
			url = "/mgm01/game/betlist_inner";
		else
			url = "/mgm01/game/betlist"
		$.ajax({ // feed_num과 input으로 댓글작성하는 inner 작동.
		      method : 'POST', // post!
		      url : '/mgm01/game/betlist', // url
		      data : { // 데이타!
				 new_cash : new_cash
		      },
		      success : function() { // 댓글작성이 성공하면
				   alert("배팅에 성공하셨습니다.");
				   location.reload();
				   },
		      error :function() { // 댓글작성이 성공하면
				   alert("배팅에 실패하셨습니다.");
				}
		   })
		   		   
	}
</script>
<div align="center">
<c:forEach var="item" items="${list }">
	<table border="1" >
		<thead>
			<tr>
				<td colspan="2"><span>${item.ordernum }회차</span></td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>배팅일시</td>
				<td><fmt:formatDate value="${item.date }" pattern="yy년 MM월 dd일 hh시 mm분"/></td>
			</tr>
			<c:if test="${item.betting_oe ne 'null' }">
				<tr>
					<td>홀짝</td>
					<c:if test="${item.result_oe eq true  }">
						<td>적중</td>
					</c:if>
					<c:if test="${item.result_oe eq false  }">
						<td>실패</td>
					</c:if>
				<tr>
			</c:if>
			<c:if test="${item.betting_lr ne 'null' }">
				<tr>
					<td>좌우</td>
					<c:if test="${item.result_lr eq true  }">
						<td>적중</td>
					</c:if>
					<c:if test="${item.result_lr eq false  }">
						<td>실패</td>
					</c:if>
				<tr>
			</c:if>
			<c:if test="${item.betting_line ne 'null' }">
				<tr>
					<td>사다리수</td>
					<c:if test="${item.result_line eq true  }">
						<td>적중</td>
					</c:if>
					<c:if test="${item.result_line eq false  }">
						<td>실패</td>
					</c:if>
				<tr>
			</c:if>
			<tr>
				<td>배팅액:${item.betting_money }</td>
			</tr>
			<tr>
				<td>배당:${item.dividend }</td>
			</tr>
			<tr>
				<td>당첨금:${item.prize_money }</td>
			</tr>
			<c:if test="${item.received eq 'N' }">
				<tr>
					<td><input type="button" value="당첨금을 받으세요" onclick="reLoad('${item.prize_money}')"/></td>
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
