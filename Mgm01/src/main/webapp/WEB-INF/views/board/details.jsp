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
<div align="center">
	<table class="table">
		<tr class="tr">
			<th class="th">제목</th>
			<th class="th" colspan="3">${boardDto.title }</th>
		</tr>
		<tr class="tr">
			<td class="td">작성자</td>
			<td class="td">${boardDto.nickname }</td>
			<td class="td">작성일자</td>
			<td class="td">${boardDto.date }</td>
		</tr>	
		<tr class="tr">
			<td class="td" colspan="4">내용</td>
		</tr>
		<tr class="tr">
			<td class="td" colspan="4">${boardDto.content }</td>
		</tr>
		<tr class="tr">
			<td class="td" colspan="4">댓글</td>
		</tr>
		<tr class="tr">
			<td class="td" colspan="3"><textarea rows="4" cols="180"  ></textarea></td>
			<td class="td"><input type="submit" value="댓글입력" /></td>
		</tr>
	</table>
	<input type="button" value="목록으로" onclick="toList('${boardDto.type }')" />
</div>
</body>
</html>