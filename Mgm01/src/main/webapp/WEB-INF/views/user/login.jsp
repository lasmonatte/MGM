<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>회원가입</title>
	<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7; IE=EmulateIE9">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no"/>
    <link rel="stylesheet" type="text/css" href="/mgm01/resources/css/user/style.css" media="all" />
    <link rel="stylesheet" type="text/css" href="/mgm01/resources/css/user/demo.css" media="all" />
</head>
<body>
<div class="container">
			<!-- freshdesignweb top bar -->
            <div class="freshdesignweb-top">
                <a href="/mgm01/">Home</a>
<!--                 <span class="right"> -->
<!--                     <a href="http://www.freshdesignweb.com/beautiful-registration-form-with-html5-and-css3.html"> -->
<!--                         <strong>Back to the freshdesignweb Article</strong> -->
<!--                     </a> -->
<!--                 </span> -->
                <div class="clr"></div>
            </div><!--/ freshdesignweb top bar -->
			<header>
				<h1><span>www.mgm-01.com</span> MGM01</h1>
            </header>       
      <div  class="form">
    		<form id="contactform" action="register" method="POST"> 
    			<p class="contact"><label for="id">아이디</label></p> 
    			<input id="id" name="id" placeholder="아이디를 입력하세요" required="required" type="text" /> 
    			
 				<p class="contact"><label for="password">패스워드</label></p> 
    			<input type="password" id="password" name="password" required="required" /> 
                <p class="contact"><label for="repassword">패스워드 재입력</label></p> 
    			<input type="password" id="repassword" name="repassword" required="required"  /> 
    			
            
            	<input class="button" name="submit" id="submit" tabindex="5" value="로그인" type="submit"> 	 
  		 </form> 
	</div>      
</div>

</body>
</html>
