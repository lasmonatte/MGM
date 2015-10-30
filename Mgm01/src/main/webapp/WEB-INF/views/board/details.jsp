<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="/mgm01/resources/css/table-dark-styles.css" />
<script type="text/javascript">
	function toList(type) {
		location.href=type;

// 		window.open(loc, "dts", "parent=opener,width=400,height=600,", false);
		// 띄울 경로 , 윈도우 프레임이름, 기타옵션
	}
</script>
</head>
<body>
<div id="container" align="center">  
    <div class="transparency" > 	
    </div>  
    <div class="content"> 
    	<center><h2 style="color:#C98500;"> 글 상 세 보 기 </h2></center> 
    <form action="/mgm01/board/reply_write" method="POST"> 
    <input type="hidden" name="board_num" value="${boardDto.board_num }"/>
	<input type="hidden" name="nickname" value="${boardDto.nickname }"/>
	<table class="dark" width="60%">
		<tr>
			<th width="20%" colspan="3" style="height: 2%; text-align: left;"><font size="2">작성일자</font>
			 : <font color="white"><fmt:formatDate value="${boardDto.date }" pattern="yyyy/MM/dd HH:mm" /></font></th>
		</tr>
		<tr >
			<th colspan="3" style="height: auto; text-align: left;"><font size="2">글제목</font> : <font color="white">${boardDto.title }</font></th>
		</tr>
		<tr>
			<th colspan="3" style="text-align: left;"><font size="2">닉네임 </font>: <font color="white">${boardDto.nickname }</font></th>
		</tr>	
		<tr >
			<td colspan="3"  style="height: 200px; width: 97%; padding: 3%" align="left" valign="top">${boardDto.content }</td>
		</tr>
		<c:if test="${boardDto.type eq 'customer' }">
		<tr >
			<th colspan="3">댓글</th>
		</tr>
		<c:forEach var="reply" items="${replyList }">
		<tr>
			<td>${reply.content }</td>
			<td>${reply.nickname }</td>
			<td width="13%">
				<fmt:formatDate value="${reply.date }" pattern="yy/MM/dd HH:mm" type="both"/>
			</td>
		</tr>	
		</c:forEach>
		<tr valign="middle">
			<td><textarea name="content" style="height: 80%; width: 100%"></textarea> </td>
			<td colspan="2"><button style="width: 100%; vertical-align: middle; ">댓글입력</button>
			</td>
		</tr>
		</c:if>
	</table>
	</form>
	<input type="button" class="button" value="목록으로" onclick="toList('${boardDto.type }')" style="width: 20%;" />
</div>
</div>
</body>
</html>