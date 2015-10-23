<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SimpleAdmin</title>
<link rel="stylesheet" type="text/css" href="/mgm01/resources/admin/css/style.css" media="screen" />
<link rel="stylesheet" type="text/css" href="/mgm01/resources/admin/css/navi.css" media="screen" />
<script type="text/javascript" src="/mgm01/resources/admin/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript">
$(function(){
	$(".box .h_title").not(this).next("ul").hide("normal");
	$(".box .h_title").not(this).next("#home").show("normal");
	$(".box").children(".h_title").click( function() { $(this).next("ul").slideToggle(); });
});
</script>
</head>
<body>
<div class="wrap">
	<div id="header">
		<div id="top">
			<div class="left">
				
			</div>
			<div class="right">
				<div class="align-right">
				<p><strong><sec:authentication property="principal.username"/></strong>님 어서오세요 [ <a href="/mgm01/user/logout">logout</a> ]</p>
<!-- 					<p>Last login: <strong>23-04-2012 23:12</strong></p> -->
				</div>
			</div>
		</div>
		<div id="nav">
			<ul>
				<li class="upp"><a href="#">회원관리</a>
					<ul>
						<li>&#8250; <a href="/mgm01/admin/userInfo">전체보기</a></li>
					</ul>
				</li>
				<li class="upp"><a href="#">캐쉬내역</a>
					<ul>
						<li>&#8250; <a href="/mgm01/admin/cashInfo">전체내역</a></li>
						<li>&#8250; <a href="/mgm01/admin/cashInfo?type=ex_ch">충환전내역</a></li>
						<li>&#8250; <a href="/mgm01/admin/cashInfo?type=charge">충전내역</a></li>
						<li>&#8250; <a href="/mgm01/admin/cashInfo?type=exchange">환전내역</a></li>
						<li>&#8250; <a href="/mgm01/admin/bettinglist?type=all">배팅내역</a></li>
						<li>&#8250; <a href="/mgm01/admin/bettinglist?type=win">적중내역</a></li>
					</ul>
				</li>
				<li class="upp"><a href="#">총판관리</a>
					<ul>
						<li>&#8250; <a href="">총판현황</a></li>
						<li>&#8250; <a href="/mgm01/admin/board?type=notice">공지사항</a></li>
						<li>&#8250; <a href="/mgm01/admin/board?type=customer">고객센터</a></li>
						<li>&#8250; <a href="/mgm01/admin/tradeInfo?type=charge">충전신청 관리</a></li>
						<li>&#8250; <a href="/mgm01/admin/tradeInfo?type=exchange">환전신청 관리</a></li>
					</ul>
				</li>
				<li class="upp"><a href="#">전체관리</a>
					<ul>
						<li>&#8250; <a href="">전체현황</a></li>
						<li>&#8250; <a href="">총판아이디부여</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</div>
	</div>
	