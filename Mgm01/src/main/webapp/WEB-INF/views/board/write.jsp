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
	<form action="/mgm01/board/write" method="POST">
	<input type="hidden" name="type" value="${type }"/>
	<table>
		<tr>
			<td>제목</td>
			<td><input type="text" name="title" /></td>
		</tr>	
		<tr>
			<td>내용</td>
			<td><textarea rows="15" cols="15" name="content"></textarea></td>
		</tr>
		<tr>
			<td><input type="submit" value="확인" /></td>
			<td><a href="/mgm01/board/${type }" ><button >취소</button></a></td>
		</tr>		
	</table>
	</form>
</body>
</html>