<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script language="javascript">
	var cash = ${cash };
	var total_money = 0;
	var total_dividend = 1;
	var expect_money = 0;
	var game_list = new Array();
	var gameType_list = new Array();
	var str = new Array();
	var betting_oe = null;
	var betting_lr = null;
	var betting_line = null;
	
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
	
	function maxBetting(money){
		alert(money);
		total_money=money;
		var result = numberWithCommas(total_money);
		printSpan("total_money", result);
		expectMoney();
	}
	
	function expectMoney(){
		expect_money=total_money*total_dividend;
		var result = numberWithCommas(expect_money);
		printSpan("expect_money", result);
	}

	
	function oneCheckbox(a, name, value, dividend){
		var obj = document.getElementsByName(name);
		var result = name + ":"+ value;
		if(gameType_list.indexOf(name)==-1){
			total_dividend *= dividend;
			gameType_list.push(name);
		}
	
		for(var i=0; i<obj.length; i++){
			if(obj[i] != a){
				obj[i].checked = false;
				if(name=="oe")
					betting_oe=value;
				else if(name=="lr")
					betting_lr=value;
				else if(name=="line")
					betting_line=value;
				printSpan("betting_"+name, result);
			}
			if(a.checked==false && obj[i].checked==false){
				if(name=="oe")
					betting_oe=null;
				else if(name=="lr")
					betting_lr=null;
				else if(name=="line")
					betting_line=null;
				$("#betting_"+name).empty();
				total_dividend /= dividend;
				gameType_list.checkAndReplace(name, "");
				break;
			}
		}
	
		if(total_dividend<=1)
			total_dividend=1;
		
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
		      success : function() { // 댓글작성이 성공하면
				   alert("배팅에 성공하셨습니다.");
				   location.reload();
				   },
		      error :function() { // 댓글작성이 성공하면
				   alert("배팅에 실패하셨습니다.");
				}
		   })
		   
		}
	
	function printSpan(id, result){
		$("#"+id).empty();
		$("#"+id).append("<span>"+result+"</span>");
	}
	
	function numberWithCommas(x) {
	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
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
    
    #betting_info {
        position:absolute;
        left:20%;
        top:20%;
        margin-top:200px;
        margin-left:-200px;
      
        background-color: yellow;
    }
            
    </style>
</head>
<body>
	<form  method="POST" id="fff">
	<div style='width:810px; height:555px; overflow:hidden;text-align:center; margin-top:5%; margin-left: 25% '>
		<iframe style='position:relative; top:-70px; left:-10px;' src='http://named.com/game/ladder/v2_index.php' 
				id='named-ladder' name='named-ladder' width='830' height='617' scrolling='no' frameborder='0'></iframe>
	</div>
	<!-- Float -->
	<div id="floatDiv">
		<div style="height:60px;line-height:80px;">
			<label><input type="checkbox" id="cart">카트고정</label>
			<label>MGM</label>
		</div>
		<table cellpadding="8" cellspacing="0" border="0" width="100%" id="betting_context">
		<tbody>
			<tr>
				<td width="100"><div>보유금액</div></td>
				<td align="right"><div><fmt:formatNumber value="${cash }" pattern="###,###,###,###,###,###,###"/></div></td>
			</tr>
			<tr>
				<td><div>누적배당</div></td>
				<td align="right"><div id="total_dividend">1</div></td>
			</tr>
			<tr>
				<td><div>배팅상한금액</div></td>
				<td align="right"><div><fmt:formatNumber value="${bettingRuleDto.betting_max }" pattern="###,###,###,###,###"/></div></td>
			</tr>
			<tr>
				<td><div>배팅금액</div></td>
				<td align="right"><div id="total_money">0</div></td>
			</tr>
			<tr>
				<td><div>예상당첨금</div></td>
				<td align="right"><div id="expect_money" >0</div></td>
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
		<div style="margin-top:1px;text-align:center;" id="betting_max">
<!-- 		<img src="../skin/member/lion/img/btn-max.png" onclick="max_bet();" style="cursor: pointer;"> -->
			<input type="button" value="최대금액" onclick="maxBetting()"/>
		</div>
		<div style="margin-top:5px;text-align:center;" id="betting_action">
<!-- 		<img src="../skin/member/lion/img/btn-betting.png" onclick="betting()" style="cursor: pointer;"> -->
			<input type="button" value="배팅" onclick="betting()"/>
		</div>
		<div style="height:182px;margin-top:5px;width:203px;margin-left:6px;" id="betting_list">
			<div id="betting_oe"></div>
			<div id="betting_lr"></div>
			<div id="betting_line"></div>
		</div>
    </div>
    
    <div id="betting_info" >
		<iframe  src='/mgm01/game/betlist_inner' 
				id='betting_list' name='betting_list' width='300' height='850' scrolling='no' frameborder="0">
		</iframe>
	</div>
    
    <!-- 테이블 -->
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