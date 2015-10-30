<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="/mgm01/resources/css/table-dark-styles.css" />
 <script type="text/javascript">
 var cash = ${cash };
 var total_money = 0;
 var total_dividend = 1;
 var expect_money = 0;
 var max_money = ${bettingRuleDto.betting_max };
 var game_list = new Array();
 var gameType_list = new Array();
 var str = new Array();
 var betting_oe = null;
 var betting_lr = null;
 var betting_line = null;

 function changeColor(cell, dividend)
 {
 	var checked = cell.getElementsByTagName('input')[0].checked;
 	
 	if(!checked){
 		cell.getElementsByTagName('input')[0].checked = true;
 		cell.style.background = "url('../resources/images/btn_active.png') center center";
 	}
 	else{
 		cell.getElementsByTagName('input')[0].checked = false;
 		cell.style.background = "#1c1c1c";
 	}
 	
 	oneCheckbox(cell.getElementsByTagName('input')[0], dividend);
     //cell.style.color = black;
     
 }

 function changeColor2(cell)
 {
 	var checked = cell.getElementsByTagName('input')[0].checked;
 	
 	if(checked)
 		cell.style.background = "url('../resources/images/btn_active.png') center center";
 	else
 		cell.style.background = "#1c1c1c";
     
 }

 function addMoney(money){
 	if(total_money+money>cash)
 		alert("현재 보유캐시를 초과하여 베팅할 수 없습니다.\n"+"현재 보유캐시 : " + max_money);
 	else if(total_money+money> 3000000)
 		alert("300만원을 초과할 수 없습니다.");
 	else 
 		total_money+=money;

 	var result = numberWithCommas(total_money);
 	printSpan("total_money", result);
 	expectMoney();
 }

 function maxBetting(){
 	
 	if(cash>max_money)
 	total_money=max_money;
 	else
 		total_money=cash;
 	var result = numberWithCommas(total_money);
 	printSpan("total_money", result);
 	expectMoney();
 }

 function expectMoney(){
 	expect_money=total_money*total_dividend;
 	var result = numberWithCommas(expect_money);
 	printSpan("expect_money", result);
 }


 function oneCheckbox(a,dividend){
 	var obj = document.getElementsByName(a.name);
 	var result = null;
 	var nn;
 	if(gameType_list.indexOf(a.name)==-1){
 		total_dividend *= dividend;
 		gameType_list.push(a.name);
 	}

 	for(var i=0; i<obj.length; i++){
 		if(obj[i] != a){
 			obj[i].checked = false;
 			changeColor2(obj[i].parentNode.parentNode);
 			if(a.name=="oe"){
 				betting_oe=a.value;
 				result = "홀짝" + ": "+ a.value;
 				nn="홀짝";
 			}
 			else if(a.name=="lr"){
 				betting_lr=a.value;
 				result = "좌우" + ": "+ a.value;
 				nn="좌우";
 			}
 			else if(a.name=="line"){
 				betting_line=a.value;
 				result = "사다리 수" + ": "+ a.value;
 				nn="사다리수";
 			}
 			printSpan2("betting_"+a.name, nn, a.value);
 		}
 		if(a.checked==false && obj[i].checked==false){
 			if(a.name=="oe")
 				betting_oe=null;
 			else if(a.name=="lr")
 				betting_lr=null;
 			else if(a.name=="line")
 				betting_line=null;
 			$("#betting_"+a.name).empty();
 			total_dividend /= dividend;
 			gameType_list.checkAndReplace(a.name, "");
 			break;
 		}
 	}

 	if(total_dividend<=1)
 		total_dividend=1;
 	total_dividend = total_dividend.toFixed(2);
 	printSpan("total_dividend", total_dividend);
 	
 	expectMoney();
 }

 // contains 메소드 추가
 Array.prototype.checkAndReplace = function(oldOne, newOne) {
 	for (var i = 0; i < this.length; i++) {
 		if (this[i] == oldOne) {
 			this[i] = newOne;
 			return true;
 		}
 	}
 	return false;
 }

 function betting() { // 일단 popup에서만 작동함 - feed_init(feed_num) 작성필요
 	if($('#betting_oe').length==0 && $('#betting_lr').length==0 && $('#betting_line').length==0)
 		alert("배팅 종목을 선택해야합니다.")
 	else if(total_money==0)
 		alert("금액을 선택하셔야합니다.")
 	else{
	 cash-=total_money;
 	$.ajax({ // feed_num과 input으로 댓글작성하는 inner 작동.
 	      method : 'POST', // post!
 	      url : '/mgm01/betting/new', // url
 	      data : { // 데이타!
 	         betting_money : total_money,
 			 expect_money : expect_money,
 			 dividend : total_dividend,
 			 betting_oe : betting_oe,
 			 betting_lr : betting_lr,
 			 betting_line : betting_line,
 			 cash : cash
 	      },
 	      success : function(msg) { // 댓글작성이 성공하면
 	    	  alert(msg);
 			   location.reload();
 			   },
 	      error :function(msg) { // 댓글작성이 성공하면
 			   alert("배팅에 실패하셨습니다.");
 			}
 	   })
 	}
 	}

 function printSpan(id, result){
 	$("#"+id).empty();
 	$("#"+id).append("<span>"+result+"</span>");
 }
 function printSpan2(id, name, value){
	 	;
	 	$('#'+id).remove();
	 	 $('#betTable > tbody:last').append('<tr id='+id+'><th width="40%">'+name+'</th><td style="color:gold"}>'+value+'</td></tr>');
	 	
	 }

 function numberWithCommas(x) {
     return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
 }
 </script>
