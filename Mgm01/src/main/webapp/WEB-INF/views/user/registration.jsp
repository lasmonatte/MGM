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
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="/mgm01/resources/js/user.js"></script>
    <script type="text/javascript">
    var cor_id = false;
    var cor_pass = false;
    var cor_bpass = false;
    var cor_recmdId = false;

    function checkPass() {
   		if ($('#password').val().length < 4) {
   			$('#chk_pass').empty();
   			$('#chk_pass').append("<span class=\"incorrect\">비밀번호는 4글자 이상이여야 합니다</span>");
   			return cor_pass=false
   		} else{
	   		$('#chk_pass').empty();
   			return cor_pass=false;
   		}
    }
	
    function checkRepass(){
   		if($('#repassword').val()!=$('#password').val()){
   			$('#chk_repass').empty();
	   		$('#chk_repass').append("<span class=\"incorrect\">비밀번호가 일치하지 않습니다.</span>");
	   		return cor_pass=false;
   		} else{
   			$('#chk_repass').empty();
   			$('#chk_repass').append("<span class=\"correct\">비밀번호가 일치합니다.</span>");
   			return cor_pass=true;
   		}
    }
    
    function checkBpass() {
   		if ($('#b_password').val().length < 4) {
   			$('#chk_bpass').empty();
   			$('#chk_bpass').append("<span class=\"incorrect\">환전비밀번호는 4글자여야합니다.</span>");
   			return cor_bpass=false
   		} else{
	   		$('#chk_bpass').empty();
	   		return cor_bpass=true;
   		}
    }
    
function checkId(type) {
	if(type=="id"){
    	if ($('#id').val().length < 4) {
    		$('#chk_id').empty();
   			$('#chk_id').append("<span class=\"incorrect\">아이디는 4글자 이상이어야 합니다.</span>");
   			return cor_id=false;
    	} else{
    		$('#chk_id').empty();
  		
    		$.ajax({
    			method : 'GET',
    			url : '/mgm01/user/reg_inner',
    			dataType : 'text',
    			data : {
    				type : type,
    				msg : $('#id').val()
    			}
    		}).success(function(msg) {
				if(msg.length<14){
    				$('#chk_id').append("<span class=\"correct\">"+msg+"</span>");
    				return cor_id=true;
				}
				else
					$('#chk_id').append("<span class=\"incorrect\">"+msg+"</span>");
					return cor_id=false;
    		});
    	} 
	}
	
	if(type=="recmd_id"){
    		$.ajax({
    			method : 'GET',
    			url : '/mgm01/user/reg_inner',
    			dataType : 'text',
    			data : {
    				type : type,
    				msg : $('#recmd_id').val()
    			}
    		}).success(function(msg) {
				$('#chk_recmdId').empty();
				if(msg.length<18){
    				$('#chk_recmdId').append("<span class=\"correct\">"+msg+"</span>");
    				return cor_recmdId=true;
				}
				else{
					$('#chk_recmdId').append("<span class=\"incorrect\">"+msg+"</span>");
					return cor_recmdId=false;
				}
    		});
	}
}

function checkForm(){
	if(cor_id && cor_pass && cor_bpass && cor_recmdId)
		document.getElementById('contactform').submit();
	else{
		if(!cor_id)
			$("#id").focus();
		else if(!cor_pass)
			$("#password").focus();
		else if(!cor_bpass)
			$("#b_password").focus();
		else if(!cor_recmdId)
			$("#recmd_id").focus();
	}
}
    </script>
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
				<h1><span>www.mgm-01.com</span> MGM01 회원가입</h1>
            </header>       
      	<div class="form">
    		<form id="contactform" action="/mgm01/user/register" method="POST"> 
    			<p class="contact"><label for="id">아이디</label> <label id="chk_id"></label></p>
    			<input id="id" name="id" placeholder="아이디를 입력하세요" required="required" type="text" onblur="checkId('id')"/> 
    			
 				<p class="contact"><label for="password">패스워드</label> <label id="chk_pass"></label></p>
    			<input type="password" id="password" name="password" required="required" onkeyup="checkPass()" /> 
                <p class="contact"><label for="repassword">패스워드 재입력</label> <label id="chk_repass"></label></p> 
    			<input type="password" id="repassword" name="repassword" required="required" onkeyup="checkRepass()" /> 
    			
    			<p class="contact"><label for="name">이름</label></p> 
    			<input id="name" name="name" placeholder="이름을 입력하세요" required="required" type="text">
    			
    			<p class="contact"><label for="username">닉네임</label></p> 
    			<input id="nickname" name="nickname" placeholder="닉네임을 입력하세요" required="required" type="text">
    			
    			<p class="contact"><label for="phone">연락처</label></p> 
            	<input id="phone" name="phone" placeholder="휴대폰 번호(숫자만)를 입력하세요" pattern="[0-9]{10,11}" required="required" type="text">
    			
               	<fieldset>
                 <label>은행명</label>
                  <label class="month"> 
                  <select class="select-style" name="b_bankname" id="b_bankname">
						<option value='신한'>신한</option>
						<option value='국민'>국민</option>
						<option value='주택'>주택</option>
						<option value='농협중앙'>농협중앙</option>
						<option value='단위농협'>단위농협</option>
						<option value='우리'>우리</option>
						<option value='조흥'>조흥</option>
						<option value='외환'>외환</option>
						<option value='하나'>하나</option>
						<option value='한미'>한미</option>
						<option value='제일'>제일</option>
						<option value='서울'>서울</option>
						<option value='기업'>기업</option>
						<option value='평화'>평화</option>
						<option value='우체국'>우체국</option>
						<option value='경남'>경남</option>
						<option value='광주'>광주</option>
						<option value='대구'>대구</option>
						<option value='부산'>부산</option>
						<option value='산업'>산업</option>
						<option value='수협'>수협</option>
						<option value='전북'>전북</option>
						<option value='제주'>제주</option>
						<option value='씨티'>씨티</option>
						<option value='암로'>암로</option>
						<option value='도이치'>도이치</option>
						<option value='HSBC'>HSBC</option>
						<option value='상화'>상화</option>
						<option value='BOA'>BOA</option>
						<option value='새마을'>새마을</option>
						<option value='신용협동'>신용협동</option>
						<option value='상호저축'>상호저축</option>
						<option value='삼성증권'>삼성증권</option>
					</select>
                  </label>
                <label>예금주 <input class="birthyear" maxlength="20" name="b_username" placeholder="예금주명을 입력하세요" required="required" /></label>
             	</fieldset>
 				<p class="contact"><label for="b_account">계좌번호</label></p> 
    			<input id="b_account" name="b_account" placeholder="계좌번호를 입력하세요" required="required" type="text">
    			
    			<p class="contact"><label for="password">환전비밀번호</label> <label id="chk_bpass"></label> </p>
    			<input type="password" id="b_password" name="b_password" required="required" maxlength="4" onkeyup="checkBpass()" title="숫자만 입력가능합니다" pattern="[0-9]{4}"/> 
    			 
    			<p class="contact"><label for="id">추천인 아이디</label> <label id="chk_recmdId"></label></p>
    			<input id="recmd_id" name="recmd_id" placeholder="추천인 아이디를 입력하세요" required="required" type="text" onblur="checkId('recmd_id')"/>  
				<br><br>
            
            
            	<input class="button" name="btn_submit" id="btn_submit" tabindex="5" value="회원가입" onclick="checkForm()" type="button"/> 	 
  		 </form> 
	</div>      
</div>

</body>
</html>
