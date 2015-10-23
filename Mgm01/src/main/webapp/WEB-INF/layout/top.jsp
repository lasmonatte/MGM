<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="/mgm01/resources/css/semi-transparent-buttons.css">
<!--[if lt IE 9]><script src="//cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.2/html5shiv.min.js"></script><script src="//cdnjs.cloudflare.com/ajax/libs/respond.js/1.4.2/respond.min.js"></script><![endif]-->
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
    h2{
    	font-style: italic;
    	margin-bottom: 1px;
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
<table border="5px" width="90%" align="center" style="margin-top: 1%;">
<tbody>
	<tr>
		<td width="20%">
			<sec:authentication property="principal.nickname"/>님 반갑습니다.
		</td>
		<td width="50%">
			캐쉬: <fmt:formatNumber value="${cash }" pattern="###,###,###,###,###,###,###" /> 원
		</td>
		<td>
					<input type="button" value="정보수정" onclick=""/>
					<input type="button" value="로그아웃" onclick="cli('/user/logout')"/>
		</td>
	</tr>	
</tbody>
</table>
<table cellpadding="0" cellspacing="0" border="5px" width="90%" height="15%" align="center" 
		style="margin-bottom: 3%; margin-top: 1%;">
<!-- <tbody align="center"> -->
<!-- 	<tr> -->
<!-- 		<td width="10%" align="right" > -->
<!-- 			<div align="center"> -->
<!-- 			<div > -->
<%-- 				<sec:authentication property="principal.nickname"/>님 반갑습니다. --%>
<!-- 			</div><br /> -->
<!-- 			<div> -->
<%-- 				캐쉬: <fmt:formatNumber value="${cash }" pattern="###,###,###,###,###,###,###" /> 원 --%>
<!-- 			</div><br /> -->
<!-- 			<div> -->
				
<!-- 				</form>	 -->
<!-- 			</div> -->
<!-- 			</div> -->
<!-- 		</td> -->
<!-- 		<td width="40%" align=right> -->
<!-- 			<input type="image" src="/mgm01/resources/images/logo.png" width="60%"/> -->
<!-- 		</td> -->
<!-- 		<td width="15%"> -->
<!-- 			<div> -->
<!-- 				<input type="image" onclick="trade('charge')" src="/mgm01/resources/images/charge.png" width="60%"/> -->
<!-- 			</div> -->
<!-- 		</td> -->
<!-- 		<td width="15%" align="left"> -->
<!-- 			<div> -->
<!-- 				<input type="image" onclick="trade('exchange')" src="/mgm01/resources/images/exchange.png" width="55%"/> -->
<!-- 			</div> -->
<!-- 		</td> -->
<!-- 	</tr> -->
<!-- </tbody> -->

	<tbody>
		<tr>
			<td align="center" width="20%">
				<input type="image" onclick="trade('charge')" src="/mgm01/resources/images/charge.png" width="100%"/>
			</td>
			<td align="center" width="60%">
				<input type="image" src="/mgm01/resources/images/logo.png" width="50%"/>
			</td>
			<td align="center" width="20%">
				<input type="image" onclick="trade('exchange')" src="/mgm01/resources/images/exchange.png" width="95%"/>
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
<div id="popup" class="Pstyle">
	<span class="b-close">X</span>
	<div class="content" style="height: auto; width: auto;">
	</div>
</div>
</body>
</html>
