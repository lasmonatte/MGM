<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<style>
<!--
    .logo img { width:400px; height:250px;}
    .Pstyle {
    	opacity: 0;
    	display: none;
    	position: relative;
    	width: auto;
    	border: 5px solid#fff;
    	padding: 20px;
    	background-color: #fff;
    }
    
    .b-close{
    	position: absolute;
    	right: 5px;
    	top: 5px;
    	padding: 5px;
    	display: inline-block;
    	cursor: pointer;
    }
-->
</style>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="/mgm01/resources/js/jquery.bpopup.min.js"></script>
<script type="text/javascript">
	function trade(type){
		var url = '/mgm01/game/'+type;
		$('#popup').bPopup({
		    contentContainer:'.content',
            loadUrl: url, //Uses jQuery.load()
           	modalClose: false,
		});
	}
</script>
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
		캐쉬: <fmt:formatNumber value="${cash }" pattern="###,###,###,###,###,###,###" /> 원
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
		<form action="/mgm01/game/ladder" method="GET">
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
		<form action="/mgm01/game/betlist" method="POST">
			<input type="submit" value="배팅내역" />
		</form>
	</div>
	</td>
	<td>
	<div>
		<form action="/mgm01/board/notice" method="GET">
			<input type="submit" value="공지사항" />
		</form>
	</div>
	</td>
	<td>
	<div>
		<form action="/mgm01/board/customer" method="GET">
			<input type="submit" value="고객센터" />
		</form>
	</div>
	</td>
	<td>
	<div>
		<input type="button" value="충전" onclick="trade('charge')"/>
	</div>
	</td>
	<td>
	<div>
		<input type="button" value="환전" onclick="trade('exchange')"/>
	</div>
	</td>
</tr>
</tbody>
</table>
<hr/>
<div id="popup" class="Pstyle">
	<span class="b-close">X</span>
	<div class="content" style="height: auto; width: auto;">
	</div>
</div>
</body>
