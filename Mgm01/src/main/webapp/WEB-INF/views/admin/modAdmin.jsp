<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	function check(type, info){
		switch (type) {
		case "create":
			if(confirm("총판을 생성하시겠습니까?"))
				location.href("/mgm01/admin/createAdmin?id="+info);
			break;
		case "update":
			if(confirm("배당금을 주셨습니까?"))
				location.href("/mgm01/admin/updateAdmin?type=salary&id="+info);
			break;
		case "delete":
			if(confirm("해당 총판을 삭제하시겠습니까?"))
				location.href("/mgm01/admin/deleteAdmin?admin_num="+info);
			break;
		}
	}
</script>
</head>
<body>
<div id="content" align="center">
	
		<div id="main" align="center">
			<div class="full_w">
				<h2>총 판 관 리</h2>
				<!-- list로  all, charge, exchange, win, lose -->
				<p>
				배당금은 마지막 결산 후 현재까지의 배당금 총액입니다.<br />
				배당금을 주신 후 배당금주기 버튼을 눌러주세요<br />
				총판생성시 초기비밀번호는 해당아이디와 같습니다.<br />
				삭제버튼을 누르면 해당 총판을 삭제할 수 있습니다.<br />
				총판 삭제시 해당 총판에 소속된 유저 정보는 전부 삭제됩니다.<br />
				배울 형식은 X.XX 혹은 X.X입니다.<br />
				</p>
				<div class="entry">
					<div class="sep"></div>
				</div>
				<table>
					<thead>
						<tr>
							<th scope="col">아이디</th>
							<th scope="col">누적배당금</th>
							<th scope="col">배당금</th>
							<th scope="col">배율</th>
							<th scope="col">최근 배당일자</th>
							<th scope="col">배당금주기</th>
							<th scope="col" style="width: 65px;">삭제</th>
							<th scope="col">배율변경</th>
						</tr>
					</thead>
					<tbody align="center">
					<c:forEach var="item" items="${list }">
						<tr>
							<td>
								${item.id }
							</td>
							<td>
								${item.total_salary }
							</td>
							<td>
								${item.salary }
							</td>
							<td>
								${item.dividend }
							</td>
							<td>
								${item.date_salary }
							</td>
							<td>
								<c:if test="${item.salary ne 0 }">
								<input type="button" src="javascript:check('update', ${item.id })"
									value="배당금주기" />
								</c:if>
							</td>
							<td>
								<a href="javascript:check('delete', ${item.admin_num });"
									 class="table-icon delete" title="삭제하기"></a>
							</td>
							<td width="100px">
							<form action="/mgm01/admin/updateAdmin" 
									style="margin: 0px; padding: 0px; width: 100%">
								<input type="hidden" name="type" value="dividend"/>
								<input type="hidden" name="id" value=${item.id } />
								<input type="text" name="dividend" value=${item.dividend }
									maxlength="4" size="5" pattern="[0-9]{1}.[0-9]{2}"
									title="X.XX 혹은 X.X"/>&nbsp;
								<input type="submit" value="변경" />
							</form>
							</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
				<table style="width: 30%; text-align: center;">
				<thead>
					<tr>
						<th colspan="2" class="write">
							총 판 생 성
						</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th class="write">아이디</th>
						<td>
						<form action="/mgm01/admin/createAdmin" 
									style="margin: 0px; padding: 0px; width: 100%">
								<input type="text" name="id" maxlength="20" size="20"/>&nbsp;
								<input type="submit" value="생성" />
						</form>	
						</td>
					</tr>
				</tbody>				
				</table>

				<div class="entry">
					<div class="pagination">
					<c:forEach var="num" begin="1" end="${size }">
						<c:choose>
						<c:when test="${param.start eq null and num eq 1 }">
							<span>처음으로</span>
							<span class="active">${num }</span>
						</c:when>
						<c:when test="${num ne param.start }">
							<a href="/mgm01/admin/AdminInfo?start=${num }&type=${type }"><b>${num }</b></a>
						</c:when>
						<c:otherwise>
							<span class="active">${num }</span>
						</c:otherwise>
					</c:choose>
					</c:forEach>
					</div>
					<div class="sep"></div>		
				</div>
			</div>
		</div>
		<div class="clear"></div>
		</div>
</body>
</html>