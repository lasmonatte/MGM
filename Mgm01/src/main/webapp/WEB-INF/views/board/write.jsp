<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>새 글 쓰기</title>
<link rel="stylesheet" type="text/css" href="/mgm01/resources/css/table-dark-styles.css" />
</head>
<body>
<div id="container" align="center">  
    <div class="transparency"> 	
    </div>  
    <div class="content">  
    	<h2 style="color:#C98500;"> 새 글 쓰 기 </h2> 
	<form action="/mgm01/board/write" method="POST">
	<input type="hidden" name="type" value="${type }"/>
	<table class="dark" width="50%">
		<tr>
			<th style="height: 10%">제목</th>
			<td><input type="text" name="title" style="width: 97%; height: 50%"/></td>
		</tr>	
		<tr>
			<th style="background-repeat: repeat-y;">내용</th>
			<td><textarea name="content" style="height: 200px; width: 97%"></textarea></td>
		</tr>
		<tr>
			<td colspan="2">
				<button style="width: 20%">확인</button>
				<a href="/mgm01/board/${type }" ><button type="button" style="width: 20%">취소</button></a>
				</td>
		</tr>		
	</table>
	</form>
	</div>
</div>
</body>
</html>