<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<form action="/mgm01/trade/exchange" method="POST">
	<table width="500px">
	<thead>
		<tr>
			<td>캐쉬환불</td>
		</tr>
	</thead>
	<tbody>
		<tr height="300px">
			<td colspan="3">
				<div>
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
		<tr>
			<td>보유캐쉬</td>
			<td>${userDto.cash }</td>
		</tr>
		<tr>
			<td>요청금액</td>
			<td><input type="text" name="amount" />원</td>
		</tr>
		<tr>
			<td>환전 비밀번호</td>
			<td><input type="password" /></td>
			<td>입금계좌확인</td>
		</tr>
		<tr>
			<td>은행명</td>
			<td><input type="text" name="${userDto.b_bankname }" disabled="disabled" /></td>
		</tr>
		<tr>
			<td>계좌번호</td>
			<td><input type="text" value="${userDto.b_account }" disabled="disabled" /></td>
		</tr>
		<tr>
			<td>예금주</td>
			<td><input type="text" value="${userDto.name }" disabled="disabled"/></td>	
		</tr>
	</tbody>
	</table>
	<input type="hidden" name="name" value="${userDto.name }">
	<input type="submit" value="확인"/><input type="button" value="취소" />
	</form>
	
</body>
</html>