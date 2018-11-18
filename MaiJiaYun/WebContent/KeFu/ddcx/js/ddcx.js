/**
 * 
 */
// 刷新按钮事件
var myrefresh = function(event) {
	var stopManual = document.getElementById("stopManualRefurbish");
	var startManual = document.getElementById("manualRefurbish");
	stopManual.style.display = '';
	startManual.style.display = 'none';
	setTimeout("location.href= window.location.href", 10000);
}
// 获取店铺名并且显示在下拉框中
var shopQuery = function(even) {
	var ul = $(even).next();
	$
			.ajax({
				url : window.document.location.pathname.substring(0,
						window.document.location.pathname.substr(1)
								.indexOf('/') + 1)
						+ "/servlet/MethodServlet",
				type : "post",
				data : {
					method : "shopQueryMethod"
				},
				datatype : "json",
				success : function(result) {
					console.log(result);
					ul[0].innerHTML = "";
					$(ul)
							.append(
									"<li role=\"presentation\" class=\"sort\" type=\"up\"><a role=\"menuitem\" tabindex=\"-1\" href=\"javascript:void(0);\" onclick=\"shopClick(this)\"><span class=\"glyphicon glyphicon-arrow-up\" ></span> 升序</a></li>"
											+ "<li role=\"presentation\" class=\"sort\" type=\"down\"><a role=\"menuitem\" tabindex=\"-1\" href=\"javascript:void(0);\" onclick=\"shopClick(this)\"><span class=\"glyphicon glyphicon-arrow-down\"></span> 降序</a></li>"
											+ "<li class=\"divider\"></li>");
					for (var index = 0; index < result.length; index++) {
						$(ul)
								.append(
										"<li role='presentation'><a role='menuitem' tabindex='-1' href='javascript:void(0);'  onclick='shopClick(this)'>"
												+ result[index].shopName
												+ "</a></li>");
					}
				}
			});
}

var begin = function() {
	creatthead();
}

// 获取物流名并且显示在下拉框中
var logisticQuery = function(even) {
	var ul = $(even).next();
	$
			.ajax({
				url : window.document.location.pathname.substring(0,
						window.document.location.pathname.substr(1)
								.indexOf('/') + 1)
						+ "/servlet/MethodServlet",
				type : "post",
				data : {
					method : "logisticQueryMethod"
				},
				datatype : "json",
				success : function(results) {

					ul[0].innerHTML = "";
					$(ul)
							.append(
									"<li role=\"presentation\" class=\"sort\" type=\"up\"><a role=\"menuitem\" tabindex=\"-1\" href=\"javascript:void(0);\" onclick=\"expressCompanyNameExpressCodeClick(this)\"><span class=\"glyphicon glyphicon-arrow-up\" ></span> 升序</a></li>"
											+ "<li role=\"presentation\" class=\"sort\" type=\"down\"><a role=\"menuitem\" tabindex=\"-1\" href=\"javascript:void(0);\" onclick=\"expressCompanyNameExpressCodeClick(this)\"><span class=\"glyphicon glyphicon-arrow-down\"></span> 降序</a></li>"
											+ "<li class=\"divider\"></li>");
					for ( var index in results) {
						$(ul)
								.append(
										"<li role='presentation'><a role='menuitem' tabindex='-1' href='javascript:void(0);' onclick=\"expressCompanyNameExpressCodeClick(this)\")'>"
												+ results[index].logisticName
												+ "</a></li>");

					}
				}
			});

}

// 删除按钮事件
var deleteOrder = function(event) {
	var tbody = $(event).parent().parent().parent().parent();
	var tr = $(event).parent().parent().parent();
	var trs = $(tbody).find("tr");
	var trjr = $(trs).filter("#jrtr");
	var trgz = $(trs).filter("#trgz");
	var countspan = $("#totalRecords");
	var count = $(countspan).text();
	$("#qrmk").attr("aria-hidden", "true");
	$("#qrmk").css("display", "block");
	$("#qrmk").find("button").filter(".btn-default").click(function() {
		$("#qrmk").attr("aria-hidden", "flase");
		$("#qrmk").css("display", "none");
	});
	$("#qrmk").find("button").filter(".btn-primary").click(
			function() {
				var id = $(tr).attr("id");
				$.ajax({
					url : window.document.location.pathname.substring(0,
							window.document.location.pathname.substr(1)
									.indexOf('/') + 1)
							+ "/servlet/DdcxMethodServlet",
					type : "post",
					data : {
						method : "OrderDelete",
						orderCode : id
					},
					datatype : "json",
					success : function(result) {
						if (result[0] == true) {
							// if ($(tr).prev().filter("#jrtr").length > 0
							// && $(tr).next().filter(
							// "#trgz").length > 0) {
							// tr.remove();
							// trjr.remove();
							// } else if ($(tr).prev().filter(
							// "#jrtr").length > 0
							// && $(tr).next().length == 0) {
							// tr.remove();
							// trjr.remove();
							// } else if ($(tr).prev().filter(
							// "#trgz").length > 0
							// && $(tr).next().length == 0) {
							// tr.remove();
							// trgz.remove();
							// } else {
							tr.remove();
							// }
							countspan.text(eval(countspan.text() + "-" + 1));
						}
					}
				});
				$("#qrmk").attr("aria-hidden", "flase");
				$("#qrmk").css("display", "none");
			});
	$("#qrmk").find("button").filter(".close").click(function() {
		$("#qrmk").attr("aria-hidden", "flase");
		$("#qrmk").css("display", "none");
	});

}

