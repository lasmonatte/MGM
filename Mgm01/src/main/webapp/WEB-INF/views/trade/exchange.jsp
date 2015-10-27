<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/mgm01/resources/css/table-dark-styles.css">
<link rel="stylesheet" href="/mgm01/resources/css/popup.css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript">
var cash=${cash }
var maked=false;
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
			if(!maked){
	 		$('#exchangeTable > tbody:last').append("<tr><td colspan='2' align='center'><input type='submit' value='확인' class='button' style='width:20%;'/>");
// 			$('#exchangeTable > tbody:last').append("<tr><td colspan='2'><input type='submit' value='확인' class='button' style='width:20%;'/>"+
// 			"<button onclick='exit()' class='button' style='width:20%;'>취소</button></td></tr>");
			maked=true;
			}
	 	}else
			alert("환전 비밀번호를 정확히 입력하세요.");
	} else
		return;
}

function exit(){
	alert("옴");
	location.href="/mgm01/game/ladder";
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
<div id="container" align="center">  
    <div class="transparency">  
    </div>  
    <div class="content">  
	<form action="/mgm01/trade/exchange" method="POST" name="form">
	<table class="dark" id="exchangeTable" width="40%;" style="text-align: left; text-indent: 3em;">
	<thead>
		<tr >
			<th  colspan="2">캐쉬환불</th>
		</tr>
	</thead>
	<tbody>
		<tr >
			<td  colspan="2" align="left">
				<div class="div">
				<pre style="text-indent: 0; color:graytext;">
		환전신청은 등록된 계좌에서만 가능합니다.
		환전계좌변경은 고객센터에 문의하시기 바랍니다.
				
		환전 신청시 입력된 연락처를 이용하여 확인을 하고 있습니다.
		보안을 위해 연락 기록을 삭제하시길 당부드립니다.

		신청 후 1분이 지나도 처리가 안된다면 고객센터로 연락주세요.
		입금자명 / 입금액 / 신청금액이 정확하게 일치해야 바로 처리됩니다.
				</pre>
				</div>
			</td>
		</tr>
		<tr >
			<td >보유캐쉬</td>
			<td style="color: gold;"><fmt:formatNumber value="${userDto.cash }" pattern="###,###,###,###,###,###,###" />원</td>
		</tr>
		<tr >
			<td >요청금액</td>
			<td ><input type="text" name="amount" id="amount" pattern="[0-9]{5,}" /> 원</td>
		</tr>
		<tr >
			<td >환전 비밀번호</td>
			<td >
				<input type="password" id="b_password"/>
				<input type="button" value="환전 비밀번호 확인" 
					onclick="check('<sec:authentication property='principal.b_password'/>')" />
			</td>
		</tr>
		<tr >
			<td >은행명</td>
			<td style="color: orange;"><div id="b_bankname"><span style="color: red;">환전 비밀번호 인증 후 표시됩니다.</span></div></td>
		</tr>
		<tr >
			<td >예금주</td>
			<td style="color: orange;"><div id="b_username"><span style="color: red;">환전 비밀번호 인증 후 표시됩니다.</span></div></td>
		</tr>
		<tr >
			<td >계좌번호</td>
			<td style="color: orange;"><div id="b_account"><span style="color: red;">환전 비밀번호 인증 후 표시됩니다.</span></div></td>
		</tr>
	</tbody>
	</table>
	<input type="hidden" name="name" value="${userDto.name }">
	<input type="hidden" name="b_bankname" value="${userDto.b_bankname }">
	<input type="hidden" name="b_account" value="${userDto.b_account }">
	<input type="hidden" name="b_username" value="${userDto.b_username }">
	</form>
</div>
</div>
</body>
</html>