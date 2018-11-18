//代销订单点击显示
var daixiaodingdan = function() {
	var btnOrderT = document.getElementById("btnOrderType");
	btnOrderT.innerHTML = "代销订单";
}
//普通订单
var putongdingdan = function() {
	var btnOrderT = document.getElementById("btnOrderType");
	btnOrderT.innerHTML = "普通订单";
}
//先付款
var xianfukuan = function() {
	var fukuanfangshi = document.getElementById("fukuanfangshiText");
	fukuanfangshi.innerHTML = "先付款";
}
//货到付款
var huodaofukuan = function() {
	var fukuanfangshi = document.getElementById("fukuanfangshiText");
	fukuanfangshi.innerHTML = "货到付款";
}
// 为地区下拉框中的列表添加点击事件
var sheng = function(parent) {
	var lis = parent.getElementsByTagName("ul")[0].getElementsByTagName("li");
	for (var index = 0; index < lis.length; index++) {
		lis[index].onclick = function() {
			var text = parent.getElementsByTagName("button")[0];
			text.innerText = this.getAttribute("val");
			text.setAttribute("sql_id", this.getAttribute("sql_id"));
		}
	}
}
// 地区下拉框事件
var appendSheng = function(name) {
	var receiverState = document.getElementById("receiverState");
	var buttonState = receiverState.getElementsByTagName("button")[0];

	var receiverCity = document.getElementById("receiverCity");
	var buttonCity = receiverCity.getElementsByTagName("button")[0];

	var receiverDistrict = document.getElementById("receiverDistrict");
	var buttonDistrict = receiverDistrict.getElementsByTagName("button")[0];

	var ul;
	var parent;
	var value;
	if (name == "sheng") {
		value = "0";
		ul = receiverState.getElementsByTagName("ul")[0];
		parent = receiverState;
	}
	if (name == "city") {
		value = buttonState.getAttribute("sql_id");
		ul = receiverCity.getElementsByTagName("ul")[0];
		parent = receiverCity;
	}
	if (name == "district") {
		value = buttonCity.getAttribute("sql_id");
		ul = receiverDistrict.getElementsByTagName("ul")[0];
		parent = receiverDistrict;
	}
	$.ajax({
		url : window.document.location.pathname.substring(0,
				window.document.location.pathname.substr(1).indexOf('/') + 1)
				+ "/servlet/MethodServlet",
		type : "post",
		data : {
			method : "areaQueryMethod",
			name : name,
			value : value
		},
		datatype : "json",
		success : function(result) {
			ul.innerHTML = "";
			var areas = result.message;
			for ( var area in areas) {
				var li = document.createElement("li");
				li.setAttribute("val", areas[area].name);
				li.setAttribute("sql_id", areas[area].id);
				li.innerHTML = "<a href='###'>" + areas[area].name + "</a>";
				ul.appendChild(li);
			}
			sheng(parent);
		}
	});

}
//输入框格式检测
var moneyCheck = function(event) {
	if (!(/^[0-9]*$/).test(event.value)) {
		event.value = "输入错误！";
		event.style.color = "red";
	} else {
		event.style.color = "";
	}
	totalMoney();
}
//电话号码
var phoneNumberCheck = function(event) {
	if (!(/^1(3|4|5|7|8)\d{9}$/).test(event.value)) {
		event.value = "输入错误！";
		event.style.color = "red";
	} else {
		event.style.color = "";
	}
}
//邮编
var youbianCheck = function(event) {
	if (!(/^[1-9]\d{5}$/).test(event.value)) {
		event.value = "输入错误！";
		event.style.color = "red";
	} else {
		event.style.color = "";
	}
}
// 删除列表中的商品
var deleteListOfAddOrder = function(event) {
	var tbody = $(event).parent().parent().parent();
	var tbodyParent = $(tbody).parent();

	var tbodys = $(tbodyParent).find("tbody");
	if (tbodys.length == 1) {
		var thead = $(tbodyParent).find("thead");
		thead.remove();
		tbody.remove();
		var tbodyParentParent = $(tbodyParent).parent();
		tbodyParentParent[0].innerHTML = "<div class='well well-lg tc' style='margin-bottom: 20px;'>请添订单商品</div>"
		totalMoney();
	} else {
		tbody.remove();
		totalMoney();
	}
}
// 向列表中增加商品
var addListOfAddOrder = function() {
	var table = $("#listOfProducts");
	var tbody = $(table).find("tbody");

	for (var index = 0; index < tbody.length; index++) {
		var input = $(tbody[index]).find("input");
		if (input[0].checked == true) {
			var tds = $(tbody[index]).find("td");

			var orderTbody = $("#skuPanel").find("tbody");
			if (orderTbody.length == 0) {
				$("#skuPanel").find("div").remove();
				$("#skuPanel").append(
						"<table style='margin-bottom: 0' class='table table-striped'>"
								+ "<thead class=' table-bordered'>" + "<tr>"
								+ "<th>图片</th>" + "<th>SKU编码</th>"
								+ "<th>商品名称</th>"
								+ "<th style='display:block;'>重量</th>"
								+ "<th>零售价</th>" + "<th>数量</th>"
								+ "<th  style='display:none;'>折扣</th>"
								+ "<th>优惠</th>" + "<th>应付</th>" + "<th>操作</th>"
								+ "</tr>" + "</thead>" + "</table>");
				$("#skuPanel")
						.find("table")
						.append(
								"<tbody style='font-weight: normal'>"
										+ "<tr goodId='"
										+ $(tds[7]).text()
										+ "' warehouseId='"
										+ $(tds[8]).text()
										+ "' goodprice='"
										+ $(tds[6]).text()
										+ "' modelid='c120'>"
										+ "<td><img src='"
										+ $(tds[1]).text()
										+ "' style='height: 50px; width: 50px;' class='img-thumbnail' alt='50x50'></td>"
										+ "<td class='fb'>"
										+ $(tds[2]).text()
										+ "</td>"
										+ "<td >"
										+ $(tds[3]).text()
										+ "</td>"
										+ "<td>"
										+ $(tds[4]).text()
										+ "</td>"
										+ "<td><input onfocusout='totalMoney()' type='text' name='price' class='float' value='"
										+ $(tds[6]).text()
										+ "' style='width: 70px;' placeholder='100' id=''></td>"
										+ "<td><input onfocusout='totalMoney()' type='text' name='quantity' class='integer' value='1' style='width: 70px;' placeholder='' id=''></td>"
										+ "<td  style='display:none;'><div class='form-inline'>"
										+ "<div class='form-group'>"
										+ "<input onfocusout='totalMoney()' id='discount' name='discount' type='text' class='float' value='' style='width: 70px;' placeholder='例：7.5'> <label>折</label>"
										+ "</div>"
										+ "</div></td>"
										+ "<td><input onfocusout='totalMoney()' type='text' id='discountFee' name='discountFee' class='float' value='0' style='width: 70px;' placeholder=''></td>"
										+ "<td></td>"
										+ "<td><a href='###' onclick='deleteListOfAddOrder(this)' class='delete' >删除</a></td>"
										+ "</tr>" + "</tbody>");
			} else {
				var flag = false;
				for (var i = 0; i < orderTbody.length; i++) {
					var orderTdSku = ($(orderTbody[i]).find("td"))[1];
					if ($(orderTdSku).text() == $(tds[2]).text()) {
						flag = true;
					}
				}
				if (flag == false) {
					$("#skuPanel")
							.find("table")
							.append(
									"<tbody style='font-weight: normal'>"
											+ "<tr goodId='"
											+ $(tds[7]).text()
											+ "' warehouseId='"
											+ $(tds[8]).text()
											+ "' goodprice='"
											+ $(tds[6]).text()
											+ "' modelid='c120'>"
											+ "<td><img src='"
											+ $(tds[1]).text()
											+ "' style='height: 50px; width: 50px;' class='img-thumbnail' alt='50x50'></td>"
											+ "<td class='fb'>"
											+ $(tds[2]).text()
											+ "</td>"
											+ "<td>"
											+ $(tds[3]).text()
											+ "</td>"
											+ "<td>"
											+ $(tds[4]).text()
											+ "</td>"
											+ "<td><input onfocusout='totalMoney()' type='text' name='price' class='float' value='"
											+ $(tds[6]).text()
											+ "' style='width: 70px;' placeholder='100' id=''></td>"
											+ "<td><input onfocusout='totalMoney()' type='text' name='quantity' class='integer' value='1' style='width: 70px;' placeholder='' id=''></td>"
											+ "<td  style='display:none;'><div class='form-inline'>"
											+ "<div class='form-group'>"
											+ "<input onfocusout='totalMoney()' id='discount' name='discount' type='text' class='float' value='' style='width: 70px;' placeholder='例：7.5'> <label>折</label>"
											+ "</div>"
											+ "</div></td>"
											+ "<td><input onfocusout='totalMoney()' type='text' id='discountFee' name='discountFee' class='float' value='0' style='width: 70px;' placeholder=''></td>"
											+ "<td></td>"
											+ "<td><a href='###' onclick='deleteListOfAddOrder(this)' class='delete' >删除</a></td>"
											+ "</tr>" + "</tbody>");
				}
			}
		}
	}
	totalMoney();
}
// 计算总数金额
var totalMoney = function() {
	// 订单总重量
	var orderWeight = 0;
	var tbodys = $("#skuPanel").find("table").find("tbody");
	var skuTotalQuantityNumber = 0;
	// 订单优惠
	var orderFee = $("#orderFee").val();
	if (orderFee == "") {
		orderFee = 0;
	}
	var span1Number = 0;
	var span3Number = 0;
	var span4Number = 0;
	for (var index = 0; index < tbodys.length; index++) {
		var inputs = $(tbodys[index]).find("tr").find("input");
		var price = $(inputs).filter("[name='price']").val();
		var quantity = $(inputs).filter("[name='quantity']").val();
		var discountFee = $(inputs).filter("[name='discountFee']").val();
		// 查找重量属性
		var tdWeight = $($(tbodys[index]).find("td")[3]).text();
		if (tdWeight == "") {
			tdWeight = 0;
		}

		// 计算订单总总量
		console.log(orderWeight);
		console.log(tdWeight);
		console.log(quantity);
		orderWeight = eval(orderWeight + "+" + tdWeight + "*" + quantity);

		skuTotalQuantityNumber = eval(skuTotalQuantityNumber + "+" + quantity);
		span1Number = eval(span1Number + "+" + price + "*" + quantity);
		span3Number = eval(span3Number + "+" + discountFee);

		var trTotal = $(tbodys[index]).find("tr").find("td")[8];

		var discountValue = discountFee * 10 / price * quantity;

		trTotal.innerText = eval(price + "*" + quantity + "-" + discountFee);
		span4Number = eval(span4Number + "+" + price + "*" + quantity + "-"
				+ discountFee);
	}

	$("#orderWeight").text(orderWeight);
	console.log(orderWeight);

	$("#skuTotalQuantity").text(skuTotalQuantityNumber);

	var spans = $("#skuTotalFee").find("span");
	$(spans[0]).text(span1Number);
	$(spans[1]).text(orderFee);
	$(spans[2]).text(span3Number);
	$(spans[3]).text(eval(span4Number + "-" + orderFee));
	var shifu = $("#skuTotalFee").next().find("span");
	$(shifu).text($(spans[3]).text());
}
// 客户列表
var listOfCustomers = function() {
	var searchText = $("#customerSearchText").val();
	var table = $("#listOfCustomers");
	$.ajax({
		url : window.document.location.pathname.substring(0,
				window.document.location.pathname.substr(1).indexOf('/') + 1)
				+ "/servlet/MethodServlet",
		type : "post",
		data : {
			method : "customerQueryMethod",
			searchText : searchText
		},
		datatype : "json",
		success : function(customers) {
			table[0].innerHTML = "";
			$(table).append(
					"<thead class='table-bordered'>" + "<tr>" + "<th>选择</th>"
							+ "<th>收货人</th>" + "<th>手机号</th>" + "<th>邮编</th>"
							+ "<th>地址</th>" + "</tr>" + "</thead>");
			for ( var customer in customers) {
				var tbody = document.createElement("tbody");
				$(tbody).attr("style", "font-weight: normal");
				var tr = document.createElement("tr");
				$(tr).append(
						"<td><input type='radio' name='customersList'></td>");
				$(tr).append("<td>" + customers[customer].buyerName + "</td>");
				$(tr).append("<td>" + customers[customer].buyerTel + "</td>");
				$(tr).append(
						"<td>" + customers[customer].buyerPostCode + "</td>");
				$(tr).append(
						"<td>" + customers[customer].buyerProvince
								+ customers[customer].buyerCity
								+ customers[customer].buyerDistrict
								+ customers[customer].buyerLocation + "</td>");
				$(tr).append(
						"<td sql_id='" + customers[customer].provincesCode
								+ "' style=\"display:none;\">"
								+ customers[customer].buyerProvince + "</td>");
				$(tr).append(
						"<td sql_id='" + customers[customer].cityCode
								+ "' style=\"display:none;\">"
								+ customers[customer].buyerCity + "</td>");
				$(tr).append(
						"<td sql_id='" + customers[customer].areaCode
								+ "' style=\"display:none;\">"
								+ customers[customer].buyerDistrict + "</td>");
				$(tr).append(
						"<td style=\"display:none;\">"
								+ customers[customer].buyerLocation + "</td>");
				$(tr).append(
						"<td style=\"display:none;\">"
								+ customers[customer].buyerId + "</td>");
				$(tbody).append(tr);
				$(table).append(tbody);
			}
		}
	});
}
// 确定添加联系人到订单
var addCustomerToOrder = function() {
	// 改变联系人状态 true为保存 false为不保存
	$("#btnAddCustomer").attr("state", "false");

	var table = $("#listOfCustomers");
	var inputRadios = $(table).find("input");

	for ( var index in inputRadios) {
		if (inputRadios[index].checked == true) {
			var tds = $(inputRadios[index]).parent().parent().find("td");

			var receiverName = $("[name='receiverName']");
			$(receiverName).attr("id", $(tds[9]).text());
			$(receiverName).val($(tds[1]).text());

			var receiverMobile = $("[name='receiverMobile']");
			$(receiverMobile).val($(tds[2]).text());

			var receiverPhone = $("[name='receiverPhone']");
			$(receiverPhone).val($(tds[2]).text());

			var receiverZip = $("[name='receiverZip']");
			$(receiverZip).val($(tds[3]).text());

			var receiverState = document.getElementById("receiverState");
			var buttonState = receiverState.getElementsByTagName("button")[0];
			$(buttonState).text($(tds[5]).text());
			$(buttonState).attr("sql_id", $(tds[5]).attr("sql_id"));

			var receiverCity = document.getElementById("receiverCity");
			var buttonCity = receiverCity.getElementsByTagName("button")[0];
			$(buttonCity).text($(tds[6]).text());
			$(buttonCity).attr("sql_id", $(tds[6]).attr("sql_id"));

			var receiverDistrict = document.getElementById("receiverDistrict");
			var buttonDistrict = receiverDistrict
					.getElementsByTagName("button")[0];
			$(buttonDistrict).text($(tds[7]).text());
			$(buttonDistrict).attr("sql_id", $(tds[7]).attr("sql_id"));

			var receiverStreet = $("[ordertype='receiverStreet']");
			$(receiverStreet).val($(tds[8]).text());
		}
	}
}