// 全选功能
var selectall = function(event) {
	var chks = $("input:checkbox").not("#selectAll");
	var len = chks.length;
	$(chks).each(function() {
		this.checked = $("#selectAll").is(":checked");
	});
}

// 每五分钟刷新页面并更改时间
var count = function() {

	setTimeout("location.href = window.location.href", 300000)
	var timediv = document.getElementById("refurbishDiv");
	var myDate = new Date();
	var mytime = myDate.toLocaleTimeString();
	timediv.innerHTML = "最后一次更新时间：" + mytime;
}

// 获取当前日期
function getNowFormatDate() {
	var date = new Date();
	var seperator1 = "-";
	var seperator2 = ":";
	var month = date.getMonth() + 1;
	var strDate = date.getDate();
	if (month >= 1 && month <= 9) {
		month = "0" + month;
	}
	if (strDate >= 0 && strDate <= 9) {
		strDate = "0" + strDate;
	}
	var currentdate = date.getFullYear() + seperator1 + month + seperator1
			+ strDate;
	return currentdate;
}
// 去掉所有的升序或降序
var shengJiang = function() {
	var address = $("#orderTable").find("th[colname='receiverAddress']").attr(
			"condition");
	if ($.trim(address) == "升序" || $.trim(address) == "降序") {
		$("#orderTable").find("th[colname='receiverAddress']").attr(
				"condition", "");
	}
	var skuTotalQuantity = $("#orderTable").find(
			"th[colname='skuTotalQuantity']").attr("condition");
	if ($.trim(skuTotalQuantity) == "升序" || $.trim(skuTotalQuantity) == "降序") {
		$("#orderTable").find("th[colname='skuTotalQuantity']").attr(
				"condition", "");
	}
	var expressCode = $("#orderTable").find(
			"th[colname='expressCompanyName/expressCode']").attr("condition");
	if ($.trim(expressCode) == "升序" || $.trim(expressCode) == "降序") {
		$("#orderTable").find("th[colname='expressCompanyName/expressCode']")
				.attr("condition", "");
	}
	var expressCompanyName = $("#orderTable").find(
			"th[colname='expressCompanyName']").attr("condition");
	if ($.trim(expressCompanyName) == "升序"
			|| $.trim(expressCompanyName) == "降序") {
		$("#orderTable").find("th[colname='expressCompanyName']").attr(
				"condition", "");
	}
	var shopName = $("#orderTable").find("th[colname='eShopName']").attr(
			"condition");
	if ($.trim(shopName) == "升序" || $.trim(shopName) == "降序") {
		$("#orderTable").find("th[colname='eShopName']").attr("condition", "");
	}
	var status = $("#orderTable").find("th[colname='status']")
			.attr("condition");
	if ($.trim(status) == "升序" || $.trim(status) == "降序") {
		$("#orderTable").find("th[colname='status']").attr("condition", "");
	}
}

// 状态选择事件
var stateClick = function(event) {
	if ($(event).text().trim() == "升序" || $(event).text().trim() == "降序") {
		// 地址condition
		shengJiang();
		$("#orderTable").find("th[colname='status']").attr("condition",
				$(event).text());
	} else {
		$("#orderTable").find("th[colname='status']").attr("condition",
				$(event).attr("id"));
	}

	// 清空页码
	var ul = $("#pagingPages").find("ul")[0];
	$(ul).html("");

	query();
}

