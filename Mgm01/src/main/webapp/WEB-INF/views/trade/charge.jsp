<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/mgm01/resources/css/table-dark-styles.css">
<link rel="stylesheet" href="/mgm01/resources/css/popup.css">

<script type="text/javascript">
var maked=false;
function check(b_pass) { // 일단 popup에서만 작동함 - feed_init(feed_num) 작성필요
	var b_password = document.getElementById("b_password").value;
	alert("체크");
	alert($("#amount").value);
	 if(b_password==b_pass){
		$("#b_bankname").empty();
		$("#b_username").empty();
		$("#b_account").empty();
		$("#b_bankname").append("<span>${rule.b_bankname }</span>");
		$("#b_bankname").append("<input type='hidden' name='b_bankname' value='${rule.b_bankname}' />");
		$("#b_username").append("<span>${rule.b_username }</span>");
		$("#b_username").append("<input type='hidden' name='b_username' value='${rule.b_username}' />");
		$("#b_account").append("<span>${rule.b_account }</span>");
		$("#b_account").append("<input type='hidden' name='b_account' value='${rule.b_account}' />");
		if(!maked){
	 	$('#chargeTable > tbody:last').append("<tr><td colspan='2' align='center'><input type='submit' value='확인' class='button' style='width:20%;'/>");			
// 		$('#chargeTable > tbody:last').append("<tr><td colspan='2'><input type='submit' value='확인' class='button' style='width:20%;'/>"+
// 			"<input type='button' value='취소' class='button' style='width:20%;' /></td></tr>");
		maked=true;
		}
	 }else
		 alert("환전 비밀번호를 정확히 입력하세요.");
	 
	}
</script>
</head>
<body>
 <div id="container" align="center">  
    <div class="transparency">  
    </div>  
    <div class="content">  
	<form action="/mgm01/trade/charge" method="POST">
	<table id="chargeTable" class="dark" width="40%;" style="text-align: left; text-indent: 3em;">
	<thead>
		<tr>
			<th  colspan="2">캐쉬충전</th>
		</tr>
	</thead>
	<tbody>
		<tr >
			<td  colspan="2">
			<div class="div">
			<pre style="text-indent: 0; color:graytext;">
		입금을 먼저하시고, 충전신청을 하시기 바랍니다.
		요청금액에는 입금하신 금액을 입력하세요.
		입금자명에는 입금하신 분의 성함을 넣어 주세요.
		확인 버튼을 클릭하시면 충전신청이 완료됩니다.
		입금금액은 최소 10,000원 이상입니다.
		
		충전신청후 1분이 지나도 처리가 안된다면 고객센터로 연락주세요.
		입금자명 / 입금액 / 충전신청금액이 정확하게 일치해야 바로 처리됩니다.
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
			<td ><input type="text" name="amount" id="amount" pattern="[0-9]{5,}" />원</td>
		</tr>
		<tr >
			<td >환전 비밀번호</td>
			<td >
				<input type="password" id="b_password"/>&nbsp;&nbsp;&nbsp;
				<input type="button" class="button" value="환전 비밀번호 확인" 
					onclick="check('<sec:authentication property="principal.b_password"/>')" style="width: 25%;"/>
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
		<tr >
			<td >입금자</td>
			<td ><input type="text" name="name" value="${userDto.name }" /></td>	
		</tr>
	</tbody>
	</table>
	</form>
	</div>
</div>
</body>
</html>