// 商品模态框列表的ajax查询
var listOfProducts = function() {
	var select = $("#warehouseId");
	var warehouseId = $(select).val();

	var qualitysearchText = $("#qualitysearchText").val();

	var table = $("#listOfProducts");
	$
			.ajax({
				url : window.document.location.pathname.substring(0,
						window.document.location.pathname.substr(1)
								.indexOf('/') + 1)
						+ "/servlet/MethodServlet",
				type : "post",
				data : {
					method : "productQueryMethod",
					warehouseId : warehouseId,
					qualitysearchText : qualitysearchText
				},
				datatype : "json",
				success : function(result) {
					table[0].innerHTML = "";
					$(table)
							.append(
									"<thead class='table-bordered'>"
											+ "<tr>"
											+ "<th><input type='checkbox' onclick='checkAll()'></th>"
											+ "<th>商品图</th>" + "<th>SKU编码</th>"
											+ "<th>商品名称</th>" + "<th>属性</th>"
											+ "<th>库存</th>" + "</tr>"
											+ "</thead>");
					var products = result;
					for ( var product in products) {
						var tbody = document.createElement("tbody");
						$(tbody).attr("style", "font-weight: normal");
						var tr = document.createElement("tr");
						$(tr).append("<td><input type='checkbox'></td>");
						$(tr)
								.append(
										"<td><img src='"
												+ products[product].goodPicture
												+ "' alt='50x50' class='img-thumbnail' style='height: 50px; width: 50px;'></td>");
						$(tr).append(
								"<td class='fb'>" + products[product].sku
										+ "</td>");
						$(tr).append(
								"<td>" + products[product].goodName + "</td>");
						$(tr)
								.append(
										"<td>" + products[product].goodWeight
												+ "</td>");
						$(tr).append(
								"<td>" + products[product].goodRepertory
										+ "</td>");
						$(tr)
								.append(
										"<td style='display:none;'>"
												+ products[product].goodPrice
												+ "</td>");
						$(tr).append(
								"<td style='display:none;'>"
										+ products[product].goodId + "</td>");
						$(tr).append(
								"<td style='display:none;'>"
										+ products[product].goodWarehouseId
										+ "</td>");
						$(tbody).append(tr);
						$(table).append(tbody);
					}
				}
			});
}