// 店铺选择事件
var shopClick = function(event) {
	if ($(event).text().trim() == "升序" || $(event).text().trim() == "降序") {
		// 地址condition
		shengJiang();
		$("#orderTable").find("th[colname='eShopName']").attr("condition",
				$(event).text());
	} else {
		$("#orderTable").find("th[colname='eShopName']").attr("condition",
				$(event).text());
	}

	// 清空页码
	var ul = $("#pagingPages").find("ul")[0];
	$(ul).html("");

	query();
}
// 买家备注buyerMemo事件
var buyerMemoClick = function(event) {
	$("#orderTable").find("th[colname='buyerMemo']").attr("condition",
			$(event).text());

	// 清空页码
	var ul = $("#pagingPages").find("ul")[0];
	$(ul).html("");

	query();
}
// 卖家备注 sellerMemo事件
var sellerMemoClick = function(event) {
	$("#orderTable").find("th[colname='sellerMemo']").attr("condition",
			$(event).text());

	// 清空页码
	var ul = $("#pagingPages").find("ul")[0];
	$(ul).html("");

	query();
}
// 地址事件
var receiverAddressClick = function(event) {
	console.log($(event).text());
	if ($(event).text().trim() == "升序" || $(event).text().trim() == "降序") {
		// 地址condition
		shengJiang();
		$("#orderTable").find("th[colname='receiverAddress']").attr(
				"condition", $(event).text());
	} else {
		$("#orderTable").find("th[colname='receiverAddress']").attr(
				"condition", $(event).text());
	}

	// 清空页码
	var ul = $("#pagingPages").find("ul")[0];
	$(ul).html("");

	query();
}
// 物流/运单号事件
var expressCompanyNameExpressCodeClick = function(event) {
	if ($(event).text().trim() == "升序" || $(event).text().trim() == "降序") {
		// 地址condition
		shengJiang();
		$("#orderTable").find("th[colname='expressCompanyName/expressCode']")
				.attr("condition", $(event).text());
	} else {
		$("#orderTable").find("th[colname='expressCompanyName/expressCode']")
				.attr("condition", $(event).text());
	}

	// 清空页码
	var ul = $("#pagingPages").find("ul")[0];
	$(ul).html("");

	query();
}
// 物流事件
var expressCompanyNameClick = function(event) {
	console.log($(event).text());
	if ($(event).text().trim() == "升序" || $(event).text().trim() == "降序") {
		// 地址condition
		shengJiang();
		console.log($(event).text());
		$("#orderTable").find("th[colname='expressCompanyName']").attr(
				"condition", $(event).text());
	} else {
		$("#orderTable").find("th[colname='expressCompanyName']").attr(
				"condition", $(event).text());
	}

	// 清空页码
	var ul = $("#pagingPages").find("ul")[0];
	$(ul).html("");

	query();
}
// 数量 skuTotalQuantity
var skuTotalQuantityClick = function(event) {
	if ($(event).text().trim() == "升序" || $(event).text().trim() == "降序") {
		// 地址condition
		shengJiang();
		$("#orderTable").find("th[colname='skuTotalQuantity']").attr(
				"condition", $(event).text());
	} else {
		$("#orderTable").find("th[colname='skuTotalQuantity']").attr(
				"condition", $(event).text());
	}

	// 清空页码
	var ul = $("#pagingPages").find("ul")[0];
	$(ul).html("");

	query();
}

// 查询数据
var query = function(event) {
	var condition = {};
	// 获取搜索框条件
	var searchText = $("body").find($("input[name='q']")).val();

	if (searchText != undefined) {
		condition.searchText = searchText;
	}
	// 获取状态条件
	var status = $("#orderTable").find("th[colname='status']")
			.attr("condition");
	if (status != undefined) {
		condition.status = status;
	}
	// 获取店铺名的条件
	var eShopName = $("#orderTable").find("th[colname='eShopName']").attr(
			"condition");
	if (eShopName != undefined) {
		condition.eShopName = eShopName;
	}
	// 买家备注 buyerMemo
	var buyerMemo = $("#orderTable").find("th[colname='buyerMemo']").attr(
			"condition");
	if (buyerMemo != undefined) {
		condition.buyerMemo = buyerMemo;
		// console.log(condition);
	}
	// 卖家备注 sellerMemo
	var sellerMemo = $("#orderTable").find("th[colname='sellerMemo']").attr(
			"condition");
	if (sellerMemo != undefined) {
		condition.sellerMemo = sellerMemo;
		// console.log(condition);
	}
	// 地址
	var receiverAddress = $("#orderTable")
			.find("th[colname='receiverAddress']").attr("condition");
	if (receiverAddress != undefined) {
		condition.receiverAddress = receiverAddress;
		// console.log(condition);
	}
	// 物流/运单号
	var expressCompanyNameExpressCode = $("#orderTable").find(
			"th[colname='expressCompanyName/expressCode']").attr("condition");
	if (expressCompanyNameExpressCode != undefined) {
		condition.expressCompanyNameExpressCode = expressCompanyNameExpressCode;
		// console.log(condition);
	}
	// 物流
	var expressCompanyName = $("#orderTable").find(
			"th[colname='expressCompanyName']").attr("condition");
	if (expressCompanyName != undefined) {
		condition.expressCompanyName = expressCompanyName;
		// console.log(condition);
	}
	// 数量
	var skuTotalQuantity = $("#orderTable").find(
			"th[colname='skuTotalQuantity']").attr("condition");
	if (skuTotalQuantity != undefined) {
		condition.skuTotalQuantity = skuTotalQuantity;
		console.log(condition);
	}

	/*
	 * 分页
	 */
	// 获得当前页要显示的数量
	var currentPageSize = $("#currentPageSize").text();
	condition.currentPageSize = currentPageSize;
	// 获得要查询的页码
	var currentPageNum = $($("#pagingPages").find("li[class='page active']")[0])
			.text();
	if (currentPageNum == "") {
		currentPageNum = 1;
	}
	condition.currentPageNum = eval((eval(currentPageNum + "-" + "1")) + "*"
			+ currentPageSize);
	var count = 0;
	$
			.ajax({
				url : window.document.location.pathname.substring(0,
						window.document.location.pathname.substr(1)
								.indexOf('/') + 1)
						+ "/servlet/DdcxMethodServlet",
				type : "post",
				data : {
					method : "orderQuery",
					condition : JSON.stringify(condition)
				},
				datatype : "json",
				success : function(result) {
					creattr(result);
					// 分页页码
					if (event != "no") {
						// 查询出来的数据总条数
						count = result[result.length - 1].count;
						// 总共有多少页
						var pageCount = eval(count + "/" + currentPageSize);
						if (eval(count + "%" + currentPageSize) != 0) {
							pageCount++;
						}
						var ul = $("#pagingPages").find("ul")[0];

						$(ul).html("");

						$(ul)
								.append(
										"<li id='last' class='fb fmsun' onclick='pageLastChange()'><a >&lt;</a></li>"
												+

												"<li class='page active' page='1' onclick='pageChange(this)'><a >1</a></li>");
						for (var index = 2; index <= pageCount; index++) {
							if (index <= 5) {
								$(ul).append(
										"<li class='page' page='1' onclick='pageChange(this)'><a>"
												+ index + "</a></li>");
							} else {
								$(ul).append(
										"<li style='display:none;' class='page' page='1' onclick='pageChange(this)'><a>"
												+ index + "</a></li>");
							}
						}
						$(ul)
								.append(
										"<li id='next' class='fb fmsun' onclick='pageNextChange(this)' ><a>&gt;</a></li>");
						var countspan = $("#totalRecords");
						countspan.text(count);
					}

				}
			});
}

