<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	function toList(type) {
		location.href=type;

// 		window.open(loc, "dts", "parent=opener,width=400,height=600,", false);
		// 띄울 경로 , 윈도우 프레임이름, 기타옵션
	}
</script>
</head>
<body>
	<table>
		<tr>
			<td>${boardDto.title }</td>
		</tr>
		<tr>
			<td>작성자</td>
			<td>${boardDto.nickname }</td>
			<td>작성일자</td>
			<td>${boardDto.date }</td>
		</tr>	
		<tr>
			<td>내용</td>
			<td>${boardDto.content }</td>
		</tr>
		<tr>
			<td>댓글</td>
		</tr>
		<tr>
			<td><textarea rows="5" cols="20" ></textarea></td>
			<td><input type="submit" value="댓글입력" /></td>
		</tr>
		<tr>
			<td><button onclick="toList('${boardDto.type }')">목록으로</button></td>
		</tr>		
	</table>
</body>
</html>