// 监控联系人信息的控件是否改变了内容
var customerTextChange = function() {
	$("#btnAddCustomer").attr("state", "true");
}

// 存储联系人信息
var saveContact = function() {
	console.log("执行存储联系人");
	var receiverName = $("[name='receiverName']");
	var receiverNameStr = $(receiverName).val();
	console.log(receiverNameStr);

	var receiverMobile = $("[name='receiverMobile']");
	var receiverMobileStr = $(receiverMobile).val();
	console.log(receiverMobileStr);

	var receiverPhone = $("[name='receiverPhone']");
	var receiverPhoneStr = $(receiverPhone).val();
	console.log(receiverPhoneStr);

	var receiverZip = $("[name='receiverZip']");
	var receiverZipStr = $(receiverZip).val();

	var receiverState = document.getElementById("receiverState");
	var buttonState = receiverState.getElementsByTagName("button")[0];
	var buttonStateStr = $(buttonState).attr("sql_id");
	// 中文省份名字
	var addressProvince = $(buttonState).text();

	var receiverCity = document.getElementById("receiverCity");
	var buttonCity = receiverCity.getElementsByTagName("button")[0];
	var buttonCityStr = $(buttonCity).attr("sql_id");
	// 中文城市名字
	var addressCity = $(buttonCity).text();

	var receiverDistrict = document.getElementById("receiverDistrict");
	var buttonDistrict = receiverDistrict.getElementsByTagName("button")[0];
	var buttonDistrictStr = $(buttonDistrict).attr("sql_id");
	// 中文地区名字
	var addressLocation = $(buttonDistrict).text();

	var receiverStreet = $("[ordertype='receiverStreet']");
	var receiverStreetStr = $(receiverStreet).val();

	// 中文总地址
	var address = addressProvince + addressCity + addressLocation;

	$.ajax({
		url : window.document.location.pathname.substring(0,
				window.document.location.pathname.substr(1).indexOf('/') + 1)
				+ "/servlet/MethodServlet",
		type : "post",
		data : {
			method : "customerSaveMethod",
			buyer : receiverNameStr,
			tel : receiverMobileStr,
			phone : receiverPhoneStr,
			postcode : receiverZipStr,
			provice : buttonStateStr,
			city : buttonCityStr,
			district : buttonDistrictStr,
			location : receiverStreetStr,
			address : address
		},
		datatype : "json",
		success : function(result) {
			console.log(result)
			if (result.message != "0") {
				var receiverName = $("[name='receiverName']");
				$(receiverName).attr("id", result.message);
				$("#btnAddCustomer").attr("state", "false");
				warningShow("联系人存储成功！");
				setTimeout(function() {
					okWarningHide();
					submitOrderConitune();
				}, 1000);
			} else {
				warningShow("联系人存储失败!");
			}

		}
	});
}
//店铺名的显示
var dianpuming = function(event) {
	var divParent = $("#addOrder_dianpu");
	var span = $(divParent).find("span");
	$(span[0]).text($(event).text());
	$(span[0]).attr("shopId", $(event).attr("shopId"));
}
// 商铺查询
var shopQuery = function() {
	var divParent = $("#addOrder_dianpu");
	var span = $(divParent).find("span");
	var ul = $(divParent).find("ul");
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
					// console.log(result);
					ul[0].innerHTML = "";
					for ( var index in result) {
						if (index == 0) {
							$(ul)
									.append(
											"<li onclick='dianpuming(this)' class='selected' shopId='"
													+ result[index].shopId
													+ "'><a><span class='text'>"
													+ result[index].shopName
													+ "</span><i class='glyphicon glyphicon-ok icon-ok check-mark'></i></a></li>");
						} else {
							$(ul)
									.append(
											"<li onclick='dianpuming(this)' shopId='"
													+ result[index].shopId
													+ "'><a><span class='text'>"
													+ result[index].shopName
													+ "</span><i class='glyphicon glyphicon-ok icon-ok check-mark'></i></a></li>");
						}
					}
				}
			});
}
// 仓库查询
var wareHouseQuery = function() {
	var select = $("#warehouseId");

	$.ajax({
		url : window.document.location.pathname.substring(0,
				window.document.location.pathname.substr(1).indexOf('/') + 1)
				+ "/servlet/MethodServlet",
		type : "post",
		data : {
			method : "warehouseQueryMethod"
		},
		datatype : "json",
		success : function(results) {
			select[0].innerHTML = "";
			console.log(results.length);
			for ( var index=0;index<results.length;index++) {
				if (index == 0) {
					$(select).append(
							"<option selected='selected' value='"
									+ results[index].wareHouseId + "'>"
									+ results[index].wareHouseName
									+ "</option>");
				} else {
					$(select).append(
							"<option value='" + results[index].wareHouseId
									+ "'>" + results[index].wareHouseName
									+ "</option>");
				}
			}
		}
	});
}

