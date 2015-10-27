/**
 * 
 */
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

this.changeColor = function (cell, dividend)
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
			}
			else if(a.name=="lr"){
				betting_lr=a.value;
				result = "좌우" + ": "+ a.value;
			}
			else if(a.name=="line"){
				betting_line=a.value;
				result = "사다리 수" + ": "+ a.value;
			}
			printSpan("betting_"+a.name, result);
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
	    	  alert("good?");
	    	  alert(msg);
			   location.reload();
			   },
	      error :function(msg) { // 댓글작성이 성공하면
			   alert("배팅에 실패하셨습니다.");
	      		alert(msg);
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