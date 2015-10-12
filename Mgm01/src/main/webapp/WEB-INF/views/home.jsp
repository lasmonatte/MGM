<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>로그인</title>
<link rel="stylesheet" type="text/css" href="/mgm01/resources/css/style.css" />
<link rel="stylesheet" type="text/css" href="/mgm01/resources/css/user.css" />
<style>
	.main { padding-top:148px;}
	.logo { width:235px; margin:0 auto 60px;}
    .logo img { width:212px; height:76px;}
</style>
</head>
<body>
	<c:if test="${errMsg ne null }">
			<script type="text/javascript">alert("접근 권한이 없습니다.")</script>
	</c:if>
	<div class="wrapper">                                                
 		<div class="main">
            <div class="logo">                                                    
                <img src="/mgm01/resources/images/logo.png"/>
            </div>
            <div class="login_box">
            	<form action="/mgm01/user/login" method="POST">
                <div class="input_login">
                    <input type="text" placeholder="아이디를 입력하세요" id="id" name="id" >
                </div>
                <div class="input_login">
                    <input type="password" placeholder="비밀번호를 입력하세요" id="password" name="password">
                </div>
                <div class="submit_login">
                	<input type="submit" value="로그인"/>
                </div>
                </form>
                <form action="/mgm01/user/register/" method="GET">
                <div class="register">
                	<input type="submit" value="회원가입"/>
                </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>