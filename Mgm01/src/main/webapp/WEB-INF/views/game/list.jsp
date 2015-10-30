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
</style>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
<script type="text/javascript">
	var isIn = ${isInner };
	var cash = ${cash };
	var prize_cash = 0;
	function showDetail(num) {
		var loc = "/board/detailPop.it?num=" + num;
		//	location.href=loc;
	}
	
	function updateCash(game_num, prize_money){

		alert(game_num + "/" + prize_money + " / " + cash);
		$.ajax({ // feed_num과 input으로 댓글작성하는 inner 작동.
		      method : 'POST', // post!
		      url : '/mgm01/user/updateCash', // url
		      data : { // 데이타!
		    	cash : cash,
				game_num : game_num,
				prize_money : prize_money
		      },
		      success : function(msg) { // 댓글작성이 성공하면
				   alert(msg);
				   location.reload();
				   },
		      error :function(msg) { // 댓글작성이 성공하면
				   alert("수령에 실패하셨습니다.");
				}
		   })
		   		   
	}
</script>
</head>
<body>
<div id="container" align="center">  
    <div class="transparency">  
    </div>  
    <div class="content">  
    <h2 style="color:#C98500;">배 팅 목 록 </h2>
	<table class="dark" id="betlist" width="90%" style="margin-top: 2%;">
		<thead>
			<tr>
				<th>배팅일시</th>
				<th>회차</th>
				<th>홀짝</th>
				<th>좌우</th>
				<th>사다리수</th>
				<th>배팅액</th>
				<th>배당</th>
				<th>당첨금</th>
				<c:if test="${item.received ne 'F' }">
				<th>당첨금 수령</th>
				</c:if>
				
			</tr>
			</thead>
			<tbody>
			<c:forEach var="item" items="${list }">
			<tr>
				<td>
					<fmt:formatDate value="${item.date }" pattern="yy년 MM월 dd일 hh시 mm분"/>
				</td>
				<c:if test="${item.ordernum eq 0}">
					<td>진행중</td>
				</c:if>
				<c:if test="${item.ordernum ne 0}">
					<td>${item.ordernum }회차</td>
				</c:if>
				<c:if test="${item.betting_oe ne null }">
					<c:if test="${item.result_oe eq true  }">
						<td style="color: blue;">적중</td>
					</c:if>
					<c:if test="${item.result_oe eq false  }">
						<td style="color: red;">실패</td>
					</c:if>
				</c:if>
				<c:if test="${item.betting_lr ne null }">
					<c:if test="${item.result_lr eq true  }">
						<td style="color: blue;">적중</td>
					</c:if>
					<c:if test="${item.result_lr eq false  }">
						<td style="color: red;">실패</td>
					</c:if>
				</c:if>
				<c:if test="${item.betting_line ne null }">
					<c:if test="${item.result_line eq true  }">
						<td style="color: blue;">적중</td>
					</c:if>
					<c:if test="${item.result_line eq false  }">
						<td style="color: red;">실패</td>
					</c:if>
				</c:if>
				<td >${item.betting_money }</td>
				<td >${item.dividend }</td>
				<c:if test="${item.prize_money ne 0 }">
					<td style="color:gold;">${item.prize_money }</td>
				</c:if>
				<c:if test="${item.prize_money eq 0 }">
					<td>${item.prize_money }</td>
				</c:if>
				<c:if test="${item.received eq 'N' }">
					<td>
						<input type="button" value="당첨금을 받으세요" onclick="updateCash('${item.game_num }', '${item.prize_money }')"/>
					</td>
				</c:if>
				<c:if test="${item.received eq 'Y' }">
					<td> 당첨금을 수령하셨습니다.	</td>
				</c:if>
				<c:if test="${item.received eq 'F' }">
					<td> - </td>
				</c:if>
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
</div>

</body>
</html>