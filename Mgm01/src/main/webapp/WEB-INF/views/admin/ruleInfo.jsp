<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
function update(type){
	if(type=="BettingRule"){
		$("#dividend_oe").empty();
		$("#dividend_oe").append("<input type='text' value='${bettingRuleDto.dividend_oe }'"
				+ "name='dividend_oe' pattern='[0-9]{1}.[0-9]{1,2}' title='X.XX 혹은 X.X' />");
		$("#dividend_lr").empty();
		$("#dividend_lr").append("<input type='text' value='${bettingRuleDto.dividend_lr }'"
				+ "name='dividend_lr' pattern='[0-9]{1}.[0-9]{1,2}' title='X.XX 혹은 X.X' />")
		$("#dividend_line").empty();
		$("#dividend_line").append("<input type='text' value='${bettingRuleDto.dividend_line }'"
				+ "name='dividend_line' pattern='[0-9]{1}.[0-9]{1,2}' title='X.XX 혹은 X.X' />")
		$("#betting_max").empty();
		$("#betting_max").append("<input type='text' value='${bettingRuleDto.betting_max }'"
				+ "name='betting_max' pattern='[0-9]{5,}' title='숫자만입력하세요' />")
		$("#betting_min").empty();
		$("#betting_min").append("<input type='text' value='${bettingRuleDto.betting_min }'"
				+ "name='betting_min' pattern='[0-9]{5,}' title='숫자만입력하세요' />")
		$("#tax").empty();
		$("#tax").append("<input type='text' value='${bettingRuleDto.tax }'"
				+ "name='tax' pattern='[0-9]{1}.[0-9]{1,2}' title='X.XX 혹은 X.X' />")
		$("#buttonBetting").empty();
		$("#buttonBetting").append("<input type='hidden' name='type' value='bettingRule'/>");
		$("#buttonBetting").append("<input type='submit' value='확인'/>");
	} else if(type=="TradeRule"){
		$("#b_bankname").empty();
		$("#b_bankname").append("<input type='text' value='${tradeRuleDto.b_bankname }' name='b_bankname' />");
		$("#b_account").empty();
		$("#b_account").append("<input type='text' value='${tradeRuleDto.b_account }' name='b_account' />");
		$("#b_username").empty();
		$("#b_username").append("<input type='text' value='${tradeRuleDto.b_username }' name='b_username' />");
		$("#buttonTrade").empty();
		$("#buttonTrade").append("<input type='hidden' name='type' value='tradeRule'/>");
		$("#buttonTrade").append("<input type='submit' value='확인'/>");
	}
	
}
function printSpan(id, result){
	
}
</script>
</head>
<body>
<div id="content" align="center">
	
		<div id="main" align="center">
			<div class="full_w">
				<h2>배 팅 정 보 관 리</h2>
				<p>유저의 배팅에 대한 정보를 관리합니다. </p>
				
				<div class="entry">
					<div class="sep"></div>
				</div>
				
				<form action="/mgm01/admin/ruleInfo" method="POST">
				<table>
					<thead>
						<tr>
							<th scope="col">홀짝 배당</th>
							<th scope="col">좌우 배당</th>
							<th scope="col">사다리수 배당</th>
							<th scope="col">최대 배팅금액</th>
							<th scope="col">최소 배팅금액</th>
							<th scope="col">수수료 비율</th>
							<th scope="col" style="width: 65px;">변경 </th>
						</tr>
					</thead>
					<tbody align="center">
						<tr>
							<td>
								<div id="dividend_oe">${bettingRuleDto.dividend_oe }</div>
							</td>
							<td>
								<div id="dividend_lr">${bettingRuleDto.dividend_lr }</div>
							</td>
							<td>
								<div id="dividend_line">${bettingRuleDto.dividend_line }</div>
							</td>
							<td>
								<div id="betting_max">${bettingRuleDto.betting_max }</div>
							</td>
							<td>
								<div id="betting_min">${bettingRuleDto.betting_min }</div>
							</td>
							<td>
								<div id="tax">${bettingRuleDto.tax }</div>
							</td>
							<td>
								<div id="buttonBetting">
								<button type="button" onclick="update('BettingRule')">
									변경								
								</button>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
				</form>
				
				<div class="entry">
					<div class="sep"></div>		
				</div>
			</div>
		</div>
		<div class="clear"></div>
		</div>
		<div id="content" align="center">
	
		<div id="main" align="center">
			<div class="full_w">
				<h2>계 좌 정 보 관 리</h2>
				<p>유저가 입금할 계좌정보를 관리합니다. </p>
				
				<div class="entry">
					<div class="sep"></div>
				</div>
				
				<form action="/mgm01/admin/ruleInfo" method="POST">
				<table>
					<thead>
						<tr>

							<th scope="col">은행명</th>
							<th scope="col">계좌번호</th>
							<th scope="col">예금주</th>
							<th scope="col" style="width: 65px;">변경 </th>
						</tr>
					</thead>
					<tbody align="center">
						<tr>
							<td>
								<div id="b_bankname">${tradeRuleDto.b_bankname }</div>
							</td>
							<td>
								<div id="b_account">${tradeRuleDto.b_account }</div>
							</td>
							<td>
								<div id="b_username">${tradeRuleDto.b_username }</div>
							</td>
							<td>
								<div id="buttonTrade">
								<button type="button" onclick="update('TradeRule')">
									변경								
								</button>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
				</form>
				
				<div class="entry">
					<div class="sep"></div>		
				</div>
			</div>
		</div>
		<div class="clear"></div>
		</div>
</body>
</html>