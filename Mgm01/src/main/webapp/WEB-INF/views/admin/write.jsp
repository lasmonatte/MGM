<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>새 글 쓰기</title>
</head>
<body>
<div id="content" align="center">
	<div id="main" align="center">
		<div class="full_w">
				<h2>새 글 쓰 기</h2>
			<div class="entry">
			<div class="sep"></div>
			</div>
	<form action="/mgm01/admin/board_write" method="POST">
	<input type="hidden" name="type" value="${type }"/>
	<table align="center">
		<tr>
			<th class="write" >제목</th>
			<td><input type="text" name="title" style="width: 99%"/></td>
		</tr>	
		<tr>
			<th class="write">내용</th>
			<td><textarea rows="15" name="content" style="width: 99%"></textarea></td>
		</tr>
	</table>
	<div align="center">
		<input type="submit" value="확인" style="width: 10%;" />
		<a href="/mgm01/admin/board_write?type=${type }" >
		<input type="button" value="취소" style="width: 10%;"/></a>
	</div>
	</form>
		</div>
	</div>
</div>
				
	
</body>
</html>