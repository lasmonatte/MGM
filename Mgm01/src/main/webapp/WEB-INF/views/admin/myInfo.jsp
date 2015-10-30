<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<div id="content" align="center">
<sec:authorize access="hasRole('ROLE_ADMIN')">
		<div id="main" align="center">
			<div class="full_w">
				<h2>총 판 현 황</h2>
				<!-- list로  all, charge, exchange, win, lose -->
				<div class="entry">
					<div class="sep"></div>
				</div>
				<table>
					<thead>
						<tr>
							<th scope="col">아이디</th>
							<th scope="col">총액</th>
							<th scope="col">충전총액</th>
							<th scope="col">환전총액</th>
							<th scope="col">배팅총액</th>
							<th scope="col">당첨총액</th>
							<th scope="col">유저수</th>
						</tr>
					</thead>
					<tbody align="center">
						<tr>
							<td>${dto.id }</td>
							<td>
								<fmt:formatNumber value="${dto.total_cash }" pattern="###,###,###,###,###,###,###"/>
							</td>
							<td style="color:blue">
								<fmt:formatNumber value="${dto.total_charge }" pattern="###,###,###,###,###,###,###"/>
							</td>
							<td style="color:red">
								<fmt:formatNumber value="${dto.total_exchange }" pattern="###,###,###,###,###,###,###"/>
							</td>
							<td  style="color:brown">
								<fmt:formatNumber value="${dto.total_betting }" pattern="###,###,###,###,###,###,###"/>
							</td>
							<td style="color:orange">
								<fmt:formatNumber value="${dto.total_win }" pattern="###,###,###,###,###,###,###"/>
							</td>
							<td>${dto.total_user }</td>
						</tr>
					</tbody>
				</table>
				<div class="entry">
					<div class="sep"></div>		
				</div>
			</div>
		</div>
		<div class="clear"></div>
	</sec:authorize>
		</div>
		<div  align="center">
		<div id="main" style="width: 90%; text-align: center;">
			<div class="full_w">
				<h2>수 수 료 현 황</h2>
				<!-- list로  all, charge, exchange, win, lose -->
				<div class="entry">
					<div class="sep"></div>
				</div>
				<div align="center">
				<table>
					<thead>
						<tr>
							<th scope="col">누적 수수료</th>
							<th scope="col">현재 수수료</th>
							<th scope="col">최근 수령일</th>
							<th scope="col">배당비율</th>
						</tr>
					</thead>
					<tbody align="center">
						<tr>
							<td>
								<fmt:formatNumber value="${dto.total_salary }" pattern="###,###,###,###,###,###,###"/>
							</td>
							<td>
								<fmt:formatNumber value="${dto.salary }" pattern="###,###,###,###,###,###,###"/>
							</td>
							<td>
								<fmt:formatDate value="${dto.date_salary }" pattern="yy년 MM월 dd일 HH시 mm분 ss초"/>
							</td>
							<td>${dto.dividend }</td>
						</tr>
					</tbody>
				</table>
				</div>
				<div class="entry">
					<div class="sep"></div>		
				</div>
			</div>
		</div>
		<div class="clear"></div>
	</div>
</body>
</html>