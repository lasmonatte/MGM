<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js" type="text/javascript"></script> 
<script language="javascript">
	var total_money = 0;
	var total_dividend = 1;
	var expect_money = 0;
	var game_list = new Array();
	var gameType_list = new Array();
	var str = new Array();
	
	$(document).ready(function(){
		//on window scroll fire it will call a function.
		$(window).scroll(function () {
			//after window scroll fire it will add define pixel added to that element.
			set = $(document).scrollTop()+ 170 + "px" ;
 			//this is the jQuery animate function to fixed the div position after scrolling.
			$('#floatDiv').animate({top:set},{duration:50,queue:false});
		});
	});
	
	function addMoney(money){
		if(total_money+money> 3000000)
			alert("300만원을 초과할 수 없습니다.");
		else
			total_money+=money;
		document.getElementById('total_money').value = total_money;
		
	}
	
	function expectMoney(){
		expect_money=total_money*total_dividend;
		document.getElementById('expect_money').value = expect_money;		
	}

	function oneCheckbox(a, name, value, dividend){
		var obj = document.getElementsByName(name);
		if(gameType_list.indexOf(name)==-1){
			alert("옴");
			total_dividend *= dividend;
			gameType_list.push(name);
		}
	
		for(var i=0; i<obj.length; i++){
			if(obj[i] != a){
				obj[i].checked = false;
				$("#betting_"+name).empty();
				$("#betting_"+name).append("<span>"+name + ":"+ value +"</span><br />");
			}
			if(a.checked==false && obj[i].checked==false){
				$("#betting_"+name).empty();
				total_dividend /= dividend;
				gameType_list.checkAndReplace(name, "");
				break;
			}
		}
	
		if(total_dividend<=1)
			total_dividend=1;
		
		document.getElementById('total_dividend').value = total_dividend;
	}
	
	// contains 메소드 추가
	Array.prototype.checkAndReplace = function(oldOne, newOne) {
		for (var i = 0; i < this.length; i++) {
			if (this[i] == oldOne) {
				this[i] = newOne;
				alert("뺌");
				return true;
			}
		}
		return false;
	}
	
	function testAjax(){
		$.ajax({
			url : "/mgm01/game/betting",
			type : 'POST',
			cache : false,
			data : ${"#fff"}.serialize(),
			dataType :
		})	
		
		
	}
</script>
<style type="text/css">
   #floatDiv {
        position:absolute;
        right:10%;
        top:20%;
        margin-top:200px;
        margin-left:-200px;
        width:300px;
        height:500px;
        background-color: orange;
    }
            
    </style>
</head>
<body>
	<form action="/mgm01/game/betting" method="POST" id="fff">
	<div style='width:810px; height:555px; overflow:hidden;text-align:center; margin-top:5%; margin-left: 25% '>
		<iframe style='position:relative; top:-70px; left:-10px;' src='http://named.com/game/ladder/v2_index.php' 
				id='named-ladder' name='named-ladder' width='830' height='617' scrolling='no' frameborder='0'></iframe>
	</div>
	<div id="floatDiv">
		<div style="height:60px;line-height:80px;">
			<label><input type="checkbox">카트고정</label>
			<label>MGM</label>
		</div>
		<form action="/game/betting" method="POST">
		<table cellpadding="8" cellspacing="0" border="0" width="100%">
		<tbody>
			<tr>
				<td width="100"><div>보유금액</div></td>
				<td align="right"><div><sec:authentication property="principal.cash"/></div></td>
			</tr>
			<tr>
				<td><div>누적배당</div></td>
				<td align="right"><div><input type="text" disabled="disabled" id="total_dividend" /></div></td>
			</tr>
			<tr>
				<td><div>배팅상한금액</div></td>
				<td align="right"><div> [${bettingRuleDto.betting_max }]</div></td>
			</tr>
			<tr>
				<td><div>배팅금액</div></td>
				<td align="right"><div><input type="text" disabled="disabled" id="total_money" /></div></td>
			</tr>
			<tr>
				<td><div>예상당첨금</div></td>
				<td align="right"><div><input type="text" disabled="disabled" id="expect_money" /></div></td>
			</tr>
		</tbody>
		</table>
		<table cellpadding="0" cellspacing="7" border="0" class="m-table" width="100%">
		<tbody>
			<tr>
				<td><input type="button" onclick="addMoney(10000)" value="10,000"/></td>
				<td><input type="button" onclick="addMoney(50000)" value="50,000"/></td>
				<td><input type="button" onclick="addMoney(100000)" value="100,000"/></td>
			</tr>
			<tr>
				<td><input type="button" onclick="addMoney(300000)" value="300,000"/></td>
				<td><input type="button" onclick="addMoney(500000)" value="500,000"/></td>
				<td><input type="button" onclick="addMoney(1000000)" value="1,000,000"/></td>
			</tr>
		</tbody>
		</table>
		<div style="margin-top:1px;text-align:center;" id="">
<!-- 		<img src="../skin/member/lion/img/btn-max.png" onclick="max_bet();" style="cursor: pointer;"> -->
			맥스
		</div>
		<div style="margin-top:5px;text-align:center;" id="betting_action">
<!-- 		<img src="../skin/member/lion/img/btn-betting.png" onclick="betting()" style="cursor: pointer;"> -->
			<input type="submit" value="베팅"/>
		</div>
		<div style="height:182px;margin-top:5px;width:203px;margin-left:6px;" id="betting_list">
			<div id="betting_oe"></div>
			<div id="betting_lr"></div>
			<div id="betting_line"></div>
		</div>
		</form>
    </div>
    
    
	<table width="80%" border="1" cellpadding="0" cellspacing="0" class="betting_table " id="betting_table" align="center">

	<tbody>
		<tr>
			<td>
				<div>홀짝</div>
			</td>
			<td>
				<div>
					<input type="checkbox" name="oe" value="홀" onclick="oneCheckbox(this, this.name, this.value,
							${bettingRuleDto.dividend_oe });" />
					홀 [${bettingRuleDto.dividend_oe }]
				</div>
			</td>
			<td>
				<div>
					<input type="checkbox" name="oe" value="짝" onclick="oneCheckbox(this, this.name, this.value,
							${bettingRuleDto.dividend_oe });" />
					짝 [${bettingRuleDto.dividend_oe }]
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<div>좌우</div>
			</td>
			<td>
				<div>
					<input type="checkbox" name="lr" value="좌" onclick="oneCheckbox(this, this.name, this.value,
							${bettingRuleDto.dividend_lr });" />
						좌 [${bettingRuleDto.dividend_lr }]
				</div>
			</td>
			<td>
				<div>
					<input type="checkbox" name="lr" value="우" onclick="oneCheckbox(this, this.name, this.value,
							${bettingRuleDto.dividend_lr });" />
					우 [${bettingRuleDto.dividend_lr }]
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<div>줄갯수</div>
			</td>
			<td>
				<div>
					<input type="checkbox" name="line" value="3" onclick="oneCheckbox(this, this.name, this.value,
							${bettingRuleDto.dividend_line });" />
					3개  [${bettingRuleDto.dividend_line }]
				</div>
			</td>
			<td>
				<div>
					<input type="checkbox" name="line" value="4" onclick="oneCheckbox(this, this.name, this.value,
							${bettingRuleDto.dividend_line });" />
					4개  [${bettingRuleDto.dividend_line }]
				</div>
			</td>
		</tr>
	</tbody>
	</table>
	
</form>
</body>
</html>