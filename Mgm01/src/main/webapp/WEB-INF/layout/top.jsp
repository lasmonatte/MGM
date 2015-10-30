<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="stylesheet" href="/mgm01/resources/css/semi-transparent-buttons.css">
<link rel="stylesheet" type="text/css" href="/mgm01/resources/admin/css/navi.css" media="screen" />
<style>
<!--
    .logo img { width:400px; height:250px;}
-->
</style>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<link rel="stylesheet" href="/mgm01/resources/css/table-dark-styles.css">
<script type="text/javascript">
	function trade(type){
		var url = '/mgm01/game/'+type;
		window.open(url);
	}
</script>
</head>
<body>
<table width="90%" align="center" style="margin-bottom: 3%; border: 2px;">
<tbody>
	<tr>
		<th class="loginfo">
			<font style="color:gold; font-weight: bold; "><sec:authentication property="principal.nickname"/></font>님 반갑습니다.
		</th>
		<th class="loginfo">
			캐쉬: <font style="color:gold; font-weight: bold; ">
			<fmt:formatNumber value="${cash }" pattern="###,###,###,###,###,###,###" />
			</font>원
		</th>
		<td align="right" style="background: none;">
			<a href="/mgm01/trade/list"><button type="button" style="width: 10%;">충/환전기록</button></a>
			<a href="/mgm01/user/updateInfo"><button type="button" style="width: 10%;">정보수정</button></a>
			<a href="/mgm01/user/logout"><button type="button" style="width: 10%;">로그아웃</button></a>
		</td>
	</tr>	
</tbody>
</table>
<table cellpadding="0" cellspacing="0" border="0" width="90%" height="15%" align="center" 
		style="margin-bottom: 3%; margin-top: 1%;">
	<tbody>
		<tr>
			<td align="center" width="20%">
				<form action="/mgm01/game/charge">
				<input type="image" src="/mgm01/resources/images/charge.png" width="100%"/>
				</form>
			</td>
			<td align="center" width="60%">
			<form action="/mgm01/game/ladder">
				<input type="image" border="0" src="/mgm01/resources/images/logo.png" width="50%"/>
			</form>
			</td>
			<td align="center" width="20%">
			<form action="/mgm01/game/exchange">
				<input type="image" src="/mgm01/resources/images/exchange.png" width="95%"/>
			</form>
			</td>
		</tr>
	</tbody>
</table>
<table cellpadding="0" cellspacing="0" border="0" width="90%" height="35" align="center" >
<tbody align="center">
<tr>
	<td>
	<div>
		<a class="semi-transparent-button" href="/mgm01/game/result">경기결과</a>		
	</div>
	</td>
	<td>
	<div><a class="semi-transparent-button" href="/mgm01/game/betlist">배팅내역</a></div>
	</td>
	<td>
	<div><a class="semi-transparent-button" href="/mgm01/game/ladder">사다리</a></div>
	</td>
	<td>
	<div><a class="semi-transparent-button" href="/mgm01/board/notice">공지사항</a></div>
	</td>
	<td>
	<div><a class="semi-transparent-button" href="/mgm01/board/customer">고객센터</a></div>
	</td>
</tr>
</tbody>
</table>
<hr color="darkred" size="5px"/>
</body>
</html>
