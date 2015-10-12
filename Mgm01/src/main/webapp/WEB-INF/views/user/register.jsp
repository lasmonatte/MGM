<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>회원가입</title>
<link rel="stylesheet" type="text/css" href="/mgm01/resources/css/style.css" />
<link rel="stylesheet" type="text/css" href="/mgm01/resources/css/user.css" />
<style>
    .main { padding-top:80px;}
    .logo { width:235px; margin:0 auto 30px;}
    .logo img { width:212px; height:76px;}
</style>
</head>
<body>
	<div class="wrapper">                                                
 		<div class="main">
            <div class="logo">                                                    
                <img src="/mgm01/resources/images/logo.png"/>
            </div>
            <div class="register_box">
            	<div class="input_register">
            		회원가입
            	</div>
            	<form action="/mgm01/user/register" method="POST">
                <div class="input_register">
                    <input type="text" placeholder="아이디를 입력하세요" id="id" name="id" required="required" />
                </div>
                <div class="input_register">
                    <input type="text" placeholder="닉네임을 입력하세요" id="nickname" name="nickname" required="required" />
                </div>
                <div class="input_register">
                    <input type="password" placeholder="비밀번호를 입력하세요" id="password" name="password" required="required" />
                </div>
                <div class="input_register">
                    <input type="password" placeholder="비밀번호를 다시 입력하세요" id="password2" name="password2" required="required" />
                </div>
                <div class="input_register">
                    <input type="tel" placeholder="핸드폰번호를 입력하세요" id="phone" name="phone" pattern="[0-9]{11}"
                    		title="숫자만 입력하여 11자리의  전화번호를 입력해주세요" required="required" />
                </div>
                <div class="input_register">
                	<select name="b_bankname" id="b_bankname"  required="required" >
						<option value="">은행선택</option>
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
				</div>
                <div class="input_register">
                    <input type="text" placeholder="계좌번호를 입력하세요" id="b_account" name="b_account" required="required" />
                </div>
                <div class="input_register">
                    <input type="text" placeholder="예금주명을 입력하세요" id="b_username" name="b_username" required="required" />
                </div>
                <div class="input_register">
                    <input type="password" placeholder="환전비밀번호를 입력하세요" id="b_password" name="b_password" required="required" />
                </div>
                <div class="input_register">
                    <input type="text" placeholder="추천인 아이디를 입력하세요" id="recmd_id" name="recmd_id" required="required" />
                </div>
                <div class="submit_register">
                	<input type="submit" value="회원가입"/>
                </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>