window.onload = function() {
	wareHouseQuery();
	logisticQuery();
}
// checkBox 的全选功能
var checkAll = function() {
	var table = $("#listOfProducts");
	var inputs = $(table).find("input");

	if (inputs[0].checked) {
		for (var i = 1; i < inputs.length; i++) {
			inputs[i].checked = true;
		}
	} else {
		for (var i = 1; i < inputs.length; i++) {
			inputs[i].checked = false;
		}
	}
}
// 快递的查询
var logisticQuery = function() {
	var express = $("#express")[0];
	var ul = $(express).find("ul")[0];
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
					for ( var index in results) {
						if (index == 0) {
							$(ul)
									.append(
											"<li onclick='expressOnClick(this)' class='selected' logisticId='"
													+ results[index].logisticId
													+ "'><a><span class='text'>"
													+ results[index].logisticName
													+ "</span><i class='glyphicon glyphicon-ok icon-ok check-mark'></i></a></li>");
						} else {
							$(ul)
									.append(
											"<li onclick='expressOnClick(this)' logisticId='"
													+ results[index].logisticId
													+ "'><a><span class='text'>"
													+ results[index].logisticName
													+ "</span><i class='glyphicon glyphicon-ok icon-ok check-mark'></i></a></li>");
						}
					}
				}
			});

}
// 快递的选中显示
var expressOnClick = function(event) {
	var button = $("#express").find("button")[0];
	var span = $(button).find("span")[0];
	$(span).text($(event).text());
	$(span).attr("logisticId", $(event).attr("logisticId"));
}