</head>
<body>
<div id="container" align="center">  
    <div class="transparency">  
    </div>  
    <div class="content">  
<!--     <h2>사 다 리 게 임</h2> -->
  	<table border="0" width="95%" style="margin-top:2%;">
	<tbody>
		<tr>
			<td width="35%" rowspan="2" align="center" valign="top">
				<iframe  src='/mgm01/game/betlist_inner'  
					id='betting_list' name='betting_list' width='95%' height='950' scrolling='no' frameborder="0">
				</iframe>
			</td>
			<td width="55%" align="left" valign="top">
				<div style='width:810px; height:555px; overflow:hidden;text-align:center;'>
				<iframe style='position:relative; top:-70px; left:-10px;' src='http://named.com/game/ladder/v2_index.php' 
					id='named-ladder' name='named-ladder' width='830' height='617' scrolling='no' frameborder='0'></iframe>
				</div>
			</td>
			<td width="15%" valign="top" rowspan="2">
				<div>
				<table width="100%" class="dark" id="betting_context">
				<tbody>
					<tr>
					
						<td width="40%" style="border-right:3px solid #000000;">
							<div>보유금액</div>
						</td>
						<td width="60%" align="right" style="border-right:3px solid #1a1a1a;">
							<div><fmt:formatNumber value="${cash }" pattern="###,###,###,###,###,###,###"/></div>
						</td>
					</tr>
					<tr>
						<td style="border-right:3px solid #000000;">
							<div>누적배당</div>
						</td>
						<td align="right">
							<div id="total_dividend">1</div>
						</td>
					</tr>
					<tr>
						<td style="font-size: small; color: red; border-right:3px solid #000000;">
							<div>배팅상한금액</div>
						</td>
						<td align="right" style="color: red;">
							<div><fmt:formatNumber value="${bettingRuleDto.betting_max }" pattern="###,###,###,###,###"/>
						</div></td>
					</tr>
					<tr>
						<td style="border-right:3px solid #000000;">
							<div>배팅금액</div>
						</td>
						<td align="right">
							<div id="total_money">0</div>
						</td>
					</tr>
					<tr>
						<td style="border-right:3px solid #000000; color:gold;">
							<div>예상당첨금</div>
						</td>
						<td align="right" style="color:gold;">
							<div id="expect_money" >0</div>
						</td>
					</tr>
				</tbody>
				</table>
				<table cellpadding="0" cellspacing="7" border="0" width="100%">
				<tbody>
				<tr>
					<td><input type="button" class="button" onclick="addMoney(10000)" value="10,000" /></td>
					<td><input type="button" class="button" onclick="addMoney(50000)" value="50,000"/></td>
					<td><input type="button" class="button" onclick="addMoney(100000)" value="100,000"/></td>
				</tr>
				<tr>
					<td><input type="button" class="button" onclick="addMoney(300000)" value="300,000"/></td>
					<td><input type="button" class="button" onclick="addMoney(500000)" value="500,000"/></td>
					<td><input type="button" class="button" onclick="addMoney(1000000)" value="1,000,000"/></td>
				</tr>
				</tbody>
				</table>
				</div>
				<div>
				<table border="0" width="100%" style="padding-bottom: 1%;">
				<tbody>
					<tr>
						<td align="center">
						<div id="betting_max">
							<img src="/mgm01/resources/images/btn_max.png" onclick="maxBetting();"
								style="cursor: pointer; width: 80%">
						</div>
						</td>
					</tr>
					<tr>
						<td align="center">
						<div id="betting_action">
							<img src="/mgm01/resources/images/btn_betting.png" onclick="betting()" 
								style="cursor: pointer; width: 80%">
						</div>				
						</td>
					</tr>
				</tbody>
				</table>
				</div>
				<table style="margin-top: 10%;" width="100%" class="dark" id="betTable">
				<tbody>
					<tr>
						<th colspan="2"><h4>배 팅 상 세</h4></th>
					</tr>
				</tbody>
				</table>
			</td>
		</tr>
  		<tr>
  			<td>
  			<table width="90%" border="0" class="dark " id="betting_table" align="left">
			<tbody>
				<tr>
					<th colspan="2"><div>홀짝</div></th>
				</tr>
				<tr>
					<td style="border-right:5px solid #1a1a1a;" onclick="changeColor(this, ${bettingRuleDto.dividend_oe })">
						<div style="visibility: hidden; width: 0; height: 0;">
							<input type="checkbox" name="oe" value="홀" />
						</div>
						홀 [${bettingRuleDto.dividend_oe }]
					</td>
					<td onclick="changeColor(this, ${bettingRuleDto.dividend_oe })">
					<div style="visibility: hidden; width: 0; height: 0;">
						<input type="checkbox" name="oe" value="짝" />
					</div>
						짝 [${bettingRuleDto.dividend_oe }]
					</td>
				</tr>
				<tr>
					<th colspan="2"><div>좌우</div></th>
				</tr>
				<tr>
					<td style="border-right:5px solid #1a1a1a;" onclick="changeColor(this, ${bettingRuleDto.dividend_lr })">
						<div style="visibility: hidden; width: 0; height: 0;">
							<input type="checkbox" name="lr" value="좌" />
						</div>
						좌 [${bettingRuleDto.dividend_lr }]
					</td>
					<td onclick="changeColor(this, ${bettingRuleDto.dividend_lr })">
						<div style="visibility: hidden; width: 0; height: 0;">
							<input type="checkbox" name="lr" value="우" />
						</div>
						우 [${bettingRuleDto.dividend_lr }]
					</td>
				</tr>
				<tr>
					<th colspan="2"><div>사다리수</div></th>
				</tr>
				<tr>
					<td style="border-right:5px solid #1a1a1a;" onclick="changeColor(this, ${bettingRuleDto.dividend_line })">
						<div style="visibility: hidden; width: 0; height: 0;">
							<input type="checkbox" name="line" value="3" />
						</div>
						3개  [${bettingRuleDto.dividend_line }]
					</td>
					<td onclick="changeColor(this, ${bettingRuleDto.dividend_line })">
						<div style="visibility: hidden; width: 0; height: 0;">
							<input type="checkbox" name="line" value="4" />
						</div>
						4개  [${bettingRuleDto.dividend_line }]
					</td>
				</tr>
			</tbody>
			</table>	
  			</td>
  		</tr>
  	</tbody>
  	</table>
  	</div>
</div>  
</body>
</html>