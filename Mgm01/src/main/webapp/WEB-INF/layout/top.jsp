<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<style>
<!--
    .logo img { width:400px; height:250px;}
    
-->
</style>
</head>
<body>
<table cellpadding="0" cellspacing="0" border="1px" width="90%" height="35" align="center" >
<tbody align="center">
<tr>
	<td>
		<div>
			<sec:authentication property="principal.nickname"/>님 반갑습니다.
		</div>
	</td>
	<td width="5%">
	<div>
		<form action="" method="POST" >
			<input type="submit" value="정보수정" />
		</form>
	</div>
	</td>
	<td width="5%">
	<div>
		<form action="/mgm01/user/logout" method="GET">
			<input type="submit" value="로그아웃" />
		</form>
	</div>
	</td>
	<td width="50%">
	</td>
	<td width="20%">
		캐쉬: <sec:authentication property="principal.cash"/>원
	</td>
</tr>
</tbody>
</table>
<table cellpadding="0" cellspacing="0" border="1px" width="90%" height="35" align="center" >
<tbody align="center">
<tr >
	<td align="center">
	<div class="logo">
		<img src="/mgm01/resources/images/logo.png">
	</div>
	</td>
</tr>
</tbody>
</table>
<table cellpadding="0" cellspacing="0" border="1px" width="90%" height="35" align="center" >
<tbody align="center">
<tr>
	<td>
	<div>
		<form action="/mgm01/game/ladder" method="POST">
			<input type="submit" value="사다리" />
		</form>
	</div>
	</td>
	<td>
	<div>
		<form action="/mgm01/game/result" method="POST">
			<input type="submit" value="경기결과" />
		</form>
	</div>
	</td>
	<td width="20%">
	<div>
		<form action="" method="POST">
			<input type="submit" value="배팅내역" />
		</form>
	</div>
	</td>
	<td>
	<div>
		<form action="" method="POST">
			<input type="submit" value="공지사항" />
		</form>
	</div>
	</td>
	<td>
	<div>
		<form action="" method="POST">
			<input type="submit" value="고객센터" />
		</form>
	</div>
	</td>
</tr>
</tbody>
</table>
<hr/>

</body>
