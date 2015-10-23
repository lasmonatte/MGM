<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="/mgm01/resources/tablecloth/tablecloth.css" rel="stylesheet" type="text/css" media="screen" />
<script type="text/javascript">
var cash=${cash }
function check(b_pass) { // 일단 popup에서만 작동함 - feed_init(feed_num) 작성필요
	var b_password = document.getElementById("b_password").value;
	if(checkAmount()){
		if(b_password==b_pass){
			$("#b_bankname").empty();
			$("#b_username").empty();
			$("#b_account").empty();
			$("#b_bankname").append("<span>${userDto.b_bankname }</span>");
			$("#b_username").append("<span>${userDto.b_username }</span>");
			$("#b_account").append("<span>${userDto.b_account }</span>");
			$("#su_ca").append("<input type='submit' value='확인''/><input type='button' value='취소' />");
	 	}else
			alert("환전 비밀번호를 정확히 입력하세요.");
	} else
		return;
}

function checkAmount(){
	if(form.amount.value>cash){
		alert("보유 금액 이상 환전할 수 없습니다.");
		form.amount.focus();
		return false;
	} else if(form.amount.value<=0){
		alert("금액을 제대로 입력해주세요.");
		form.amount.focus();
		return false;
	} else
		return true;
	
}
</script>
</head>
<body>
<div align="center">
	<form action="/mgm01/trade/exchange" method="POST" name="form">
	<table class="table">
	<thead>
		<tr class="tr">
			<th class="th" colspan="3">캐쉬환불</th>
		</tr>
	</thead>
	<tbody>
		<tr class="tr">
			<td class="td" colspan="3" align="left">
				<div class="div">
				환전신청은 등록된 계좌에서만 가능합니다.<br />
				환전계좌변경은 고객센터에 문의하시기 바랍니다.<br />
				<br />
				환전 신청시 입력된 연락처를 이용하여 확인을 하고 있습니다.<br />
				보안을 위해 연락 기록을 삭제하시길 당부드립니다.<br />
				<br />	
				신청 후 1분이 지나도 처리가 안된다면 고객센터로 연락주세요.<br />
				입금자명 / 입금액 / 신청금액이 정확하게 일치해야 바로 처리됩니다.<br/>
				
				</div>
			</td>
		</tr>
		<tr class="tr">
			<td class="td">보유캐쉬</td>
			<td class="td">${userDto.cash }</td>
		</tr>
		<tr class="tr">
			<td class="td">요청금액</td>
			<td class="td"><input type="number" name="amount" pattern="[0-9]"/>원</td>
		</tr>
		<tr class="tr">
			<td class="td">환전 비밀번호</td>
			<td class="td">
				<input type="password" id="b_password"/>
				<input type="button" value="환전 비밀번호 확인" 
					onclick="check('<sec:authentication property='principal.b_password'/>')" />
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
	</tbody>
	</table>
	<div id="su_ca" align="center" ></div>
	<input type="hidden" name="name" value="${userDto.name }">
	<input type="hidden" name="b_bankname" value="${userDto.b_bankname }">
	<input type="hidden" name="b_account" value="${userDto.b_account }">
	<input type="hidden" name="b_username" value="${userDto.b_username }">
	</form>
</div>
</body>
</html>