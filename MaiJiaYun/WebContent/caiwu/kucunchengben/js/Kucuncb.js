/*
 * 页面刷新处理
 */
/*  	 window.onload=function(){
 var searchCondition={ searchCondition:"*"};
 $.ajax({
 url : "/MaiJiaYun/SearchServlet",
 type : "post",
 dataType : "html", 
 data:searchCondition,
 success:function(){
 }
 });
 };   */

/* 成本的隐藏显示 */
function showOrHide(id) {
	$("#" + "a" + id).hide();
	$("#" + "b" + id).show();
	var wareHouseName = $("#" + "c" + id).prev().html();
	$.ajax({
		url : "/MaiJiaYun/KucunCostServlet?method=showLastCost",
		type : "post",
		dataType : "json",
		data : {
			goodId : id,
			wareHouseName : wareHouseName
		},
		success : function(data) {
			$(".shuru").val(data);
			$("#" + "c" + id).focus();
		}
	});
}
/* 输入成本的文本框 失焦事件 */
function textBlur(id) {
	var reg = /^\d+(\.\d+)?$/;
	var wareHouseName = $("#" + "c" + id).prev().html();
	var kucunCost = $("#" + "b" + id).children(".shuru").val();
	$("#" + "a" + id).show();
	$("#" + "b" + id).hide();
	/* 将文本框的合法值 通过ajax请求写入数据库 */
	if (reg.test(kucunCost) != true) {
		$("#showErrorTempDiv").fadeIn(500);
		$("#showErrorTempDiv").fadeOut(1000);
	} else {
		$.ajax({
			url : "/MaiJiaYun/KucunCostServlet?method=changeCost",
			type : "post",
			dataType : "json",
			data : {
				kucunCost : kucunCost,
				goodId : id,
				wareHouseName : wareHouseName
			},
			success : function(data) {
				$("#a" + id).children("span").text(data);
				$(".shuru").val(data)
			}
		});
	}

	/* var kucunCost=$(".shuru").val("0.00"); */
}

/* 全选按钮控制 */
function checkall(flag) {
	var ck = document.getElementsByName("checkOrder")
	for (var i = 0; i < ck.length; i++) {
		ck[i].checked = flag;
	}
}
/* 查看成本明细 */
function showDedatil(id) {
	$(".kucunmx").html("");
	var wareHouseName = $("#" + id).prev().html();
	$.ajax({
		url : "/MaiJiaYun/KucunCostServlet?method=kucunMx",
		type : "post",
		dataType : "json",
		data : {
			goodId : id,
			wareHouseName : wareHouseName
		},
		success : function(data) {
			$.each(data, function(index, element) {
				var html = "<tr><td>" + (element.changeTime.year + 1900) + "-"
						+ (element.changeTime.month + 1) + "-"
						+ element.changeTime.date + " "
						+ element.changeTime.hours + ":"
						+ element.changeTime.minutes + ":"
						+ element.changeTime.seconds + "</td><td>"
						+ element.business + "</td><td>" + element.bills
						+ "</td><td>" + element.changeCount + "</td><td>"
						+ element.changePrice + "</td><td>"
						+ element.firstCount + "</td><td>" + element.firstCost
						+ "</td><td>" + element.lastCount + "</td><td>"
						+ element.lastCost + "</td><td>" + element.jieyu
						+ "</td></tr>";
				$(".kucunmx").append(html);

			});
		},
		error : function(jqXHR, textStatus, errorThrown) {
			/*
			 * console.log(jqXHR.responseText); console.log(jqXHR.status);
			 * console.log(jqXHR.readyState); console.log(jqXHR.statusText);
			 */
			console.log(textStatus);
			console.log(errorThrown);
		}
	});
};
