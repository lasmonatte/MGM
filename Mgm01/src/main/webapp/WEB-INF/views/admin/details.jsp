<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	function toList(type) {
		var url = "/mgm01/admin/board?type=" + type;
		location.href=url;

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
	<form action="/mgm01/admin/reply_write" method="POST">
	<table>
		<tr>
			<th scope="col">제목</th>
			<td colspan="3">${boardDto.title }</td>
		</tr>
		<tr>
			<th width="10%" scope="col">작성자</th>
			<td width="60%">${boardDto.nickname }</td>
			<th width="10%" scope="col">작성일자</th>
			<td>${boardDto.date }</td>
		</tr>	
		<tr>
			<th scope="col" colspan="4">내용</th>
		</tr>
		<tr>
			<td align="center" colspan="4">${boardDto.content }</td>
		</tr>
		<c:if test="${boardDto.type ne 'notice'}">
		<tr>
			<th scope="col" colspan="4">댓글</th>
		</tr>
		<c:forEach var="reply" items="${replyList }">
		<tr>
			<td></td>
			<td>${reply.content }</td>
			<td>${reply.nickname }</td>
			<td>${reply.date }</td>
		</tr>	
		</c:forEach>
		<tr>
			<td colspan="4">
				<textarea name="content" style="width: 100%" rows="5"></textarea>
			</td>
		</tr>
		<tr align="center">
			<td colspan="4">
				<input type="hidden" name="board_num" value="${boardDto.board_num }"/>
				<input type="hidden" name="nickname" value="${boardDto.nickname }"/>
				<input type="submit" value="댓글입력" style="width: 20%"/>
			</td>
		</tr>
		</c:if>
	</table>
	</form>
	<input type="button" value="목록으로" onclick="toList('${boardDto.type }')"
	 		style="width: 20%; margin-bottom: 5%" />
	 		<div class="sep">
	 			
	 		</div>		
			</div>
		</div>
		<div class="clear"></div>
</div>

</body>
</html>