// 分页的操作
var displayLi=function(){
	var lis=$("#pagingPages").find("li");
	for(var index=1;index<=lis.length-2;index++){
		console.log(index+"  "+CheckNav(index));
		if(CheckNav(index)){
			$(lis[index]).attr("style","display:'';");
		}else{
			$(lis[index]).attr("style","display:none;");
		}
	}
}



var CheckNav = function(i) {
	var limitBegin = $($("#pagingPages").find("li[class='page active']")[0]).text();
	console.log("limitBegin:"+limitBegin);
	var sheetCount=($("#pagingPages").find("li")).length-2;
	//console.log("sheetCount:"+sheetCount);
	// System.out.println(sheetCount+" "+limitBegin+" "+i);
	if (sheetCount <= 5) {
		return true;
	} else {
		if (limitBegin == 2) {
			if (i == limitBegin - 1 || i == eval(limitBegin +"+"+ 1)
					|| i == eval(limitBegin +"+"+ 3) || i == eval(limitBegin +"+"+ 2)) {
				return true;
			}
		}
		if (limitBegin == 1) {
			if (i == limitBegin || i == eval(limitBegin +"+"+ 4) || i == eval(limitBegin +"+"+ 1)
					|| i == eval(limitBegin +"+"+ 3) || i == eval(limitBegin +"+"+ 2)) {
				return true;
			}
		}
		if (limitBegin == sheetCount - 1) {
			if (i == limitBegin || i == limitBegin - 1 || i == eval(limitBegin +"+"+ 1)
					|| i == limitBegin - 3 || i == limitBegin - 2) {
				return true;
			}
		}
		if (limitBegin == sheetCount) {
			if (i == limitBegin || i == limitBegin - 4 || i == limitBegin - 1
					|| i == limitBegin - 3 || i == limitBegin - 2) {
				return true;
			}
		} else {
			if (i == limitBegin || i == eval(limitBegin +"+"+ 1) || i == eval(limitBegin+"-"+ 1)
					|| i == eval(limitBegin +"+"+ 2) || i == eval(limitBegin+"-"+ 2)) {
				return true;
			}
		}
	}
	return false;
}

// 页码onclick事件
var pageChange = function(event) {
	// var text=$($(event).find("a")[0]).text();
	$($("#pagingPages").find("li[class='page active']")[0]).attr("class",
			"page");
	$(event).attr("class", "page active");
	query("no");
	displayLi();
}
// 上一页
var pageLastChange = function() {
	var currentPage = $("#pagingPages").find("li[class='page active']")[0];
	if ($(currentPage).text() != "1") {
		$(currentPage).attr("class", "page");
		$($(currentPage).prev()).attr("class", "page active");
		query("no");
		displayLi();
	}
}
// 下一页
var pageNextChange = function(event) {
	var currentPage = $("#pagingPages").find("li[class='page active']")[0];
	if ($($(currentPage).next()).attr("id") != $(event).attr("id")) {
		$(currentPage).attr("class", "page");
		$($(currentPage).next()).attr("class", "page active");
		query("no");
		displayLi();
	}
}
// 每页显示条数
var shoucount = function(event) {
	var size = $(event).text();
	$("#currentPageSize").text(size);
	query();
}