// 提交订单
var submitOrder = function() {
	// 判断是否存储联系人
	var state = $("#btnAddCustomer").attr("state");
	console.log(state);
	if (state == "true") {
		saveContact();
	} else {
		submitOrderConitune();
	}
}
var submitOrderConitune = function() {
	var flag = true;

	// 订单类型（数据库中没有类型 ，再说）
	var btnOrderT = document.getElementById("btnOrderType");
	var orderType = $(btnOrderT).text();
	console.log("订单类型：" + orderType);
	// 店铺名称(数据库中存储的是shopId)
	var divParent = $("#addOrder_dianpu");
	var span = $(divParent).find("span");
	var shopId = $(span[0]).attr("shopId");
	console.log("店铺名称：" + shopId);
	if (shopId == undefined) {
		warningShow("请选择店铺！");
		flag = false;
		return;
	}
	// 付款方式(orderPayWay)
	var fukuanfangshi = document.getElementById("fukuanfangshiText");
	var orderPayWay = $(fukuanfangshi).text();
	console.log("付款方式：" + orderPayWay);
	// 订单号（可有可无）
	// 快递公司
	var button = $("#express").find("button")[0];
	var span = $(button).find("span")[0];
	var logisticId = $(span).attr("logisticId");
	console.log("物流公司：" + logisticId);
	if (logisticId == undefined) {
		warningShow("请选择快递公司！");
		flag = false;
		return;
	}
	// 商品总数量
	var orderGoodNum = $("#skuTotalQuantity").text();
	console.log("商品总数量：" + orderGoodNum);
	if (orderGoodNum == 0) {
		warningShow("请添加商品！");
		flag = false;
		return;
	}
	// 订单优惠
	var orderFee = $("#orderFee").val();
	if (orderFee == "") {
		orderFee = 0;
	}
	console.log("订单优惠:" + orderFee);
	// 商品总优惠
	skuTotalDiscount
	var orderFavorable = $("#skuTotalDiscount").text();
	console.log("商品总优惠:" + orderFavorable);
	// 商品总金额
	var shifu = $("#skuTotalFee").next().find("span");
	var orderPayMent = $(shifu).text();
	// 订单重量
	var orderWeight = $("#orderWeight").text();
	// 运费
	var orderFreight = $("#yunfei").val();
	console.log("运费:" + orderFreight);
	if (orderFreight == "") {
		warningShow("请输入运费！");
		flag = false;
		return;
	}
	// 订单总金额
	var orderTotal = eval(orderPayMent + "+" + orderFreight);
	// 卖家备注
	var orderSellerRemark = $("#maijiabeizhu").val();
	console.log("卖家备注：" + orderSellerRemark);
	if (orderSellerRemark == "") {
		warningShow("请填写备注！");
		flag = false;
		return;
	}
	// 买家Id
	var receiverName = $("[name='receiverName']");
	var buyerId = $(receiverName).attr("id");
	console.log("买家Id:" + buyerId);
	if (buyerId == undefined) {
		warningShow("请选择买家！");
		flag = false;
		return;
	}
	// 商品信息
	var productTable = $("#skuPanel").find("table")[0];
	var productTr = $(productTable).find("tr");

	var goodsInfo = new Array();
	for (var index = 1; index < productTr.length; index++) {
		console.log("goodId:" + $(productTr[index]).attr("goodid"));
		console.log("warehouseId:" + $(productTr[index]).attr("warehouseId"));
		console.log("detailsellPrice:"
				+ $($(productTr[index]).find("input")[0]).val());
		console.log("detailgoodNum:"
				+ $($(productTr[index]).find("input")[1]).val());
		console.log("detailGoodPrivilege:"
				+ $($(productTr[index]).find("input")[3]).val());
		console.log("detailTotal:"
				+ $($(productTr[index]).find("td")[8]).text());
		console.log("goodprice:" + $(productTr[index]).attr("goodprice"));
		console.log("----------------------------------");
		var goodInfo = {
			"goodId" : $(productTr[index]).attr("goodid"),
			"warehouseId" : $(productTr[index]).attr("warehouseId"),
			"detailsellPrice" : $($(productTr[index]).find("input")[0]).val(),
			"detailgoodNum" : $($(productTr[index]).find("input")[1]).val(),
			"detailGoodPrivilege" : $($(productTr[index]).find("input")[3])
					.val(),
			"detailTotal" : $($(productTr[index]).find("td")[8]).text(),
			"goodprice" : $(productTr[index]).attr("goodprice")
		};
		goodsInfo.push(goodInfo);
	}
	$.ajax({
		url : window.document.location.pathname.substring(0,
				window.document.location.pathname.substr(1).indexOf('/') + 1)
				+ "/servlet/MethodServlet",
		type : "post",
		data : {
			method : "orderSaveMethod",
			orderInfo : JSON.stringify({
				"orderType" : orderType,
				"shopId" : shopId,
				"orderPayWay" : orderPayWay,
				"logisticId" : logisticId,
				"orderFee" : orderFee,
				"orderFreight" : orderFreight,
				"orderSellerRemark" : orderSellerRemark,
				"buyerId" : buyerId,
				"orderFavorable" : orderFavorable,
				"orderGoodNum" : orderGoodNum,
				"orderPayMent" : orderPayMent,
				"orderWeight" : orderWeight,
				"orderTotal" : orderTotal
			}),
			goodInfo : JSON.stringify(goodsInfo)
		},
		datatype : "json",
		success : function(result) {
			console.log("order" + result);

			if (result[0] == true) {
				location.href = window.document.location.pathname.substring(0,
						window.document.location.pathname.substr(1)
								.indexOf('/') + 1)
						+ "/servlet/DdcxMethodServlet?method=ddcx";
			} else {
				warningShow("添加失败，请重新添加！");
			}

		}
	});
}//提示框的显示
var warningShow = function(text) {
	$("#warningText").text(text);
	$("#warningComp").show();
}
//提示框的隐藏
var okWarningHide = function() {
	$("#warningComp").hide();
}
