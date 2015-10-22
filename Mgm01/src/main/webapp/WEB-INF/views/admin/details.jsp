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
	<div id="content" align="center">
		<div id="main" align="center">
			<div class="full_w">
				<h2>글 상세보기</h2>
				
				<div class="entry">
					<div class="sep"></div>
				</div>
				<table>
		<tr>
			<th scope="col">제목</th>
			<td colspan="3">${boardDto.title }</td>
		</tr>
		<tr>
			<th scope="col" width="10%" >작성자</th>
			<td width="30%" >${boardDto.nickname }</td>
			<th scope="col" width="20%" >작성일자</th>
			<td width="40%">${boardDto.date }</td>
		</tr>	
		<tr>
			<th scope="col" colspan="4">내용</th>
		</tr>
		<tr>
			<td align="center" colspan="4">${boardDto.content }</td>
		</tr>
		<c:if test="${boardDto.type ne 'notice'}">
		<tr>
			<td align="center" colspan="4">댓글</td>
		</tr>
		<tr>
			<td colspan="3"><textarea rows="4" cols="180"  ></textarea></td>
			<td><input type="submit" value="댓글입력" /></td>
		</tr>
		</c:if>
	</table>
	<input type="button" value="목록으로" onclick="toList('${boardDto.type }')" />
		</div>
	</div>
</div>

</body>
</html>