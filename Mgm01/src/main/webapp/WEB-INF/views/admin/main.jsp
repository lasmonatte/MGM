<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	function userInfo(id){
		url = "/mgm01/admin/userInfo?id=" + id;
		var openNewWindow = window.open("about:blank");
		openNewWindow.location.href = url;
	}
</script>
<title>Insert title here</title>
</head>
<body>
	<h3 align="center">admin main!</h3>
	<div align="center">
		<table class="table">
		<thead>
			<tr class="tr">	
				<th class="th">
					아이디
				</th>
				<th class="th">
					이름
				</th>
				<th class="th">
					닉네임
				</th>
				<th class="th">
					전화번호
				</th>
				<th class="th">
					보유금액
				</th>
				<th class="th">
					은행
				</th>
				<th class="th">
					출금계좌
				</th>
				<th class="th">
					예금주
				</th>
				<th class="th">
					추천인
				</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${userDtoList }" var="userDto" end="${userDtoList.size() }">
			<tr class="tr" onclick="userInfo('${userDto.id}')">
				<td class="td">
					${userDto.id }
				</td>
				<td class="td">
					${userDto.name }
				</td>
				<td class="td">
					${userDto.nickname }
				</td>
				<td class="td">
					${userDto.phone }
				</td>
				<td class="td">
					${userDto.cash }
				</td>
				<td class="td">
					${userDto.b_bankname }
				</td>
				<td class="td">
					${userDto.b_account }
				</td>
				<td class="td">
					${userDto.b_username }
				</td>
				<td class="td">
					${userDto.recmd_id }
				</td>
			</tr>
			</c:forEach>
		</tbody>
		</table>
	</div>
</body>
</html>