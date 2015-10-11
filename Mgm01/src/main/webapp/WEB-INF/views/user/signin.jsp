<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<style>
.w600 {
	width: 600px;
}

.w500 {
	width: 500px;
}

.w300 {
	width: 300px;
}

.w100 {
	width: 100px;
}

.he400 {
	height: 400px;
}

.he40 {
	height: 40px;
}

.w200 {
	width: 200px;
}

.fleft {
	float: left;
}

.fright {
	float: right;
}

.m5 {
	margin: 5px;
}
</style>


<h2>회원가입</h2>
<hr />
<form action="/AppleMango/user/register.it" method="post" id="register">

	<div class="register w600 he400">
		<div class="reg_id w600 he40">
			<div class="fleft w100 he40">
				<div class="m5">아이디</div>
			</div>
			<div class="fright w300 he40">
				<b class="m5" style="margin-left: 20; color: red;" id="id_noti">아이디는
					변경이 불가능합니다.</b>
			</div>
			<div class="fright w200 he40">
				<input class="form-control" type="text" required name="id" id="id" />
			</div>
		</div>
		<div class="reg_pass w600 he40">
			<div class="fleft w100 he40">
				<div class="m5">비밀번호</div>
			</div>
			<div></div>
			<div class="fleft w200 he40">
				<input class="form-control" type="password" required name="password"
					id="reg_pass" />
			</div>
		</div>
		<div class="reg_id w600 he40">
			<div class="fleft w100 he40">
				<div class="m5">비밀번호 확인</div>
			</div>
			<div class="fright w300 he40">
				<b class="m5" style="margin-left: 20; color: red;"
					id="reg_pass_noti"></b>
			</div>
			<div class="fright w200 he40">
				<input class="form-control" type="password" required
					name="password_re" id="reg_pass_re" />
			</div>
		</div>
		<div class="reg_email w600 he40">
			<div class="fleft w100 he40">
				<div class="m5">이메일</div>
			</div>
			<div class="fright w300 he40">
				<b style="margin-left: 20; color: red;" id="email_noti"></b>
			</div>
			<div class="fright w200 he40">
				<input class="form-control" type="email" required name="email"
					id="email" />
			</div>
		</div>
		<div class="reg_emailCheck he40">
			<div class="fleft w100 he40">
				<div class="m5">메일수신거부</div>
			</div>
			<div class="fleft w200 he40" align="left">
				<div class="m5">
					<input type="checkbox" name="mail_rejected" id="mail_rejected"
						value="Y" />
				</div>
			</div>
		</div>
		<div class="submit">
			<input type="submit" value="회원가입" onclick="registerCheck()"
				class="btn btn-warning" /> <input type="button"
				class="btn btn-default" value="취소"
				onclick="location.href='/AppleMango/index.it'">
		</div>
	</div>

</form>
