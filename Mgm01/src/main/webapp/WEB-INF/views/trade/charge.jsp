<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="/mgm01/resources/tablecloth/tablecloth.css" rel="stylesheet" type="text/css" media="screen" />
<script type="text/javascript">

function check(b_pass) { // 일단 popup에서만 작동함 - feed_init(feed_num) 작성필요
	var b_password = document.getElementById("b_password").value;
	 if(b_password==b_pass){
		$("#b_bankname").empty();
		$("#b_username").empty();
		$("#b_account").empty();
		$("#b_bankname").append("<span>${rule.b_bankname }</span>");
		$("#b_username").append("<span>${rule.b_username }</span>");
		$("#b_account").append("<span>${rule.b_account }</span>");
		$("#su_ca").append("<input type='submit' value='확인'/><input type='button' value='취소' />");
	 }else
		 alert("환전 비밀번호를 정확히 입력하세요.");
	 
	}
</script>
</head>
<body>
	<div align="center">
	<form action="/mgm01/trade/charge" method="POST">
	<table class="table">
	<thead>
		<tr class="tr">
			<th class="th" colspan="3">캐쉬충전</th>
		</tr>
	</thead>
	<tbody>
		<tr class="tr">
			<td class="td" colspan="3">
				<div class="div">
				입금하실 계좌에 PC 뱅킹, 폰뱅킹, 무통장 입금, ATM등의 방법으로 금액 중 하나를 선택하여 입금합니다.<br />
				입금하신 금액을 입력하세요. 입금자명에는 입금하신 분의 성함을 넣어 주세요.<br />
				확인 버튼을 클릭하시면 충전신청이 완료됩니다. 입금액은 10,000원 이상입니다.<br /><br /><br />
				입금을 먼저하시고, 충전신청을 하시기 바랍니다.<br />
				충전신청후 1분이 지나도 처리가 안된다면 고객센터로 연락주세요.<br />
				입금자명 / 입금액 / 충전신청금액이 정확하게 일치해야 바로 처리됩니다.<br />
				</div>
			</td>
		</tr>
		<tr class="tr">
			<td class="td">보유캐쉬</td>
			<td class="td">${userDto.cash }</td>
		</tr>
		<tr class="tr">
			<td class="td">요청금액</td>
			<td class="td"><input type="text" name="amount" />원</td>
		</tr>
		<tr class="tr">
			<td class="td">환전 비밀번호</td>
			<td class="td">
				<input type="password" id="b_password"/>
				<input type="button" value="환전 비밀번호 확인" 
					onclick="check('<sec:authentication property="principal.b_password"/>')" />
			</td>
		</tr>
		<tr class="tr">
			<td class="td">은행명</td>
			<td class="td"><div id="b_bankname">환전 비밀번호 인증 후 표시됩니다.</div></td>
		</tr>
		<tr class="tr">
			<td class="td">예금주</td>
			<td class="td"><div id="b_username">환전 비밀번호 인증 후 표시됩니다.</div></td>
		</tr>
		<tr class="tr">
			<td class="td">계좌번호</td>
			<td class="td"><div id="b_account">환전 비밀번호 인증 후 표시됩니다.</div></td>
		</tr>
		<tr class="tr">
			<td class="td">입금자</td>
			<td class="td"><input type="text" name="name" value="${userDto.name }" /></td>	
		</tr>
	</tbody>
	</table>
	<div id="su_ca" align="center" >
	</div>
	</form>
	</div>
</body>
</html>