// 动态生成表头
var creatthearth = function(tr) {
	$(tr)
			.append(
					"<th class='select' colname='flag' title=''>"
							+ "<div class='btn-group'><div class='left' style='margin-right: 5px;'><input type='checkbox' id='selectAll' onclick='selectall()'></div>"
							+ "<div class='dropdown left'>"
							+ "<button class='btn dropdown-toggle fb' style='padding: 0; box-shadow: none; background: none' type='button' id='dropdownMenu1' data-toggle='dropdown'>"
							+ "<span class='title'><span class='glyphicon glyphicon-flag '></span></span> <span class='caret'></span></button>"
							+ "<ul class='dropdown-menu' role='menu' aria-labelledby='dropdownMenu1'>"
							+ "<li role='presentation'><a role='menuitem' tabindex='-1' href='javascript:void(0);'><span style='color: red' class='glyphicon glyphicon-flag'><span class='hide'>红</span></span></a></li>"
							+ "<li role='presentation'><a role='menuitem' tabindex='-1' href='javascript:void(0);'><span style='color: #F90' class='glyphicon glyphicon-flag'><span class='hide'>黄</span></span></a></li>"
							+ "<li role='presentation'><a role='menuitem' tabindex='-1' href='javascript:void(0);'><span style='color: green' class='glyphicon glyphicon-flag'><span class='hide'>绿</span></span></a></li>"
							+ "<li role='presentation'><a role='menuitem' tabindex='-1' href='javascript:void(0);'><span style='color: blue' class='glyphicon glyphicon-flag'><span class='hide'>蓝</span></span></a></li>"
							+ "<li role='presentation'><a role='menuitem' tabindex='-1' href='javascript:void(0);'><span style='color: violet' class='glyphicon glyphicon-flag'><span class='hide'>紫</span></span></a></li>"
							+ "</ul></div></div></th>");
	$(tr)
			.append(
					"<th colname='splitMergeStatus' class='select' title='提醒'><div class='dropdown'><button class='btn dropdown-toggle fb' style='padding: 0; box-shadow: none; background: none' type='button' id='dropdownMenu1' data-toggle='dropdown'><span class='title'>提醒</span> <span class='caret'></span>"
							+ "</button><ul class='dropdown-menu' role='menu' aria-labelledby='dropdownMenu1'>"

							+ "<li role='presentation'><a role='menuitem' tabindex='-1' href='javascript:void(0);'><span class='iconfont icon-tuihuo' style='font-size: 16px; color: #F90'></span>退款</a></li>"

							+ "<li role='presentation'><a role='menuitem' tabindex='-1' href='javascript:void(0);'><span class='glyphicon glyphicon-lock' style='color: #F90'></span>锁单</a></li>"

							+ "<li role='presentation'><a role='menuitem' tabindex='-1' href='javascript:void(0);'>已拆分</a></li>"

							+ "<li role='presentation'><a role='menuitem' tabindex='-1' href='javascript:void(0);'>已合并</a></li>"

							+ "<li role='presentation'><a role='menuitem' tabindex='-1' href='javascript:void(0);'>无法送达</a></li>"

							+ "<li role='presentation'><a role='menuitem' tabindex='-1' href='javascript:void(0);'>货到付款</a></li>"

							+ "<li role='presentation'><a role='menuitem' tabindex='-1' href='javascript:void(0);'>预售</a></li></ul></div></th>");

}

