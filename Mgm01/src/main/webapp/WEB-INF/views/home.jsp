<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Content-Language" content="en">
<meta name="viewport" content="width=1020">
<meta content="origin" name="referrer">


<link crossorigin="anonymous"
	href="https://assets-cdn.github.com/assets/github/index-e85c4df2f00f610f7d403b70cb6ff08a89f810737918e84973d175e3c3e31f50.css"
	media="all" rel="stylesheet">
<link crossorigin="anonymous"
	href="https://assets-cdn.github.com/assets/github2/index-ef69b63d2441844ee240b72490c991b23eae664f050aa0236621ac6d79ede650.css"
	media="all" rel="stylesheet">



<%--
<meta http-equiv="x-pjax-version"
   content="3c433415bc1d94663f8b483c1c8d63a8">  --%>
<%--
<meta name="description"
   content="GitHub is where people build software. More than 10 million people use GitHub to discover, fork, and contribute to over 25 million projects.">
<script type="text/javascript" async=""
   src="//collector-cdn.github.com/assets/api.js"></script>
</head>
 --%>

<body class="logged_out  env-production windows">
	<div class="wrapper">


		<div id="start-of-content" class="accessibility-aid"></div>
		<div class="site clearfix" role="main">

			<div id="site-container" class="context-loader-container"
				data-pjax-container="">




				<div class="auth-form" id="login">

					<!-- </textarea> -->
					<!-- '"` -->
					<form accept-charset="UTF-8" action="/mgm01/user/login"
						data-form-nonce="daae48f166e18dc21a9273b9b40f0cfd6b26cc8f"
						method="post">
						<div style="margin: 0; padding: 0; display: inline">
							<input name="utf8" type="hidden" value="✓"><input
								name="authenticity_token" type="hidden"
								value="FCAVjKXObkLsmIXTZYS+sw2xHUZvz5fXr1ABUwUZn8cVarp6cGCxCrfJMx8Z51iPcFZmoZyVPV/z/REDg6AP8Q==">
						</div>
						<div class="auth-form-header">
							<h1 align="center">MGM01</h1>
						</div>
						<div class="auth-form-body">
							<label for="login_field"> 사용자 아이디 </label> <input
								autocapitalize="off" autocorrect="off" autofocus="autofocus"
								class="input-block" id="id" name="id" tabindex="1" type="text">
							<label for="password"> 비밀번호 <a href="/mgm01/user/pass_loose.it">(비밀번호를
									잃어버리셨나요?)</a>
							</label> <input class="input-block" id="password" name="password"
								tabindex="2" type="password"> <input id="return_to"
								name="return_to" type="hidden"> <input class="btn"
								data-disable-with="Signing in…" name="commit" tabindex="3"
								type="submit" value="로그인"> <input class="btn"
								data-disable-with="register in…" name="commits" tabindex="10"
								type="button" value="MGM 회원이 아니신가요?"
								onclick="location.href='user/register'">
						</div>
					</form>
				</div>

			</div>
		</div>
</body>
</html>