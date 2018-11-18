var t;

//检验字符串是否是数字
function isNum(str) {
	if (str == "") {
		return false;
	}
	var s = /^[0-9]+.?[0-9]*$/;
	return s.test(str);
}

function check() {
	//检验采购单是否存在
	if ($("#purchaseOrderCode1").val() == "") {
		$("#errorModalContent").html("请添加采购单");
		$("#errorModal").css("display", "block");
		return false;
	}
	
	//检验仓库是否选择仓库
	if ($("#warehouse").html() == "选择退货仓库") {
		$("#errorModalContent").html("请选择退货仓库");
		$("#errorModal").css("display", "block");
		return false;
	}

	var flag = true;
	//检验退货数量框中输入的数值是否符合要求
	var quantitys = $("input[name='quantity']");
	$.each(quantitys, function(index, element) {
		if (!isNum($(element).val())) {
			checkNum($(element));
			flag = false;
			return false;
		}
	});

	if (!flag) {
		return false;
	}

	//检验退货金额框中输入的数值是否符合要求
	var prices = $("input[name='price']");
	$.each(prices, function(index, element) {
		
		if (!isNum($(element).val())) {
			checkNum($(element));
			flag = false;
			return false;
		}
	});

	return true;
}

//检验输入框中的值是否在范围内
function checkNum(element) {
	var name = $(element).attr("name");
	var value, max, min;
	if (name == "quantity") {

		value = parseInt($(element).val());
		max = parseInt($(element).attr("max"));
		min = parseInt($(element).attr("min"));
		if (isNaN(value)) {
			$("#showErrorTempDiv").html("退货数量 不能为空");
			$("#keeperrorModal").css("display", "block");

			clearValue($(element));
		}

		if (value > max) {
			$("#showErrorTempDiv").html("退货数量不能大于" + max);
			$("#keeperrorModal").css("display", "block");

			clearValue($(element));
		}
		if (value < min) {
			$("#showErrorTempDiv").html("退货数量不能小于" + min);
			$("#keeperrorModal").css("display", "block");

			clearValue($(element));
		}
	} else {
		value = parseFloat($(element).val());
		max = parseFloat($(element).attr("max"));
		min = parseFloat($(element).attr("min"));

		if (isNaN(value)) {
			$("#showErrorTempDiv").html("退货金额 不能为空");
			$("#keeperrorModal").css("display", "block");

			clearValue($(element));
		}

		if (value > max) {
			$("#showErrorTempDiv").html("退货金额不能大于" + max);
			$("#keeperrorModal").css("display", "block");

			clearValue($(element));
		}
		if (value < min) {
			$("#showErrorTempDiv").html("退货金额不能小于" + min);
			$("#keeperrorModal").css("display", "block");

			clearValue($(element));
		}
	}

}

//清空数值，并且弹出错误提示
function clearValue(element) {
	element.val("");

	clearTimeout(t);

	t = setTimeout(function() {
		$("#keeperrorModal").css("display", "none");
	}, 3000);

}

function closeErrorModal() {
	$("#errorModal").css("display", "none");
}