// 动态生成表头
var creatthead = function() {
	var table = $("#orderTable");
	var tr = $(table).find("thead").find("tr")[0];
	$
			.ajax({
				url : window.document.location.pathname.substring(0,
						window.document.location.pathname.substr(1)
								.indexOf('/') + 1)
						+ "/LieSheZhiDdcxServlet",
				type : "post",
				data : {

				},
				datatype : "json",

				success : function(result) {

					$(tr).html(" ");
					creatthearth(tr);
					for ( var index in result) {

						if (result[index].colName == "status") {
							$(tr)
									.append(
											"<th colname='status' class='select' title='状态'><div class='dropdown'>"
													+ "<button class='btn dropdown-toggle fb' style='padding: 0; box-shadow: none; background: none' type='button' id='dropdownMenu1' data-toggle='dropdown'><span class='title'>"
													+ result[index].ddcxShowName
													+ "</span> <span class='caret'></span></button>"
													+ "<ul class='dropdown-menu' role='menu' aria-labelledby='dropdownMenu1'><li role='presentation' class='sort' type='up'><a role='menuitem' tabindex='-1' href='###' onclick='stateClick(this)'><span class='glyphicon glyphicon-arrow-up'></span> 升序</a></li>"
													+ "<li role='presentation' class='sort' type='down'><a role='menuitem' tabindex='-1' href='###' onclick='stateClick(this)'><span class='glyphicon glyphicon-arrow-down'></span> 降序</a></li>"
													+ "<li class='divider'></li>"
													+ "<li role='presentation'><a role='menuitem' tabindex='-1' href='javascript:void(0);'>待付款</a></li>"
													+ "<li role='presentation'><a role='menuitem' tabindex='-1' href='javascript:void(0);' id='1' onclick='stateClick(this)'>已付款待审核</a></li>"
													+ "<li role='presentation'><a role='menuitem' tabindex='-1' href='javascript:void(0);' id='2' onclick='stateClick(this)'>已审核待发货</a></li>"
													+ "<li role='presentation'><a role='menuitem' tabindex='-1' href='javascript:void(0);' id='3' onclick='stateClick(this)'>已发货</a></li>"
													+ "<li role='presentation'><a role='menuitem' tabindex='-1' href='javascript:void(0);'>已取消</a></li>"
													+ "<li role='presentation'><a role='menuitem' tabindex='-1' href='javascript:void(0);'>已完成</a></li></ul></div></th>");
						}
						if (result[index].colName == "eShopName") {
							$(tr)
									.append(
											"<th colname='eShopName' class='select' title='店铺名'><div class='dropdown'>"
													+ "<button class='btn dropdown-toggle fb' style='padding: 0; box-shadow: none; background: none' type='button' id='dropdownMenu1' data-toggle='dropdown' onclick='shopQuery(this)'>"
													+ "<span class='title'>"
													+ result[index].ddcxShowName
													+ "</span> <span class='caret'></span></button><ul class='dropdown-menu' role='menu' aria-labelledby='dropdownMenu1'></ul></div></th>");
						}
						if (result[index].colName == "b2cCode/createTime") {
							$(tr).append(
									"<th colname='b2cCode/createTime' >"
											+ result[index].ddcxShowName
											+ "</th>");
						}
						if (result[index].colName == "customerName") {
							$(tr).append(
									"<th colname='customerName' >"
											+ result[index].ddcxShowName
											+ "</th>");
						}
						if (result[index].colName == "buyerMemo") {
							$(tr)
									.append(
											"<th colname='buyerMemo' class='select' title='买家备注'><div class='dropdown'>"
													+ "<button class='btn dropdown-toggle fb' style='padding: 0; box-shadow: none; background: none' type='button' id='dropdownMenu1' data-toggle='dropdown'>"
													+ "<span class='title'>"
													+ result[index].ddcxShowName
													+ "</span> <span class='caret'></span></button>"
													+ "<ul class='dropdown-menu' role='menu' aria-labelledby='dropdownMenu1'>"
													+ "<li role='presentation'><a role='menuitem' tabindex='-1' href='javascript:void(0);' onclick='buyerMemoClick(this)'>有买家备注</a></li>"
													+ "<li role='presentation'><a role='menuitem' tabindex='-1' href='javascript:void(0);' onclick='buyerMemoClick(this)'>无买家备注</a></li></ul></div></th>");
						}
						if (result[index].colName == "sellerMemo") {
							$(tr)
									.append(
											"<th colname='sellerMemo' class='select' title='卖家备注'><div class='dropdown'>"
													+ "<button class='btn dropdown-toggle fb' style='padding: 0; box-shadow: none; background: none' type='button' id='dropdownMenu1' data-toggle='dropdown'>"
													+ "<span class='title'>"
													+ result[index].ddcxShowName
													+ "</span> <span class='caret'></span></button>"
													+ "<ul class='dropdown-menu' role='menu' aria-labelledby='dropdownMenu1'>"
													+ "<li role='presentation'><a role='menuitem' tabindex='-1' href='javascript:void(0);' onclick='sellerMemoClick(this)'>有卖家备注</a></li>"
													+ "<li role='presentation'><a role='menuitem' tabindex='-1' href='javascript:void(0);' onclick='sellerMemoClick(this)'>无卖家备注</a></li></ul></div></th>");
						}
						if (result[index].colName == "receiverAddress") {
							$(tr)
									.append(
											"<th colname='receiverAddress' class='select' title='地址'>"
													+ "<div class='dropdown'><button class='btn dropdown-toggle fb' style='padding: 0; box-shadow: none; background: none' type='button' id='dropdownMenu1' data-toggle='dropdown'>"
													+ "<span class='title'>"
													+ result[index].ddcxShowName
													+ "</span> <span class='caret'></span></button>"
													+ "<ul class='dropdown-menu' role='menu' aria-labelledby='dropdownMenu1'>"
													+ "<li role='presentation' class='sort' type='up'><a role='menuitem' tabindex='-1' href='javascript:void(0);' onclick='receiverAddressClick(this)'><span class='glyphicon glyphicon-arrow-up'></span> 升序</a></li>"
													+ "<li role='presentation' class='sort' type='down'><a role='menuitem' tabindex='-1' href='javascript:void(0);' onclick='receiverAddressClick(this)'><span class='glyphicon glyphicon-arrow-down'></span> 降序</a></li>"
													+ "</ul></div></th>");
						}
						if (result[index].colName == "expressCompanyName/expressCode") {
							$(tr)
									.append(
											"<th colname='expressCompanyName/expressCode' class='select' title='物流/运单号'>"
													+ "<div class='dropdown'><button class='btn dropdown-toggle fb' style='padding: 0; box-shadow: none; background: none' type='button' id='dropdownMenu1' data-toggle='dropdown' onclick='logisticQuery(this)'>"
													+ "<span class='title'>"
													+ result[index].ddcxShowName
													+ "</span> <span class='caret'></span></button><ul class='dropdown-menu' role='menu' aria-labelledby='dropdownMenu1'></ul></div></th>");
						}
						if (result[index].colName == "expressCompanyName") {
							$(tr)
									.append(
											"<th colname='expressCompanyName' class='select' title='物流'>"
													+ "<div class='dropdown'><button class='btn dropdown-toggle fb' style='padding: 0; box-shadow: none; background: none' type='button' id='dropdownMenu1' data-toggle='dropdown' onclick='logisticQuery(this)'>"
													+ "<span class='title'>"
													+ result[index].ddcxShowName
													+ "</span> <span class='caret'></span></button>"
													+ "<ul class='dropdown-menu' role='menu' aria-labelledby='dropdownMenu1'></ul></div></th>");
						}
						if (result[index].colName == "skuTotalQuantity") {
							$(tr)
									.append(
											"<th colname='skuTotalQuantity' class='select' title='数量'>"
													+ "<div class='dropdown'><button class='btn dropdown-toggle fb' style='padding: 0; box-shadow: none; background: none' type='button' id='dropdownMenu1' data-toggle='dropdown' >"
													+ "<span class='title'>"
													+ result[index].ddcxShowName
													+ "</span> <span class='caret'></span></button>"
													+ "<ul class='dropdown-menu' role='menu' aria-labelledby='dropdownMenu1'>"
													+ "<li role='presentation' class='sort' type='up'><a role='menuitem' tabindex='-1' href='javascript:void(0);' onclick='skuTotalQuantityClick(this)'><span class='glyphicon glyphicon-arrow-up'></span> 升序</a></li>"
													+ "<li role='presentation' class='sort' type='down'><a role='menuitem' tabindex='-1' href='javascript:void(0);' onclick='skuTotalQuantityClick(this)'><span class='glyphicon glyphicon-arrow-down'></span> 降序</a></li>"
													+ "</ul></div></th>");
						}
						if (result[index].colName == "paymentAmount/buyerPostageFee") {
							$(tr).append(
									"<th colname='paymentAmount/buyerPostageFee'>"
											+ result[index].ddcxShowName
											+ "</th>");
						}
						if (result[index].colName == "receiverMobile") {
							$(tr).append(
									"<th colname='receiverMobile' >"
											+ result[index].ddcxShowName
											+ "</th>");
						}
						if (result[index].colName == "receiverPhone") {
							$(tr).append(
									"<th colname='receiverPhone' >"
											+ result[index].ddcxShowName
											+ "</th>");
						}
						if (result[index].colName == "receiverName") {
							$(tr).append(
									"<th colname='receiverName' >"
											+ result[index].ddcxShowName
											+ "</th>");
						}
						if (result[index].colName == "paymentTime") {
							$(tr).append(
									"<th colname='paymentTime'>"
											+ result[index].ddcxShowName
											+ "</th>");
						}
						if (result[index].colName == "auditTime") {
							$(tr).append(
									"<th colname='auditTime' >"
											+ result[index].ddcxShowName
											+ "</th>");
						}
						if (result[index].colName == "deliveryTime") {
							$(tr).append(
									"<th colname='deliveryTime'>"
											+ result[index].ddcxShowName
											+ "</th>");
						}
						if (result[index].colName == "expressCode") {
							$(tr).append(
									"<th colname='expressCode'>"
											+ result[index].ddcxShowName
											+ "</th>");
						}
						if (result[index].colName == "deliveryCode") {
							$(tr).append(
									"<th colname='deliveryCode'>"
											+ result[index].ddcxShowName
											+ "</th>");
						}

					}
					$(tr)
							.append(
									"<th>操作</th><th style='border-right: none'><a data-toggle='modal' data-target='#tableModal' style='cursor: pointer;' id='theadSet' onclick='initialize()'>列设置</a></th>");
				}
			});
	query();
	count();
}
// 动态生成行以及列数列顺序
var creattr = function(orders) {
	var tbody = $("#countbody");

	$
			.ajax({
				url : window.document.location.pathname.substring(0,
						window.document.location.pathname.substr(1)
								.indexOf('/') + 1)
						+ "/LieSheZhiDdcxServlet",
				type : "post",
				data : {

				},
				datatype : "json",

				success : function(result) {
					tbody[0].innerHTML = "";
					for (var order = 0; order < orders.length - 1; order++) {
						var tr = document.createElement("tr");
						$(tr).attr({
							"false" : " ",
							"id" : orders[order].orderCode,
							"class" : "order"
						});
						$(tr)
								.append(
										"<td false=' '><input type='checkbox' style='margin-right:5px;'></td>");
						$(tr).append("<td></td>");
						for ( var index in result) {
							if (result[index].colName == "status") {
								if (orders[order].orderState == 1) {
									$(tr)
											.append(
													"<td false=' ' colname='status' >已付款待审核</td>");
								}
								if (orders[order].orderState == 2) {
									$(tr)
											.append(
													"<td false=' ' colname='status'>已审核待发货</td>");
								}
								if (orders[order].orderState == 3) {
									$(tr)
											.append(
													"<td false=' ' colname='status'>已发货</td>");
								}
							}
							if (result[index].colName == "eShopName") {
								$(tr).append(
										"<td false='' colname='eShopName'>"
												+ orders[order].shopName
												+ "</td>");
							}
							if (result[index].colName == "b2cCode/createTime") {
								$(tr)
										.append(
												"<td false='' colname='b2cCode/createTime'><a href='javascript:void(0);' class='show-order-detail'>"
														+ orders[order].orderCode
														+ "</a><br>"
														+ orders[order].orderTime
														+ "</td>");
							}
							if (result[index].colName == "customerName") {
								$(tr).append(
										"<td false='' colname='customerName'>"
												+ orders[order].buyerName
												+ "</td>");
							}
							if (result[index].colName == "buyerMemo") {
								$(tr)
										.append(
												"<td false='' colname='buyerMemo'>"
														+ orders[order].orderBuyerRemark
														+ "</td>");
							}
							if (result[index].colName == "sellerMemo") {
								$(tr)
										.append(
												"<td false='' colname='sellerMemo'>"
														+ orders[order].orderSellerRemark
														+ "</td>");
							}
							if (result[index].colName == "receiverAddress") {
								$(tr).append(
										"<td false='' colname='receiverAddress'>"
												+ orders[order].buyerAddress
												+ "<br>"
												+ orders[order].buyerLocation
												+ "</td>");
							}
							if (result[index].colName == "expressCompanyName/expressCode") {
								$(tr).append(
										"<td false='' colname='expressCompanyName/expressCode'>"
												+ orders[order].logisticName
												+ "<br>"
												+ orders[order].orderWaybill
												+ "</td>");
							}
							if (result[index].colName == "expressCompanyName") {
								$(tr).append(
										"<td false='' colname='expressCompanyName'>"
												+ orders[order].logisticName
												+ "</td>");
							}
							if (result[index].colName == "skuTotalQuantity") {
								$(tr).append(
										"<td false='' colname='skuTotalQuantity'>"
												+ orders[order].orderGoodNum
												+ "</td>");
							}
							if (result[index].colName == "paymentAmount/buyerPostageFee") {
								$(tr).append(
										"<td false='' colname='paymentAmount/buyerPostageFee'>"
												+ orders[order].orderPayMent
												+ "/"
												+ orders[order].orderFreight
												+ "</td>");
							}
							if (result[index].colName == "receiverMobile") {
								$(tr).append(
										"<td false='' colname='receiverMobile'>"
												+ orders[order].buyerPhone
												+ "</td>");
							}
							if (result[index].colName == "receiverPhone") {
								$(tr).append(
										"<td false='' colname='receiverPhone'>"
												+ orders[order].buyerTel
												+ "</td>");
							}
							if (result[index].colName == "receiverName") {
								$(tr).append(
										"<td false='' colname='receiverName'>"
												+ orders[order].buyerName
												+ "</td>");
							}
							if (result[index].colName == "paymentTime") {
								$(tr).append(
										"<td false='' colname='paymentTime'>"
												+ orders[order].orderPayTime
												+ "</td>");
							}
							if (result[index].colName == "auditTime") {
								$(tr).append(
										"<td false='' colname='auditTime'>"
												+ orders[order].orderExaTime
												+ "</td>");
							}
							if (result[index].colName == "deliveryTime") {
								$(tr).append(
										"<td false='' colname='deliveryTime' >"
												+ orders[order].orderSendTime
												+ "</td>");
							}
							if (result[index].colName == "expressCode") {
								$(tr).append(
										"<td false='' colname='expressCode' >"
												+ orders[order] + "</td>");
							}
							if (result[index].colName == "deliveryCode") {
								$(tr).append(
										"<td false='' colname='deliveryCode'>"
												+ orders[order].orderSendCode
												+ "</td>");
							}

						}
						if (orders[order].orderState == 1) {
							$(tr)
									.append(
											"<td false='' colspan='2'><div class='btn-group'><button class='btn btn-default btn-sm show-order-detail' type='button' xiangQing='2' onclick='changeDetails(this)'>详情</button></div><div class='btn-group' name='deleteManualOrderBtn' orderid="
													+ orders[order].orderCode
													+ "><a href='###' onclick='deleteOrder(this)'>删除</a></div></td>");
						} else {
							$(tr)
									.append(
											"<td false='' colspan='2'><div class='btn-group'><button class='btn btn-default btn-sm show-order-detail' type='button'  xiangQing='2' onclick='changeDetails(this)'>详情</button></div></td>");
						}
						$(tbody).append(tr);
					}

				}
			});

}
