<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
</head>
<body>
<script>
var total=1110;
function resl(){
	document.write(total);
}
function addMoney(money){
	
	total+=money;
}
function doMath() {
    var totalparts = parseInt(document.getElementById('parts_input').value);
    var labor = parseInt(document.getElementById('labor_input').value);
    var misc = parseInt(document.getElementById('misc_input').value);
    var subtotal = totalparts + labor + misc;
    var tax = subtotal * .13;
    var total = subtotal + tax;

    document.getElementById('subtotal_input').value = subtotal;
    document.getElementById('tax_input').value = tax;
    document.getElementById('total_input').value = total;
}
</script>

<div>Total Parts: <input type="text" id="parts_input" value="1" readonly="true" /></div>
<div>Labor: <input type="text" id="labor_input" onBlur="doMath();" /></div>
<div>Misc: <input type="text" id="misc_input" onBlur="doMath();" /></div>
<div>Sub Total: <input type="text" id="subtotal_input" readonly="true" /></div>
<div>Tax: <input type="text" id="tax_input" readonly="true" /></div>
<div>Total: <input type="text" id="total_input" readonly="true" /></div>
<div><input type="button" onclick="addMoney(1000)"></div>
<input type="button" onclick="resl()">
</body>
</html>
